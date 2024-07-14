package main

import (
	"image"
	"image/color"
	"image/png"
	"io"
	"log"
	"os"
	"strconv"
)

type MDColor struct {
	Value uint16
	R     int
	G     int
	B     int
	A     int
}

type MDPalette struct {
	Colors []MDColor
}

type MDTiles struct {
	Data   []byte
	Width  int
	Height int
	Bpp    int
}

type ROM struct {
	Filename string
	Data     []byte
	Size     int
	Offset   int
}

func (rom *ROM) Init() error {
	file, err := os.Open(rom.Filename)
	if err != nil {
		return err
	}
	defer file.Close()

	info, err := file.Stat()
	if err != nil {
		return err
	}
	rom.Size = int(info.Size())

	data := make([]byte, rom.Size)
	_, err = file.Read(data)
	if err != nil {
		return err
	}
	rom.Data = data

	return nil
}

func (rom *ROM) Read8() (value uint8, err error) {
	if rom.Offset < rom.Size {
		value = rom.Data[rom.Offset]
		rom.Offset += 1
	} else {
		err = io.EOF
	}
	return
}

func (rom *ROM) Read16() (value uint16, err error) {
	if rom.Offset+1 < rom.Size {
		value = uint16(rom.Data[rom.Offset])<<8 | uint16(rom.Data[rom.Offset+1])
		rom.Offset += 2
	} else {
		err = io.EOF
	}
	return
}

func (rom *ROM) Read32() (value uint32, err error) {
	if rom.Offset+3 < rom.Size {
		value = uint32(rom.Data[rom.Offset])<<24 | uint32(rom.Data[rom.Offset+1])<<16 | uint32(rom.Data[rom.Offset+2])<<8 | uint32(rom.Data[rom.Offset+3])
		rom.Offset += 4
	} else {
		err = io.EOF
	}
	return
}

func (mdcolor *MDColor) Init() {
	mdcolor.R = int((mdcolor.Value & 0x000E) >> 1)
	mdcolor.G = int((mdcolor.Value & 0x00E0) >> 5)
	mdcolor.B = int((mdcolor.Value & 0x0E00) >> 9)
	mdcolor.A = 255
}

func (mdcolor *MDColor) toRGB() []uint8 {
	return []uint8{uint8(mdcolor.R << 5), uint8(mdcolor.G << 5), uint8(mdcolor.B << 5), uint8(mdcolor.A)}
}

func (tiles *MDTiles) Init(data []byte) {
	tiles.Data = make([]byte, len(data)*2)
	for k, v := range data {
		tiles.Data[k*2] = v >> 4
		tiles.Data[k*2+1] = v & 0xF
	}
}

func (tiles *MDTiles) ReadPixel(x, y int) (value byte) {
	tx := (x%8 + ((x / 8) * (tiles.Bpp * 8 * (64 / (tiles.Bpp * 8)))))
	ty := ((y % 8) * 8) + ((y / 8) * (tiles.Width * tiles.Bpp * 8 * (64 / (tiles.Bpp * 8))))
	if tx+ty < len(tiles.Data) {
		value = tiles.Data[tx+ty]
	}
	return
}

func (tiles *MDTiles) toPNG(mdpalette MDPalette) (img *image.RGBA) {
	rect := image.Rect(0, 0, tiles.Width*8, tiles.Height*8)
	img = image.NewRGBA(rect)

	for y := 0; y < tiles.Height*8; y++ {
		for x := 0; x < tiles.Width*8; x++ {
			pixel := tiles.ReadPixel(x, y)
			rgba := mdpalette.Colors[pixel].toRGB()
			img.Set(x, y, color.RGBA{rgba[0], rgba[1], rgba[2], rgba[3]})
		}
	}
	return
}

func main() {
	var err error

	rom := ROM{
		Filename: os.Args[1],
	}
	err = rom.Init()
	if err != nil {
		log.Fatal(err)
	}

	pal := ROM{
		Filename: os.Args[3],
	}
	err = pal.Init()
	if err != nil {
		log.Fatal(err)
	}

	out, err := os.Create(os.Args[2])
	if err != nil {
		log.Fatal(err)
	}

	skip := 0
	if len(os.Args) > 4 {
		tmp, err := strconv.ParseInt(os.Args[4], 10, 0)
		if err != nil {
			log.Fatal(err)
		}
		skip = int(tmp)
	}

	index := 0
	if len(os.Args) > 5 {
		tmp, err := strconv.ParseInt(os.Args[5], 10, 0)
		if err != nil {
			log.Fatal(err)
		}
		index = int(tmp)
	}

	transparency := 0
	if len(os.Args) > 6 {
		tmp, err := strconv.ParseInt(os.Args[6], 10, 0)
		if err != nil {
			log.Fatal(err)
		}
		transparency = int(tmp)
	}

	mdpalette := convertToPalette(&pal, skip, index, transparency)
	mdtiles := MDTiles{Bpp: 4, Width: 16}
	min := 0
	if rom.Size%(mdtiles.Width*mdtiles.Bpp*8) > 0 {
		min = 1
	}
	mdtiles.Height = min + rom.Size/(mdtiles.Width*mdtiles.Bpp*8)
	mdtiles.Init(rom.Data)
	err = png.Encode(out, mdtiles.toPNG(mdpalette))
	if err != nil {
		log.Fatal(err)
	}
}

func convertToPalette(pal *ROM, skip int, index int, transparency int) (mdpalette MDPalette) {
	pal.Offset = skip
	mdpalette.Colors = make([]MDColor, 16)
	for k := index; k < 16; k++ {
		rawcolor, err := pal.Read16()
		if err != nil {
			break
		}
		mdcolor := MDColor{Value: rawcolor}
		mdcolor.Init()
		mdcolor.toRGB()
		if k == transparency {
			mdcolor.A = 0
		}
		mdpalette.Colors[k] = mdcolor
	}
	return
}
