# Binaries	
VERSION			?= US
NAME			?= Altered Beast
ROM_US  		?= Altered Beast (USA, Europe).md
WORKSPACE		?= ./


# Directories
ASM_DIR			:= asm
BUILD_DIR		:= build
GFX_DIR 		:= gfx
ROM_DIR			:= rom
TOOLS_DIR		:= tools

# Tooling
GO			:= go run
ASM68K 			:= $(TOOLS_DIR)/asm68k/asm68k.exe
SEGARD_DECOMP		:= $(TOOLS_DIR)/segard/decomp.go

all: extract build
build:
	$(ASM68K) /m /k /p "$(WORKSPACE)/$(ASM_DIR)/$(NAME).asm","$(WORKSPACE)/$(BUILD_DIR)/$(NAME) ($(VERSION)).bin",,"$(WORKSPACE)/$(BUILD_DIR)/$(NAME) $(VERSION)_list.txt"
extract: segard_decomp
segard_decomp:
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00024000.smd 0x00024000
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00024000.smd 0x00024000
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00024000.smd 0x00024000
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00027DDA.smd 0x00027DDA
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0002ACEA.smd 0x0002ACEA
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0002D1AA.smd 0x0002D1AA
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0002F1F4.smd 0x0002F1F4
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00030E70.smd 0x00030E70
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00033AAA.smd 0x00033AAA
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00040A1C.smd 0x00040A1C
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004195C.smd 0x0004195C
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00043F22.smd 0x00043F22
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004479E.smd 0x0004479E
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00044DA2.smd 0x00044DA2
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004547A.smd 0x0004547A
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00045DAC.smd 0x00045DAC
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/000463DC.smd 0x000463DC
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/000470D8.smd 0x000470D8
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/000476C6.smd 0x000476C6
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00047F56.smd 0x00047F56
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00048452.smd 0x00048452
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00049020.smd 0x00049020
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004A30E.smd 0x0004A30E
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004AAEE.smd 0x0004AAEE
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004B00A.smd 0x0004B00A
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004B3A4.smd 0x0004B3A4
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004D24E.smd 0x0004D24E	
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0004D64E.smd 0x0004D64E
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00052A0A.smd 0x00052A0A
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00058562.smd 0x00058562
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00059A74.smd 0x00059A74
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00059EE8.smd 0x00059EE8
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00060B66.smd 0x00060B66
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/00060280.smd 0x00060280
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0007E370.smd 0x0007E370
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0007F4C6.smd 0x0007F4C6
	$(GO) $(SEGARD_DECOMP) "$(WORKSPACE)/$(ROM_DIR)/$(ROM_$(VERSION))" $(WORKSPACE)/$(GFX_DIR)/segard/0007F8B6.smd 0x0007F8B6

.PHONY: all build extract
