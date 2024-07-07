# Binaries	
REGION			?= UE
VERSION			?= REV02
NAME			?= Altered Beast
ROM_UE_REV02	?= Altered Beast (USA, Europe).md
SHA1			?= 38945360D824D2FB9535B4FD7F25B9AA9B32F019
WORKSPACE		:= .

# Directories
BUILD_DIR		:= $(WORKSPACE)/build
GFX_DIR 		:= $(WORKSPACE)/gfx
ROM_DIR			:= $(WORKSPACE)/rom
TOOLS_DIR		:= $(WORKSPACE)/tools

# Tooling
GO				:= go run
ASM68K 			:= $(TOOLS_DIR)/asm68k/asm68k.exe
ASM68K_SWITCHES ?= /m /p /k
SEGARD_DECOMP	:= $(TOOLS_DIR)/segard/decomp.go
SHA1CHECK		:= $(TOOLS_DIR)/checksum/sha1.go

all: extract build
build: assemble sha1
assemble:
	$(ASM68K) $(ASM68K_SWITCHES) "$(NAME).asm","$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin",,"$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].txt"
sha1:
	$(GO) $(SHA1CHECK) "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin" $(SHA1)

extract: segard_decomp
segard_decomp:
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00024000.smd 0x00024000 # Game Font
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00027DDA.smd 0x00027DDA # Stage 1 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002ACEA.smd 0x0002ACEA # Stage 2 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002D1AA.smd 0x0002D1AA # Stage 3 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0002F1F4.smd 0x0002F1F4 # Stage 4 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00030E70.smd 0x00030E70 # Stage 5 background elements
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00033AAA.smd 0x00033AAA # Boss Stage 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00038A2E.smd 0x00038A2E # Boss Stage 1
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003BA00.smd 0x0003BA00 # Boss Stage 3
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003DFE0.smd 0x0003DFE0 # Boss Stage 4
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0003565C.smd 0x0003565C # Boss Stage 5
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00040A1C.smd 0x00040A1C # Boss normal form and Dogs
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004195C.smd 0x0004195C # Power Ups
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00041EC8.smd 0x00041EC8 # Enemy Headless Horror 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00041AB8.smd 0x00041AB8 # Grave
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004270A.smd 0x0004270A # Enemy Rattle Tail
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00042E7C.smd 0x00042E7C # Enemy Round Leech
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000435E2.smd 0x000435E2 # Fossils
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00043F22.smd 0x00043F22 # Enemy Headless Horror 1
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004479E.smd 0x0004479E # Enemy Cave Needle
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00044DA2.smd 0x00044DA2 # Enemy Rock Turtle
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004547A.smd 0x0004547A # Enemy Saw Fish
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00045DAC.smd 0x00045DAC # Enemy Gory Goat
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000463DC.smd 0x000463DC # Enemy Bad Boar
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000470D8.smd 0x000470D8 # Enemy Hammer Demon
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/000476C6.smd 0x000476C6 # Enemy Dark Unicorn
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00047F56.smd 0x00047F56 # Rock
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00048452.smd 0x00048452 # Enemy Chicken Stinger
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00049020.smd 0x00049020 # Enemy Grave Master
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004A30E.smd 0x0004A30E # Enemy Skinny Orcus
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004AAEE.smd 0x0004AAEE # Smoke
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004B00A.smd 0x0004B00A # PowerUp Steal Magic
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004B3A4.smd 0x0004B3A4 # Font Credits
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004D24E.smd 0x0004D24E # Title Screen 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0004D64E.smd 0x0004D64E # Title Screen
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00052A0A.smd 0x00052A0A # Zeus sprites
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00058562.smd 0x00058562 # Flames 
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00059A74.smd 0x00059A74 # Transformation background
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00059EE8.smd 0x00059EE8 # Portrait
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00060B66.smd 0x00060B66 # Eyes Custscene
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/00060280.smd 0x00060280 # Eyes Custscene 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007E370.smd 0x0007E370 # Fireball
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007E5EC.smd 0x0007E5EC # Fireball 2
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007EA8C.smd 0x0007EA8C # Fireball 3
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007EF12.smd 0x0007EF12 # Fireball 4
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F00E.smd 0x0007F00E # Bolts
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F4C6.smd 0x0007F4C6 # Game Over
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(REGION)_$(VERSION))" $(GFX_DIR)/segard/0007F8B6.smd 0x0007F8B6 # Font


test-gens:
	$(TOOLS_DIR)\RetroArch-Win64\retroarch.exe --libretro=genesis_plus_gx_libretro.dll "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin"

test-picodrive:
	$(TOOLS_DIR)\RetroArch-Win64\retroarch.exe --libretro=picodrive_libretro.dll "$(BUILD_DIR)/$(NAME) ($(REGION)) ($(VERSION)) [!].bin"

.PHONY: all build extract test-gens
