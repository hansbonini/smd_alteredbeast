package main

import (
	"encoding/binary"
	"os"
	"slices"
)

func main() {
	var err error
	rom_src := os.Args[1]
	out_dest := os.Args[2]

	rom, err := os.Open(rom_src)
	if err != nil {
		panic(err)
	}
	defer rom.Close()

	out, err := os.Create(out_dest)
	if err != nil {
		panic(err)
	}
	defer out.Close()

	window := make([]byte, 0x20)
	for {
		stats := make(map[byte]int)
		candidates := make(map[byte]int)
		patterns := make(map[byte]uint32)

		// Read a chunk of 0x20 bytes
		err := binary.Read(rom, binary.BigEndian, &window)
		if err != nil {
			break
		}

		// Count bytes repetition on chunk of 0x20 bytes
		for _, b := range window {
			stats[b]++
		}
		statsKeys := make([]byte, 0, len(stats))
		for b := range stats {
			statsKeys = append(statsKeys, b)
		}

		// To be a candidate needs to have value greater or equal 6
		for k := range statsKeys {
			if stats[statsKeys[k]] > 5 {
				candidates[statsKeys[k]] = stats[statsKeys[k]]
			}
		}

		// Get patterns for each candidate
		for _, b := range window {
			for k, _ := range candidates {
				patterns[k] <<= 1
				if b == k {
					patterns[k] |= 1
				} else {
					patterns[k] |= 0
				}
			}
		}

		// Get ocurrence order of repeats
		ocurrenceOrder := make([]byte, 0)
		for _, v := range window {
			for c, _ := range candidates {
				if v == c {
					if !slices.Contains(ocurrenceOrder, v) {
						ocurrenceOrder = append(ocurrenceOrder, v)
					}
				}
			}
			if len(ocurrenceOrder) == len(candidates) {
				break
			}
		}

		// Add compressed chain to output
		chain := make([]byte, 0)
		chain = append(chain, byte(len(candidates)))
		nonrepeat := uint32(0)
		for k := range ocurrenceOrder {
			if v, ok := patterns[ocurrenceOrder[k]]; ok {
				chain = append(chain, ocurrenceOrder[k])
				chain = binary.BigEndian.AppendUint32(chain, v)
				nonrepeat |= v
			}
		}
		if nonrepeat != 0xFFFFFFFF {
			for k, v := range window {
				bit := ((nonrepeat << k) >> 31) & 0x1
				if bit == 0 {
					chain = append(chain, v)
				}
			}
		}
		out.Write(chain)
	}
	// Add EOF compression to output
	out.Write([]byte{0xFF})

}
