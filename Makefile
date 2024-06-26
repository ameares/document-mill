# Directories
SOURCE_DIR = ./docs
TEMPLATE_DIR = ./template
TEMP_DIR = ./temp
BUILD_DIR = ./build
BIB_DIR = $(CURDIR)/docs

# Commands and flags
PDFLATEX = lualatex
PDFLATEXFLAGS = -output-directory=$(BUILD_DIR) -interaction=nonstopmode

# Auto-detect source files
SOURCES = $(wildcard $(SOURCE_DIR)/*.tex)
# Auto-dect .bib files.
BIB_FILES = $(wildcard $(SOURCE_DIR)/*.bib)

# Define your output files based on the source files
OUTPUTS = $(SOURCES:$(SOURCE_DIR)/%.tex=$(BUILD_DIR)/%.pdf)

# Main target and outputs always rebuilt
.PHONY: all clean cleanall $(OUTPUTS)

# Main target
all: $(OUTPUTS)

# Use latexmk for each source file
$(OUTPUTS): $(BUILD_DIR)/%.pdf: $(SOURCE_DIR)/%.tex
	TEXINPUTS=$(TEMPLATE_DIR)//:$(TEMP_DIR)//: BIBINPUTS=$(BIB_DIR)//: latexmk -pdf -pdflatex="$(PDFLATEX) $(PDFLATEXFLAGS)" -outdir=$(BUILD_DIR) $<

# Clean up auxiliary files using latexmk's clean feature
clean:
	cd $(SOURCE_DIR) && latexmk -c -outdir=../$(BUILD_DIR) *.tex

# Additionally remove PDFs
cleanall:
	cd $(SOURCE_DIR) && latexmk -C -outdir=../$(BUILD_DIR) *.tex
	rm -f $(BUILD_DIR)/*.pdf

