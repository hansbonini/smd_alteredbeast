# Binaries	
REGION						?= UE
VERSION						?= REV02
NAME						?= Altered Beast
ROM_UE_REV02				?= Altered Beast (USA, Europe).md
SHA1						?= 38945360D824D2FB9535B4FD7F25B9AA9B32F019
WORKSPACE					:= .

# Directories
AUDIO_DIR					:= $(WORKSPACE)/audio
BUILD_DIR					:= $(WORKSPACE)/build
GFX_DIR 					:= $(WORKSPACE)/gfx
INCLUDES_DIR				:= $(WORKSPACE)/includes
ROM_DIR						:= $(WORKSPACE)/rom
TOOLS_DIR					:= $(WORKSPACE)/tools
Z80_DIR						:= $(WORKSPACE)/z80
RETROARCH_DIR   			:= $(TOOLS_DIR)/RetroArch-Win64

# Tooling
ASM68K 						:= $(TOOLS_DIR)/asm68k/asm68k.exe
ASM68K_SWITCHES 			?= /m /p /k
GO							:= go run
GFXDUMP						:= $(TOOLS_DIR)/gfxdump/gfxdump.go
GRPUNDMP					:= $(TOOLS_DIR)/grpundmp/grpundmp.exe
SEGARD_COMP					:= $(TOOLS_DIR)/segard_comp/comp.go
SEGARD_DECOMP				:= $(TOOLS_DIR)/segard_decomp/decomp.go
NEMESIS_COMP				:= $(TOOLS_DIR)/clownnemesis/clownnemesis.exe
NEMESIS_DECOMP				:= $(TOOLS_DIR)/clownnemesis/clownnemesis.exe
PCM2WAV						:= $(TOOLS_DIR)/pcm2wav/pcm2wav.go
SHA1CHECK					:= $(TOOLS_DIR)/checksum/sha1.go
RETROARCH 					:= $(RETROARCH_DIR)/retroarch.exe
RETROARCH_CORE_BLASTEM 		:= $(RETROARCH_DIR)/cores/blastem_libretro.dll
RETROARCH_CORE_GPGX			:= $(RETROARCH_DIR)/cores/genesis_plus_gx_libretro.dll
RETROARCH_CORE_PICODRIVE 	:= $(RETROARCH_DIR)/cores/picodrive_libretro.dll
SPLITROM 					:= $(TOOLS_DIR)/splitrom/splitrom.exe
SJASMPLUS					:= $(TOOLS_DIR)/sjasmplus/sjasmplus.exe
WAV2PCM						:= $(TOOLS_DIR)/wav2pcm/wav2pcm.go

all: extract build
build: wav2pcm z80_assemble 68k_assemble_palettes png2gfx nemesis_comp segard_comp 68k_assemble sha1
wav2pcm:
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/000138EC.wav" $(AUDIO_DIR)/pcm/000138EC.pcm 8000
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/0001552C.wav" $(AUDIO_DIR)/pcm/0001552C.pcm 4000
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/000173B4.wav" $(AUDIO_DIR)/pcm/000173B4.pcm 4000
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/0001AFD4.wav" $(AUDIO_DIR)/pcm/0001AFD4.pcm 4000
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/0001CF56.wav" $(AUDIO_DIR)/pcm/0001CF56.pcm 4000
	$(GO) $(WAV2PCM) "$(AUDIO_DIR)/pcm/0001EED8.wav" $(AUDIO_DIR)/pcm/0001EED8.pcm 4000
png2gfx:
#	$(GRPUNDMP) $(GFX_DIR)/0000BD72.png $(GFX_DIR)/0000BD72.smd -p $(INCLUDES_DIR)/palettes/0000BCB4.bin
#	fsutil file seteof $(GFX_DIR)/0000BD72.smd 160
#	$(GRPUNDMP) $(GFX_DIR)/00009FB4.png $(GFX_DIR)/00009FB4.smd -p $(INCLUDES_DIR)/palettes/00009F94.bin
#	fsutil file seteof $(GFX_DIR)/00009FB4.smd 1568
#	$(GRPUNDMP) $(GFX_DIR)/nemesis/0004C600.png $(GFX_DIR)/nemesis/0004C600.smd -p $(INCLUDES_DIR)/palettes/0000BD10.bin
#	$(GRPUNDMP) $(GFX_DIR)/segard/00024000.png $(GFX_DIR)/segard/00024000.smd -p $(INCLUDES_DIR)/palettes/0000BD4A.bin
#	$(GRPUNDMP) $(GFX_DIR)/segard/00027DDA.png $(GFX_DIR)/segard/00027DDA.smd -p $(INCLUDES_DIR)/palettes/00027DB8.bin
#	fsutil file seteof $(GFX_DIR)/segard/00027DDA.smd 15424
#	$(GRPUNDMP) $(GFX_DIR)/segard/0004D24E.png $(GFX_DIR)/segard/0004D24E.smd -p $(INCLUDES_DIR)/palettes/0000BD5A.bin
#	fsutil file seteof $(GFX_DIR)/segard/0004D24E.smd 1600
#	$(GRPUNDMP) $(GFX_DIR)/segard/0004D64E.png $(GFX_DIR)/segard/0004D64E.smd -p $(INCLUDES_DIR)/palettes/0000BD4A.bin
#	fsutil file seteof $(GFX_DIR)/segard/0004D64E.smd 29472
#	$(GRPUNDMP) $(GFX_DIR)/segard/00052A0A.png $(GFX_DIR)/segard/00052A0A.smd -p $(INCLUDES_DIR)/palettes/0000B864.bin
#	fsutil file seteof $(GFX_DIR)/segard/00052A0A.smd 1760
nemesis_comp:
#	$(NEMESIS_COMP) -ca $(GFX_DIR)/nemesis/0004C600.smd $(GFX_DIR)/0004C600.smd
segard_comp:
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00024000.smd $(GFX_DIR)/00024000.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00027DDA.smd $(GFX_DIR)/00027DDA.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0002ACEA.smd $(GFX_DIR)/0002ACEA.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0002D1AA.smd $(GFX_DIR)/0002D1AA.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0002F1F4.smd $(GFX_DIR)/0002F1F4.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00030E70.smd $(GFX_DIR)/00030E70.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00033AAA.smd $(GFX_DIR)/00033AAA.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0003565C.smd $(GFX_DIR)/0003565C.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00038A2E.smd $(GFX_DIR)/00038A2E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0003BA00.smd $(GFX_DIR)/0003BA00.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0003DFE0.smd $(GFX_DIR)/0003DFE0.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00040A1C.smd $(GFX_DIR)/00040A1C.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004195C.smd $(GFX_DIR)/0004195C.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00041AB8.smd $(GFX_DIR)/00041AB8.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00041EC8.smd $(GFX_DIR)/00041EC8.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004270A.smd $(GFX_DIR)/0004270A.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00042E7C.smd $(GFX_DIR)/00042E7C.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/000435E2.smd $(GFX_DIR)/000435E2.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00043F22.smd $(GFX_DIR)/00043F22.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004479E.smd $(GFX_DIR)/0004479E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00044DA2.smd $(GFX_DIR)/00044DA2.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004547A.smd $(GFX_DIR)/0004547A.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00045DAC.smd $(GFX_DIR)/00045DAC.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/000463DC.smd $(GFX_DIR)/000463DC.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/000470D8.smd $(GFX_DIR)/000470D8.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/000476C6.smd $(GFX_DIR)/000476C6.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00047F56.smd $(GFX_DIR)/00047F56.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00048452.smd $(GFX_DIR)/00048452.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00049020.smd $(GFX_DIR)/00049020.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004A30E.smd $(GFX_DIR)/0004A30E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004AAEE.smd $(GFX_DIR)/0004AAEE.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004B00A.smd $(GFX_DIR)/0004B00A.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004B3A4.smd $(GFX_DIR)/0004B3A4.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004D24E.smd $(GFX_DIR)/0004D24E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0004D64E.smd $(GFX_DIR)/0004D64E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00052A0A.smd $(GFX_DIR)/00052A0A.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00058562.smd $(GFX_DIR)/00058562.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00059A74.smd $(GFX_DIR)/00059A74.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00059EE8.smd $(GFX_DIR)/00059EE8.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00060280.smd $(GFX_DIR)/00060280.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/00060B66.smd $(GFX_DIR)/00060B66.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007E370.smd $(GFX_DIR)/0007E370.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007E5EC.smd $(GFX_DIR)/0007E5EC.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007EA8C.smd $(GFX_DIR)/0007EA8C.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007EF12.smd $(GFX_DIR)/0007EF12.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007F00E.smd $(GFX_DIR)/0007F00E.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007F4C6.smd $(GFX_DIR)/0007F4C6.smd
# $(GO) $(SEGARD_COMP) $(GFX_DIR)/segard/0007F8B6.smd $(GFX_DIR)/0007F8B6.smd
z80_assemble:
	$(SJASMPLUS) --raw="$(Z80_DIR)/sounddriver.bin" --lst="$(Z80_DIR)/sounddriver.txt" "$(Z80_DIR)/sounddriver.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver1.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver1.txt" "$(Z80_DIR)/pcm_driver/pcm_driver1.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver2.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver2.txt" "$(Z80_DIR)/pcm_driver/pcm_driver2.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver3.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver3.txt" "$(Z80_DIR)/pcm_driver/pcm_driver3.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver4.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver4.txt" "$(Z80_DIR)/pcm_driver/pcm_driver4.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver5.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver5.txt" "$(Z80_DIR)/pcm_driver/pcm_driver5.asm"
	$(SJASMPLUS) --raw="$(Z80_DIR)/pcm_driver/pcm_driver6.bin" --lst="$(Z80_DIR)/pcm_driver/pcm_driver6.txt" "$(Z80_DIR)/pcm_driver/pcm_driver6.asm"
68k_assemble_palettes:
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00000C2C.asm","$(INCLUDES_DIR)/palettes/00000C2C.bin",,"$(INCLUDES_DIR)/palettes/00000C2C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00000C3A.asm","$(INCLUDES_DIR)/palettes/00000C3A.bin",,"$(INCLUDES_DIR)/palettes/00000C3A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000010C6.asm","$(INCLUDES_DIR)/palettes/000010C6.bin",,"$(INCLUDES_DIR)/palettes/000010C6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000010D0.asm","$(INCLUDES_DIR)/palettes/000010D0.bin",,"$(INCLUDES_DIR)/palettes/000010D0.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000015BC.asm","$(INCLUDES_DIR)/palettes/000015BC.bin",,"$(INCLUDES_DIR)/palettes/000015BC.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000015CA.asm","$(INCLUDES_DIR)/palettes/000015CA.bin",,"$(INCLUDES_DIR)/palettes/000015CA.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000015D8.asm","$(INCLUDES_DIR)/palettes/000015D8.bin",,"$(INCLUDES_DIR)/palettes/000015D8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000015E6.asm","$(INCLUDES_DIR)/palettes/000015E6.bin",,"$(INCLUDES_DIR)/palettes/000015E6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000015F4.asm","$(INCLUDES_DIR)/palettes/000015F4.bin",,"$(INCLUDES_DIR)/palettes/000015F4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001602.asm","$(INCLUDES_DIR)/palettes/00001602.bin",,"$(INCLUDES_DIR)/palettes/00001602.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001B56.asm","$(INCLUDES_DIR)/palettes/00001B56.bin",,"$(INCLUDES_DIR)/palettes/00001B56.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001B66.asm","$(INCLUDES_DIR)/palettes/00001B66.bin",,"$(INCLUDES_DIR)/palettes/00001B66.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001B76.asm","$(INCLUDES_DIR)/palettes/00001B76.bin",,"$(INCLUDES_DIR)/palettes/00001B76.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001B86.asm","$(INCLUDES_DIR)/palettes/00001B86.bin",,"$(INCLUDES_DIR)/palettes/00001B86.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001B96.asm","$(INCLUDES_DIR)/palettes/00001B96.bin",,"$(INCLUDES_DIR)/palettes/00001B96.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001BA6.asm","$(INCLUDES_DIR)/palettes/00001BA6.bin",,"$(INCLUDES_DIR)/palettes/00001BA6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001BB6.asm","$(INCLUDES_DIR)/palettes/00001BB6.bin",,"$(INCLUDES_DIR)/palettes/00001BB6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001BC6.asm","$(INCLUDES_DIR)/palettes/00001BC6.bin",,"$(INCLUDES_DIR)/palettes/00001BC6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00001BD6.asm","$(INCLUDES_DIR)/palettes/00001BD6.bin",,"$(INCLUDES_DIR)/palettes/00001BD6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000021D4.asm","$(INCLUDES_DIR)/palettes/000021D4.bin",,"$(INCLUDES_DIR)/palettes/000021D4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000021F2.asm","$(INCLUDES_DIR)/palettes/000021F2.bin",,"$(INCLUDES_DIR)/palettes/000021F2.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00002210.asm","$(INCLUDES_DIR)/palettes/00002210.bin",,"$(INCLUDES_DIR)/palettes/00002210.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000222E.asm","$(INCLUDES_DIR)/palettes/0000222E.bin",,"$(INCLUDES_DIR)/palettes/0000222E.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00003FDC.asm","$(INCLUDES_DIR)/palettes/00003FDC.bin",,"$(INCLUDES_DIR)/palettes/00003FDC.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00003FF2.asm","$(INCLUDES_DIR)/palettes/00003FF2.bin",,"$(INCLUDES_DIR)/palettes/00003FF2.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004008.asm","$(INCLUDES_DIR)/palettes/00004008.bin",,"$(INCLUDES_DIR)/palettes/00004008.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000401E.asm","$(INCLUDES_DIR)/palettes/0000401E.bin",,"$(INCLUDES_DIR)/palettes/0000401E.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004034.asm","$(INCLUDES_DIR)/palettes/00004034.bin",,"$(INCLUDES_DIR)/palettes/00004034.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004048.asm","$(INCLUDES_DIR)/palettes/00004048.bin",,"$(INCLUDES_DIR)/palettes/00004048.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000405C.asm","$(INCLUDES_DIR)/palettes/0000405C.bin",,"$(INCLUDES_DIR)/palettes/0000405C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004070.asm","$(INCLUDES_DIR)/palettes/00004070.bin",,"$(INCLUDES_DIR)/palettes/00004070.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004082.asm","$(INCLUDES_DIR)/palettes/00004082.bin",,"$(INCLUDES_DIR)/palettes/00004082.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00004094.asm","$(INCLUDES_DIR)/palettes/00004094.bin",,"$(INCLUDES_DIR)/palettes/00004094.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000040A8.asm","$(INCLUDES_DIR)/palettes/000040A8.bin",,"$(INCLUDES_DIR)/palettes/000040A8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000040BE.asm","$(INCLUDES_DIR)/palettes/000040BE.bin",,"$(INCLUDES_DIR)/palettes/000040BE.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000618E.asm","$(INCLUDES_DIR)/palettes/0000618E.bin",,"$(INCLUDES_DIR)/palettes/0000618E.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008EBE.asm","$(INCLUDES_DIR)/palettes/00008EBE.bin",,"$(INCLUDES_DIR)/palettes/00008EBE.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008ECE.asm","$(INCLUDES_DIR)/palettes/00008ECE.bin",,"$(INCLUDES_DIR)/palettes/00008ECE.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008EDC.asm","$(INCLUDES_DIR)/palettes/00008EDC.bin",,"$(INCLUDES_DIR)/palettes/00008EDC.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008EE8.asm","$(INCLUDES_DIR)/palettes/00008EE8.bin",,"$(INCLUDES_DIR)/palettes/00008EE8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008EF2.asm","$(INCLUDES_DIR)/palettes/00008EF2.bin",,"$(INCLUDES_DIR)/palettes/00008EF2.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008EFA.asm","$(INCLUDES_DIR)/palettes/00008EFA.bin",,"$(INCLUDES_DIR)/palettes/00008EFA.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F00.asm","$(INCLUDES_DIR)/palettes/00008F00.bin",,"$(INCLUDES_DIR)/palettes/00008F00.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F22.asm","$(INCLUDES_DIR)/palettes/00008F22.bin",,"$(INCLUDES_DIR)/palettes/00008F22.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F32.asm","$(INCLUDES_DIR)/palettes/00008F32.bin",,"$(INCLUDES_DIR)/palettes/00008F32.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F42.asm","$(INCLUDES_DIR)/palettes/00008F42.bin",,"$(INCLUDES_DIR)/palettes/00008F42.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F52.asm","$(INCLUDES_DIR)/palettes/00008F52.bin",,"$(INCLUDES_DIR)/palettes/00008F52.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F62.asm","$(INCLUDES_DIR)/palettes/00008F62.bin",,"$(INCLUDES_DIR)/palettes/00008F62.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F72.asm","$(INCLUDES_DIR)/palettes/00008F72.bin",,"$(INCLUDES_DIR)/palettes/00008F72.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00008F82.asm","$(INCLUDES_DIR)/palettes/00008F82.bin",,"$(INCLUDES_DIR)/palettes/00008F82.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D00.asm","$(INCLUDES_DIR)/palettes/00009D00.bin",,"$(INCLUDES_DIR)/palettes/00009D00.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D04.asm","$(INCLUDES_DIR)/palettes/00009D04.bin",,"$(INCLUDES_DIR)/palettes/00009D04.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D14.asm","$(INCLUDES_DIR)/palettes/00009D14.bin",,"$(INCLUDES_DIR)/palettes/00009D14.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D22.asm","$(INCLUDES_DIR)/palettes/00009D22.bin",,"$(INCLUDES_DIR)/palettes/00009D22.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D30.asm","$(INCLUDES_DIR)/palettes/00009D30.bin",,"$(INCLUDES_DIR)/palettes/00009D30.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D3E.asm","$(INCLUDES_DIR)/palettes/00009D3E.bin",,"$(INCLUDES_DIR)/palettes/00009D3E.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D4C.asm","$(INCLUDES_DIR)/palettes/00009D4C.bin",,"$(INCLUDES_DIR)/palettes/00009D4C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D5A.asm","$(INCLUDES_DIR)/palettes/00009D5A.bin",,"$(INCLUDES_DIR)/palettes/00009D5A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D68.asm","$(INCLUDES_DIR)/palettes/00009D68.bin",,"$(INCLUDES_DIR)/palettes/00009D68.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D76.asm","$(INCLUDES_DIR)/palettes/00009D76.bin",,"$(INCLUDES_DIR)/palettes/00009D76.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D7A.asm","$(INCLUDES_DIR)/palettes/00009D7A.bin",,"$(INCLUDES_DIR)/palettes/00009D7A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009D9C.asm","$(INCLUDES_DIR)/palettes/00009D9C.bin",,"$(INCLUDES_DIR)/palettes/00009D9C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009DB0.asm","$(INCLUDES_DIR)/palettes/00009DB0.bin",,"$(INCLUDES_DIR)/palettes/00009DB0.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009DC2.asm","$(INCLUDES_DIR)/palettes/00009DC2.bin",,"$(INCLUDES_DIR)/palettes/00009DC2.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009DD6.asm","$(INCLUDES_DIR)/palettes/00009DD6.bin",,"$(INCLUDES_DIR)/palettes/00009DD6.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009F6C.asm","$(INCLUDES_DIR)/palettes/00009F6C.bin",,"$(INCLUDES_DIR)/palettes/00009F6C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00009F94.asm","$(INCLUDES_DIR)/palettes/00009F94.bin",,"$(INCLUDES_DIR)/palettes/00009F94.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000AD54.asm","$(INCLUDES_DIR)/palettes/0000AD54.bin",,"$(INCLUDES_DIR)/palettes/0000AD54.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000AD5C.asm","$(INCLUDES_DIR)/palettes/0000AD5C.bin",,"$(INCLUDES_DIR)/palettes/0000AD5C.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B7CE.asm","$(INCLUDES_DIR)/palettes/0000B7CE.bin",,"$(INCLUDES_DIR)/palettes/0000B7CE.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B7EC.asm","$(INCLUDES_DIR)/palettes/0000B7EC.bin",,"$(INCLUDES_DIR)/palettes/0000B7EC.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B80A.asm","$(INCLUDES_DIR)/palettes/0000B80A.bin",,"$(INCLUDES_DIR)/palettes/0000B80A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B828.asm","$(INCLUDES_DIR)/palettes/0000B828.bin",,"$(INCLUDES_DIR)/palettes/0000B828.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B846.asm","$(INCLUDES_DIR)/palettes/0000B846.bin",,"$(INCLUDES_DIR)/palettes/0000B846.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B864.asm","$(INCLUDES_DIR)/palettes/0000B864.bin",,"$(INCLUDES_DIR)/palettes/0000B864.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B884.asm","$(INCLUDES_DIR)/palettes/0000B884.bin",,"$(INCLUDES_DIR)/palettes/0000B884.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B8A4.asm","$(INCLUDES_DIR)/palettes/0000B8A4.bin",,"$(INCLUDES_DIR)/palettes/0000B8A4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B8C4.asm","$(INCLUDES_DIR)/palettes/0000B8C4.bin",,"$(INCLUDES_DIR)/palettes/0000B8C4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B8E4.asm","$(INCLUDES_DIR)/palettes/0000B8E4.bin",,"$(INCLUDES_DIR)/palettes/0000B8E4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B904.asm","$(INCLUDES_DIR)/palettes/0000B904.bin",,"$(INCLUDES_DIR)/palettes/0000B904.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000B912.asm","$(INCLUDES_DIR)/palettes/0000B912.bin",,"$(INCLUDES_DIR)/palettes/0000B912.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BCB4.asm","$(INCLUDES_DIR)/palettes/0000BCB4.bin",,"$(INCLUDES_DIR)/palettes/0000BCB4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BCC4.asm","$(INCLUDES_DIR)/palettes/0000BCC4.bin",,"$(INCLUDES_DIR)/palettes/0000BCC4.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD06.asm","$(INCLUDES_DIR)/palettes/0000BD06.bin",,"$(INCLUDES_DIR)/palettes/0000BD06.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD10.asm","$(INCLUDES_DIR)/palettes/0000BD10.bin",,"$(INCLUDES_DIR)/palettes/0000BD10.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD1A.asm","$(INCLUDES_DIR)/palettes/0000BD1A.bin",,"$(INCLUDES_DIR)/palettes/0000BD1A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD2A.asm","$(INCLUDES_DIR)/palettes/0000BD2A.bin",,"$(INCLUDES_DIR)/palettes/0000BD2A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD3A.asm","$(INCLUDES_DIR)/palettes/0000BD3A.bin",,"$(INCLUDES_DIR)/palettes/0000BD3A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD4A.asm","$(INCLUDES_DIR)/palettes/0000BD4A.bin",,"$(INCLUDES_DIR)/palettes/0000BD4A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0000BD5A.asm","$(INCLUDES_DIR)/palettes/0000BD5A.bin",,"$(INCLUDES_DIR)/palettes/0000BD5A.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00027DB8.asm","$(INCLUDES_DIR)/palettes/00027DB8.bin",,"$(INCLUDES_DIR)/palettes/00027DB8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0002ACC8.asm","$(INCLUDES_DIR)/palettes/0002ACC8.bin",,"$(INCLUDES_DIR)/palettes/0002ACC8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0002D188.asm","$(INCLUDES_DIR)/palettes/0002D188.bin",,"$(INCLUDES_DIR)/palettes/0002D188.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/0002F1D2.asm","$(INCLUDES_DIR)/palettes/0002F1D2.bin",,"$(INCLUDES_DIR)/palettes/0002F1D2.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/00030E4E.asm","$(INCLUDES_DIR)/palettes/00030E4E.bin",,"$(INCLUDES_DIR)/palettes/00030E4E.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000529E8.asm","$(INCLUDES_DIR)/palettes/000529E8.bin",,"$(INCLUDES_DIR)/palettes/000529E8.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/000531A0.asm","$(INCLUDES_DIR)/palettes/000531A0.bin",,"$(INCLUDES_DIR)/palettes/000531A0.txt"
	$(ASM68K) $(ASM68K_SWITCHES) "$(INCLUDES_DIR)/palettes/greyscale.asm","$(INCLUDES_DIR)/palettes/greyscale.bin",,"$(INCLUDES_DIR)/palettes/greyscale.txt"
68k_assemble:
	$(ASM68K) $(ASM68K_SWITCHES) "$(NAME).asm","$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin",,"$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].txt"

sha1:
	$(GO) $(SHA1CHECK) "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin" $(SHA1)

extract: splitrom pcm2wav segard_decomp gfx2png
splitrom:
	$(SPLITROM) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" split.txt
nemesis_decomp:
# Title Screen
	$(NEMESIS_DECOMP) -d $(GFX_DIR)/nemesis/0004C600.smd $(GFX_DIR)/0004C600.smd
segard_decomp:
# Game Font
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00024000.smd 0x00024000
# Stage 1 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00027DDA.smd 0x00027DDA
# Stage 2 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002ACEA.smd 0x0002ACEA
# Stage 3 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002D1AA.smd 0x0002D1AA
# Stage 4 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002F1F4.smd 0x0002F1F4
# Stage 5 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00030E70.smd 0x00030E70
# Boss Stage 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00033AAA.smd 0x00033AAA
# Boss Stage 5
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003565C.smd 0x0003565C
# Boss Stage 1
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00038A2E.smd 0x00038A2E
# Boss Stage 3
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003BA00.smd 0x0003BA00
# Boss Stage 4
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003DFE0.smd 0x0003DFE0
# Boss normal form and Dogs
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00040A1C.smd 0x00040A1C
# Power Ups
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004195C.smd 0x0004195C
# Grave
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00041AB8.smd 0x00041AB8
# Enemy Headless Horror 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00041EC8.smd 0x00041EC8
# Enemy Rattle Tail
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004270A.smd 0x0004270A
# Enemy Round Leech
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00042E7C.smd 0x00042E7C
# Fossils
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000435E2.smd 0x000435E2
# Enemy Headless Horror 1
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00043F22.smd 0x00043F22
# Enemy Cave Needle
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004479E.smd 0x0004479E
# Enemy Rock Turtle
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00044DA2.smd 0x00044DA2
# Enemy Saw Fish
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004547A.smd 0x0004547A
# Enemy Gory Goat
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00045DAC.smd 0x00045DAC
# Enemy Bad Boar
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000463DC.smd 0x000463DC
# Enemy Hammer Demon
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000470D8.smd 0x000470D8
# Enemy Dark Unicorn
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000476C6.smd 0x000476C6
# Rock
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00047F56.smd 0x00047F56
# Enemy Chicken Stinger
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00048452.smd 0x00048452
# Enemy Grave Master
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00049020.smd 0x00049020
# Enemy Skinny Orcus
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004A30E.smd 0x0004A30E
# Smoke
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004AAEE.smd 0x0004AAEE
# PowerUp Steal Magic
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004B00A.smd 0x0004B00A
# Font Credits
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004B3A4.smd 0x0004B3A4
# Title Screen 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004D24E.smd 0x0004D24E
# Title Screen
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004D64E.smd 0x0004D64E
# Zeus sprites
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00052A0A.smd 0x00052A0A
# Flames 
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00058562.smd 0x00058562
# Transformation background
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00059A74.smd 0x00059A74
# Portrait
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00059EE8.smd 0x00059EE8
# Eyes Custscene 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00060280.smd 0x00060280
# Eyes Custscene
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00060B66.smd 0x00060B66
# Fireball
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007E370.smd 0x0007E370
# Fireball 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007E5EC.smd 0x0007E5EC
# Fireball 3
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007EA8C.smd 0x0007EA8C
# Fireball 4
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007EF12.smd 0x0007EF12
# Bolts
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F00E.smd 0x0007F00E
# Game Over
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F4C6.smd 0x0007F4C6
# Font
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F8B6.smd 0x0007F8B6
pcm2wav:
# Power Up
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/000138EC.pcm" $(AUDIO_DIR)/pcm/000138EC.wav 8000
# Die Scream
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/0001552C.pcm" $(AUDIO_DIR)/pcm/0001552C.wav 4000
# Transformation Scream
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/000173B4.pcm" $(AUDIO_DIR)/pcm/000173B4.wav 4000
# Boss Laugh
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/0001AFD4.pcm" $(AUDIO_DIR)/pcm/0001AFD4.wav 4000
# Rise from Your Grave
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/0001CF56.pcm" $(AUDIO_DIR)/pcm/0001CF56.wav 4000
# Welcome to yor Doom
	$(GO) $(PCM2WAV) "$(AUDIO_DIR)/pcm/0001EED8.pcm" $(AUDIO_DIR)/pcm/0001EED8.wav 4000
gfx2png:
	$(GO) $(GFXDUMP) $(GFX_DIR)/00009FB4.smd $(GFX_DIR)/00009FB4.png $(INCLUDES_DIR)/palettes/00009F94.bin
	$(GO) $(GFXDUMP) $(GFX_DIR)/0000BD72.smd $(GFX_DIR)/0000BD72.png $(INCLUDES_DIR)/palettes/0000BCB4.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00024000.smd $(GFX_DIR)/segard/00024000.png $(INCLUDES_DIR)/palettes/0000BD4A.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00027DDA.smd $(GFX_DIR)/segard/00027DDA.png $(INCLUDES_DIR)/palettes/00027DB8.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0002ACEA.smd $(GFX_DIR)/segard/0002ACEA.png $(INCLUDES_DIR)/palettes/0002ACC8.bin
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0002D1AA.smd $(GFX_DIR)/segard/0002D1AA.png $(INCLUDES_DIR)/palettes/0002D188.bin
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0002F1F4.smd $(GFX_DIR)/segard/0002F1F4.png $(INCLUDES_DIR)/palettes/0002F1D2.bin
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00030E70.smd $(GFX_DIR)/segard/00030E70.png $(INCLUDES_DIR)/palettes/00030E4E.bin
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00033AAA.smd $(GFX_DIR)/segard/00033AAA.png $(INCLUDES_DIR)/palettes/0000B7EC.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0003565C.smd $(GFX_DIR)/segard/0003565C.png $(INCLUDES_DIR)/palettes/0000B846.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00038A2E.smd $(GFX_DIR)/segard/00038A2E.png $(INCLUDES_DIR)/palettes/0000B7CE.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0003BA00.smd $(GFX_DIR)/segard/0003BA00.png $(INCLUDES_DIR)/palettes/0000B828.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0003DFE0.smd $(GFX_DIR)/segard/0003DFE0.png $(INCLUDES_DIR)/palettes/0000B80A.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00040A1C.smd $(GFX_DIR)/segard/00040A1C.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004195C.smd $(GFX_DIR)/segard/0004195C.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00041AB8.smd $(GFX_DIR)/segard/00041AB8.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00041EC8.smd $(GFX_DIR)/segard/00041EC8.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004270A.smd $(GFX_DIR)/segard/0004270A.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00042E7C.smd $(GFX_DIR)/segard/00042E7C.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/000435E2.smd $(GFX_DIR)/segard/000435E2.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00043F22.smd $(GFX_DIR)/segard/00043F22.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004479E.smd $(GFX_DIR)/segard/0004479E.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00044DA2.smd $(GFX_DIR)/segard/00044DA2.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004547A.smd $(GFX_DIR)/segard/0004547A.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00045DAC.smd $(GFX_DIR)/segard/00045DAC.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/000463DC.smd $(GFX_DIR)/segard/000463DC.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/000470D8.smd $(GFX_DIR)/segard/000470D8.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/000476C6.smd $(GFX_DIR)/segard/000476C6.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00047F56.smd $(GFX_DIR)/segard/00047F56.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00048452.smd $(GFX_DIR)/segard/00048452.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00049020.smd $(GFX_DIR)/segard/00049020.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004A30E.smd $(GFX_DIR)/segard/0004A30E.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004AAEE.smd $(GFX_DIR)/segard/0004AAEE.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004B00A.smd $(GFX_DIR)/segard/0004B00A.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004B3A4.smd $(GFX_DIR)/segard/0004B3A4.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/nemesis/0004C600.smd $(GFX_DIR)/nemesis/0004C600.png $(INCLUDES_DIR)/palettes/0000BD10.bin 2 1 
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004D24E.smd $(GFX_DIR)/segard/0004D24E.png $(INCLUDES_DIR)/palettes/0000BD5A.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0004D64E.smd $(GFX_DIR)/segard/0004D64E.png $(INCLUDES_DIR)/palettes/0000BD4A.bin 2 1
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00052A0A.smd $(GFX_DIR)/segard/00052A0A.png $(INCLUDES_DIR)/palettes/0000B864.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00058562.smd $(GFX_DIR)/segard/00058562.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00059A74.smd $(GFX_DIR)/segard/00059A74.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00059EE8.smd $(GFX_DIR)/segard/00059EE8.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00060280.smd $(GFX_DIR)/segard/00060280.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/00060B66.smd $(GFX_DIR)/segard/00060B66.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007E370.smd $(GFX_DIR)/segard/0007E370.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007E5EC.smd $(GFX_DIR)/segard/0007E5EC.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007EA8C.smd $(GFX_DIR)/segard/0007EA8C.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007EF12.smd $(GFX_DIR)/segard/0007EF12.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007F00E.smd $(GFX_DIR)/segard/0007F00E.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007F4C6.smd $(GFX_DIR)/segard/0007F4C6.png $(INCLUDES_DIR)/palettes/greyscale.bin 2
	$(GO) $(GFXDUMP) $(GFX_DIR)/segard/0007F8B6.smd $(GFX_DIR)/segard/0007F8B6.png $(INCLUDES_DIR)/palettes/00027DB8.bin 2

test-blastem:
	$(RETROARCH) --libretro=$(RETROARCH_CORE_BLASTEM) "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin" --verbose

test-gens:
	$(RETROARCH) --libretro=$(RETROARCH_CORE_GPGX) "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin" --verbose

test-picodrive:
	$(RETROARCH) --libretro=$(RETROARCH_CORE_PICODRIVE) "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin" --verbose

.PHONY: all build extract test-gens
