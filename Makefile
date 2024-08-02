DOCNAME=main
PDFLATEX_OPTS=-shell-escape

all: report

.PHONY: clean

report: $(DOCNAME).tex
	pdflatex $(PDFLATEX_OPTS) -draftmode $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex $(PDFLATEX_OPTS) -draftmode $(DOCNAME).tex
	pdflatex $(PDFLATEX_OPTS) $(DOCNAME).tex

view: report
	open $(DOCNAME).pdf

clean:
	@rm -f *.blg *.bbl *.aux *.log
