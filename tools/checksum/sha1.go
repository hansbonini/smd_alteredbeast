package main

import (
	"crypto/sha1"
	"encoding/hex"
	"fmt"
	"log"
	"os"
	"strings"
)

func main() {
	var err error
	rom_src := os.Args[1]
	rom_sha1 := os.Args[2]

	rom, err := os.ReadFile(rom_src)
	if err != nil {
		panic(err)
	}

	hasher := sha1.New()
	hasher.Write(rom)
	if err != nil {
		panic(err)
	}

	if hex.EncodeToString(hasher.Sum(nil)) != strings.ToLower(rom_sha1) {
		log.Fatal("Invalid SHA1")
	}

	fmt.Print(hex.EncodeToString(hasher.Sum(nil)))
}
