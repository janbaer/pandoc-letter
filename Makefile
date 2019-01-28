#
# Author: Jan Baer <info@janbaer.de>
#
# ===== Usage ================================================================
#
# make build-letter FILE=<name of md file without ext>
# make build-slides FILE=<name of md file without ext>
# make view FILE=<name of md file without ext>
#
# make clean            Get rid of all intermediate generated files
#
# ============================================================================
MAKEFLAGS += --silent

DOCKER_RUN = docker run --rm -v `pwd`:/tmp janbaer/texlive-pandoc
PANDOC_LETTER = pandoc -f markdown -t latex --template=scrlttr2.latex

FILE=example-letter

build:
	${DOCKER_RUN} $(PANDOC_LETTER) $(FILE).md -o $(FILE).pdf

build-tex:
	${DOCKER_RUN} $(PANDOC_LETTER) $(FILE).md -o $(FILE).tex

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrbv *.pdf || true

view: $(FILE).pdf
	zathura $(FILE).pdf&

watch: $(FILE).md
	watchexec --exts md,latex,lco make

.PHONY: build build-tex clean view watch
