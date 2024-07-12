package main

import (
	"bufio"
	"log"
	"os"
	"strconv"

	"github.com/go-audio/audio"
	"github.com/go-audio/wav"
)

func main() {
	wav_src := os.Args[1]
	pcm_dest := os.Args[2]
	freq, _ := strconv.ParseInt(os.Args[3], 10, 0)

	in, err := os.Open(wav_src)
	if err != nil {
		log.Fatal(err)
	}

	out, err := os.Create(pcm_dest)
	if err != nil {
		log.Fatal(err)
	}
	defer out.Close()

	e := wav.NewDecoder(in)

	bfo := bufio.NewWriter(out)
	buf := &audio.IntBuffer{
		Format: &audio.Format{
			NumChannels: 1,
			SampleRate:  int(freq),
		},
		Data:           make([]int, 2048),
		SourceBitDepth: 8,
	}
	chunk := make([]byte, 2048)

	err = e.FwdToPCM()
	if err != nil {
		log.Fatal(err)
	}

	n, err := e.PCMBuffer(buf)
	if err != nil {
		log.Fatal(err)
	}
	for n > 0 {
		k := 0
		p := 0
		for i := 0; i < n; i++ {
			chunk[k] = byte(buf.Data[p])
			k++
			p++
		}

		_, err = bfo.Write(chunk[0:k])
		if err != nil {
			log.Fatal(err)
		}

		n, err = e.PCMBuffer(buf)
		if err != nil {
			log.Fatal(err)
		}
	}
	bfo.Flush()

}
