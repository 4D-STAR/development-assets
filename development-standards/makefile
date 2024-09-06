TC=pdflatex
NAME="4D_STAR_Standards"
TFLAGS=-shell-escape --jobname=$(NAME)
SRC=main.tex

default: $(SRC)
	$(TC) $(TFLAGS) $(SRC)

clean:
	rm -f *.aux *.log *.out *.toc *.pdf *.bbl *.blg *.dvi *.ps *.bak
	rm -r _minted-$(NAME)
