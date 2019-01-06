#
# Author: Jan Baer <info@janbaer.de>
#
# ===== Usage ================================================================
#
# make build FILE=<name of md file without ext>
# make view FILE=<name of md file without ext>
#
# make clean            Get rid of all intermediate generated files
#
# ============================================================================
DOCKER_RUN = docker run --rm -v `pwd`:/tmp janbaer/texlive-pandoc

PANDOC_FLAGS = -f markdown+tex_math_single_backslash -t latex

LATEX_FLAGS = --template=scrlttr2.latex

build:
	${DOCKER_RUN} $(PANDOC_FLAGS) $(LATEX_FLAGS) $(FILE).md -o $(FILE).pdf

build-tex:
	${DOCKER_RUN} $(PANDOC_FLAGS) $(LATEX_FLAGS) $(FILE).md -o $(FILE).tex

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrbv *.pdf || true

view: $(FILE).pdf
	zathura $(FILE).pdf&

watch: $(FILE).md
	echo $(FILE).md | entr make

.PHONY: build build-tex clean view watch
