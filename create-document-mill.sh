#!/bin/bash

# Define project name
PROJECT_NAME="document-mill"

# Create project directory and navigate into it
# mkdir "$PROJECT_NAME"
# cd "$PROJECT_NAME"

# Create folders
mkdir build docs template docs/images template/images

# Create .gitignore
cat <<EOF > .gitignore
## Core latex/pdflatex auxiliary files:
*.aux
*.lof
*.log
*.lot
*.fls
*.out
*.toc
*.fmt
*.fot
*.cb
*.cb2
.*.lb

# Build Products
build/
EOF

# Create LICENSE
cat <<EOF > LICENSE
MIT License

Copyright (c) 2024 Andrew Meares

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create Makefile
cat <<'EOF' > Makefile
# Directories
SOURCE_DIR = ./docs
TEMPLATE_DIR = ./template
BUILD_DIR = ./build

# Commands and flags
PDFLATEX = lualatex
PDFLATEXFLAGS = -output-directory=$(BUILD_DIR) -interaction=nonstopmode

# Auto-detect source files
SOURCES = $(wildcard $(SOURCE_DIR)/*.tex)
# Auto-dect .bib files.
BIB_FILES = $(wildcard $(SOURCE_DIR)/*.bib)

# Define your output files based on the source files
OUTPUTS = $(SOURCES:$(SOURCE_DIR)/%.tex=$(BUILD_DIR)/%.pdf)

# Main target
all: $(OUTPUTS)

# Use latexmk for each source file
$(OUTPUTS): $(BUILD_DIR)/%.pdf: $(SOURCE_DIR)/%.tex
	TEXINPUTS=$(TEMPLATE_DIR)//: latexmk -pdf -pdflatex="$(PDFLATEX) $(PDFLATEXFLAGS)" -outdir=$(BUILD_DIR) $<

# Clean up auxiliary files using latexmk's clean feature
clean:
	cd $(SOURCE_DIR) && latexmk -c -outdir=../$(BUILD_DIR) *.tex

# Additionally remove PDFs
cleanall:
	cd $(SOURCE_DIR) && latexmk -C -outdir=../$(BUILD_DIR) *.tex
	rm -f $(BUILD_DIR)/*.pdf

.PHONY: all clean cleanall
EOF

# Create README.md
cat <<EOF > Readme.md
# A Document Mill Project
A description of the project and how to use it.
EOF

cat <<EOF > ./docs/template.tex
\documentclass[letterpaper,12pt]{article}
\usepackage{document-example}
\begin{document}

\section{Summary}

\end{document}
EOF

cat <<EOF > ./template/document-example.sty
\ProvidesPackage{document-example}

% Load required packages
\RequirePackage{graphicx}
\RequirePackage{lipsum} % for generating dummy text
\graphicspath{{images/}{../docs/images}}

% Page style#!/bin/bash

# Define project name
PROJECT_NAME="document-mill"

# Create project directory and navigate into it
# mkdir "$PROJECT_NAME"
# cd "$PROJECT_NAME"

# Create folders
mkdir build docs template docs/images template/images

# Create .gitignore
cat <<EOF > .gitignore
## Core latex/pdflatex auxiliary files:
*.aux
*.lof
*.log
*.lot
*.fls
*.out
*.toc
*.fmt
*.fot
*.cb
*.cb2
.*.lb

# Build Products
build/
EOF

# Create LICENSE
cat <<EOF > LICENSE
MIT License

Copyright (c) 2024 Andrew Meares

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create Makefile
cat <<'EOF' > Makefile
# Directories
SOURCE_DIR = ./docs
TEMPLATE_DIR = ./template
BUILD_DIR = ./build

# Commands and flags
PDFLATEX = lualatex
PDFLATEXFLAGS = -output-directory=$(BUILD_DIR) -interaction=nonstopmode

# Auto-detect source files
SOURCES = $(wildcard $(SOURCE_DIR)/*.tex)
# Auto-dect .bib files.
BIB_FILES = $(wildcard $(SOURCE_DIR)/*.bib)

# Define your output files based on the source files
OUTPUTS = $(SOURCES:$(SOURCE_DIR)/%.tex=$(BUILD_DIR)/%.pdf)

# Main target
all: $(OUTPUTS)

# Use latexmk for each source file
$(OUTPUTS): $(BUILD_DIR)/%.pdf: $(SOURCE_DIR)/%.tex
	TEXINPUTS=$(TEMPLATE_DIR)//: latexmk -pdf -pdflatex="$(PDFLATEX) $(PDFLATEXFLAGS)" -outdir=$(BUILD_DIR) $<

# Clean up auxiliary files using latexmk's clean feature
clean:
	cd $(SOURCE_DIR) && latexmk -c -outdir=../$(BUILD_DIR) *.tex

# Additionally remove PDFs
cleanall:
	cd $(SOURCE_DIR) && latexmk -C -outdir=../$(BUILD_DIR) *.tex
	rm -f $(BUILD_DIR)/*.pdf

.PHONY: all clean cleanall
EOF

# Create README.md
cat <<EOF > Readme.md
# A Document Mill Project
A description of the project and how to use it.
EOF

cat <<EOF > ./docs/template.tex
\documentclass[letterpaper,12pt]{article}
\usepackage{document-example}
\begin{document}

\section{Summary}

\end{document}
EOF

cat <<EOF > ./template/document-example.sty
\ProvidesPackage{document-example}

% Load required packages
\RequirePackage{graphicx}
\RequirePackage{lipsum} % for generating dummy text
\graphicspath{{images/}{../docs/images}}

% Page style
\usepackage[margin=1in]{geometry}
\pagestyle{empty}
\usepackage{xcolor}   % To use the \textcolor command
\usepackage{booktabs}
\usepackage{varwidth}
\usepackage{caption}

% Code Listings
\usepackage{listings}

\lstset{
  basicstyle=\ttfamily,
  frame=single,
  breaklines=true
}
EOF

# Success message
echo "$PROJECT_NAME framework is ready."

\usepackage[margin=1in]{geometry}
\pagestyle{empty}
\usepackage{xcolor}   % To use the \textcolor command
\usepackage{booktabs}
\usepackage{varwidth}
\usepackage{caption}

% Code Listings
\usepackage{listings}

\lstset{
  basicstyle=\ttfamily,
  frame=single,
  breaklines=true
}
EOF

# Success message
echo "$PROJECT_NAME framework is ready."
