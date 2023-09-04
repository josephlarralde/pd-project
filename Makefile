# library name
lib.name = project

EXT=src/externals
DEP=dependencies
ABS=abstractions
HLP=helpfiles

# input source files
# aaosc~.class.sources = $(EXT)/aaosc~.cpp $(DEP)/jl.cpp.lib/dsp/synthesis/Oscillator.cpp
# hann~.class.sources = $(EXT)/hann~.cpp $(DEP)/jl.cpp.lib/dsp/synthesis/Oscillator.cpp
# bibi~.class.sources = $(EXT)/bibi~.cpp
# gbend~.class.sources = $(EXT)/gbend~.cpp $(DEP)/jl.cpp.lib/dsp/sampler/Gbend.cpp
# stut~.class.sources = $(EXT)/stut~.cpp $(DEP)/jl.cpp.lib/dsp/effects/Stut.cpp
# sidechain~.class.sources = $(EXT)/sidechain~.cpp $(DEP)/jl.cpp.lib/dsp/effects/Compress.cpp
# flatten~.class.sources = $(EXT)/flatten~.cpp $(DEP)/jl.cpp.lib/dsp/effects/Compress.cpp
# map.class.sources = $(EXT)/map.cpp
# magnetize.class.sources = $(EXT)/magnetize.cpp
# tonnetz.class.sources = $(EXT)/tonnetz.cpp

# all extra files to be included in binary distribution of the library
datafiles = \
$(ABS)/project-meta.pd \
$(ABS)/project-objects.pd \
$(ABS)/ctlbus-from-ctlin.pd \
$(ABS)/ctlbus-from-inlet.pd \
$(ABS)/ctlbus-from-notein.pd \
$(ABS)/ctlbus-from-receive.pd \
$(ABS)/ctlbus-recorder.pd \
$(ABS)/file-manager.pd \
$(ABS)/module-preset.pd \
$(ABS)/ossia-parameter.pd \
$(ABS)/parameter-simple.pd \
$(ABS)/parameter-toggle.pd \
$(ABS)/parameter-trig.pd \
$(ABS)/parameter.pd \
$(ABS)/preset-manager-unit.pd \
$(ABS)/preset-manager.pd \
$(ABS)/sound-selector.pd \
$(ABS)/soundbank-unit.pd \
$(ABS)/soundbank.pd \

# update path to reflect your environment
# PDLIBDIR="/Users/larralde/Documents/Pd/externals"

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
	PDLIBDIR="./build/darwin"
endif
ifeq ($(UNAME),Linux)
	PDLIBDIR="/usr/local/lib/pd-externals"
endif
ifeq (MINGW,$(findstring MINGW,$(UNAME)))
	PDLIBDIR="./build/win32"
	PDINCLUDEDIR="/c/Program\ Files/Pd/src"
	PDBINDIR="/c/Program\ Files/Pd/bin"
endif


SRCOUT=./build/source/project

# this is needed for initializer lists
cflags += -std=c++11

CC=gcc

ifeq ($(UNAME),Darwin)
	# this is needed for use of <vector> (!?)
	cflags += -mmacosx-version-min=10.9
endif

# include Makefile.pdlibbuilder from submodule directory 'pd-lib-builder'
# update path to reflect your environment
PDLIBBUILDER_DIR=$(DEP)/pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder

# found here
# https://stackoverflow.com/questions/4822321/remove-all-git-files-from-a-directory
source:
	rm -rf "$(SRCOUT)";
	mkdir "$(SRCOUT)";
	cp Makefile "$(SRCOUT)";
	mkdir "$(SRCOUT)/patches";
	cp $(datafiles) "$(SRCOUT)/patches";

	# cp -r ./abstractions ./project/abstractions;
	# cp -r ./helpfiles ./project/helpfiles;

	cp -r ./src "$(SRCOUT)/src";
	(find $(SRCOUT) -name ".git" && find $(SRCOUT) -name ".gitignore" && find $(SRCOUT) -name ".gitmodules") | xargs rm -rf;
