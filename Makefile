# Binaries	
VERSION			?= US
NAME			?= Altered Beast
ROM_US  		?= Altered Beast (USA, Europe).md


# Directories
ASM_DIR			:= asm
BUILD_DIR		:= build
GFX_DIR 		:= gfx
ROM_DIR			:= rom
TOOLS_DIR		:= tools

# Tooling
GO				:= go run
ASM68K 			:= $(TOOLS_DIR)/asm68k/asm68k.exe
SEGARD_DECOMP	:= $(TOOLS_DIR)/segard/decomp.go

all: extract build
build:
	$(ASM68K) /m /k /p "$(ASM_DIR)/$(NAME).asm","$(BUILD_DIR)/$(NAME) ($(VERSION)).bin",,"$(BUILD_DIR)/$(NAME) $(VERSION)_list.txt"
extract: segard_decomp
segard_decomp:
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00024000.smd 0x00024000
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0004195C.smd 0x0004195C
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0004B3A4.smd 0x0004B3A4
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0004D24E.smd 0x0004D24E	
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0004D64E.smd 0x0004D64E
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00058562.smd 0x00058562
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00059A74.smd 0x00059A74
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00059EE8.smd 0x00059EE8
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00060B66.smd 0x00060B66
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/00060280.smd 0x00060280
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0007E370.smd 0x0007E370
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0007F4C6.smd 0x0007F4C6
	$(GO) $(SEGARD_DECOMP) "$(ROM_DIR)/$(ROM_$(VERSION))" $(GFX_DIR)/segard/0007F8B6.smd 0x0007F8B6

.PHONY: all build extract