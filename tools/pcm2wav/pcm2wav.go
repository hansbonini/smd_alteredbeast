package main

import (
	"encoding/binary"
	"fmt"
	"io"
	"log"
	"os"
	"strconv"

	"github.com/go-audio/audio"
	"github.com/go-audio/wav"
)

func main() {
	pcm_src := os.Args[1]
	wav_dest := os.Args[2]
	freq, _ := strconv.ParseInt(os.Args[3], 10, 0)

	in, err := os.Open(pcm_src)
	if err != nil {
		log.Fatal(err)
	}

	out, err := os.Create(wav_dest)
	if err != nil {
		log.Fatal(err)
	}
	defer out.Close()

	fmt.Print(int(freq))

	e := wav.NewEncoder(out, int(freq), 8, 1, 1)

	audioBuf, err := newAudioIntBuffer(in, int(freq))
	if err != nil {
		log.Fatal(err)
	}

	if err := e.Write(audioBuf); err != nil {
		log.Fatal(err)
	}
	if err := e.Close(); err != nil {
		log.Fatal(err)
	}
}

func newAudioIntBuffer(r io.Reader, freq int) (*audio.IntBuffer, error) {
	buf := audio.IntBuffer{
		Format: &audio.Format{
			NumChannels: 1,
			SampleRate:  int(freq),
		},
	}
	for {
		var sample int8
		err := binary.Read(r, binary.LittleEndian, &sample)
		switch {
		case err == io.EOF:
			return &buf, nil
		case err != nil:
			return nil, err
		}
		buf.Data = append(buf.Data, int(sample))
	}
}
