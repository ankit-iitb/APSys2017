FILE=Paper

all: $(FILE).pdf

.PHONY: clean

clean:
	rm -rf *.blg
	rm -rf *.out
	rm -rf *.bbl
	rm -rf *.log
	rm -rf *.ind
	rm -rf *.ilg
	rm -rf *.lot
	rm -rf *.lof
	rm -rf *.ind
	rm -rf *.idx
	rm -rf *.aux
	rm -rf *.toc
	rm -f ${FILE}.pdf


$(FILE).pdf: Paper.tex abstract.tex introduction.tex explanation.tex evaluation.tex database.bib
	pdflatex -shell-escape $(FILE).tex
	pdflatex -shell-escape $(FILE).tex
	bibtex $(FILE).aux
	pdflatex -shell-escape $(FILE).tex
	pdflatex -shell-escape $(FILE).tex
	evince Paper.pdf
