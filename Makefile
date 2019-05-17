MAKEFLAGS += --silent

DOCKER_RUN = docker run --rm -v `pwd`:/tmp janbaer/texlive-pandoc
PANDOC_LETTER = pandoc -s -f markdown -t latex --template="./letter.latex"

OUTPUT_FILE = $(patsubst %.md,%.pdf, $(FILE))

# Example: make {task} FILE=letter.pdf|md

build:
ifeq ($(FILE),)
	echo "Please pass the markdown file"; exit 1
else
	${DOCKER_RUN} $(PANDOC_LETTER) $(FILE) -o $(OUTPUT_FILE)
endif

clean:
	rm -rf *.aux *.log *.nav *.out *.snm *.toc *.vrbv *.pdf || true

view: $(FILE)
	evince $(FILE)&

watch:
	watchexec --exts md make build FILE=$(FILE)

.PHONY: build clean view watch
