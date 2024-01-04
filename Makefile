DOCNAME=main

all: report

.PHONY: clean

report: $(DOCNAME).tex
	pdflatex -shell-escape  --draft-mode $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex -shell-escape --draft-mode $(DOCNAME).tex
	pdflatex --shell-escape $(DOCNAME).tex

view: report
	open $(DOCNAME).pdf

clean:
	rm *.blg *.bbl *.aux *.log
