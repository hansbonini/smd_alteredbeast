package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"math/big"
	"os"
)

func main() {
	var err error
	gfx_src := int64(0)
	rom_src := os.Args[1]
	rom_dest := os.Args[2]
	if len(os.Args) > 2 {
		temp := new(big.Int)
		temp.SetString(os.Args[3], 0)
		gfx_src = temp.Int64()
	}

	rom, err := os.Open(rom_src)
	if err != nil {
		panic(err)
	}
	defer rom.Close()

	decomp, err := os.Create(rom_dest)
	if err != nil {
		panic(err)
	}

	rom.Seek(int64(gfx_src), 0)

	output := make([]byte, 0)
	readed := make([]byte, 1)
	tmp := make([]byte, 1)
	data := make([]byte, 5)
	window := make([]byte, 0x20)
	rom.Read(readed)
	for readed[0] != byte(0xFF) {
		var pattern uint32
		for x := uint8(0); x < readed[0]; x++ {
			_, err := rom.Read(data)
			if err == io.EOF {
				break
			}
			a := data[0]
			b := binary.BigEndian.Uint32(data[1:])
			pattern |= b
			k := 0
			for y := 0x1F; y >= 0; y-- {
				bit := (b >> y) & 0x1
				if bit&0x1 == 1 {
					window[k] = a
				}
				k++
			}
		}

		x := 0
		if pattern != 0xFFFFFFFF {
			for y := 0x1F; y >= 0x0; y-- {
				bit := (pattern >> y) & 0x1
				if bit&0x1 == 0 {
					_, err := rom.Read(tmp)
					if err == io.EOF {
						break
					}
					window[x] = tmp[0]
				}
				x++
			}
		}

		output = append(output, window...)

		_, err := rom.Read(readed)
		if err == io.EOF {
			break
		}
	}

	current, _ := rom.Seek(0, io.SeekCurrent)
	fmt.Printf("%08x\n", current)

	decomp.Write(output)

}
