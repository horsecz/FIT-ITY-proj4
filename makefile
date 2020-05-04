#
#	MAKEFILE
#	
# 	Autor: 	Dominik Horky
# 	Datum: 	2.4.2020
#
# 	Urceno pro prekladani projektu do predmetu ITY (s jedinym zdrojovym .tex souborem!)
#	(upraveny makefile z predchozich projektu - urceno pro 4. projekt -> nutnost prelozit zdrojovy soubor 4x)
#	TODO: preklad 4x!

INPUT := $(shell ls *.tex | cut -d "." -f 1)

pdf: $(INPUT).pdf
	
$(INPUT).pdf: $(INPUT).ps
	ps2pdf $(INPUT).ps

$(INPUT).ps: $(INPUT).dvi
	dvips -sPAPERSIZE=a4 $(INPUT).dvi

$(INPUT).dvi: $(INPUT).tex
	latex $(INPUT).tex
	bibtex $(INPUT)
	latex $(INPUT).tex
	latex $(INPUT).tex
clean:
	rm -rf *.aux *.dvi *.log *.out *.pdf *.ps
