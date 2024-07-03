package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"math/big"
	"math/bits"
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
			for y := 0; y < 0x20; y++ {
				_, bit := bits.Add32(b, b, 0)
				b += b
				if bit&0x1 == 1 {
					window[y] = a
				}
			}
		}

		x := 0
		pattern2 := 0xFFFFFFFF ^ pattern
		if pattern2 != 0 {
			for y := 0; y < 0x20; y++ {
				_, bit := bits.Add32(pattern, pattern, 0)
				pattern += pattern
				if bit&0x1 == 1 {
					x++
				} else {
					rom.Read(tmp)
					window[x] = tmp[0]
					x++
				}
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
