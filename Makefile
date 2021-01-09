SOURCE=slide/zuluCrypt.asciidoc
BASE=$(basename $(SOURCE))
HTML=$(BASE).html
PDF=$(BASE).pdf

#.PHONY: all

all: $(HTML) $(PDF)

$(HTML): $(SOURCE)
	asciidoctor-revealjs-linux $(SOURCE)

$(PDF): $(HTML)
	chromium --user-data-dir=`mktemp -d` --headless --print-to-pdf=./$(PDF) file://`pwd`/$(HTML)?print-pdf

clean:
	rm -f $(PDF) $(HTML)

