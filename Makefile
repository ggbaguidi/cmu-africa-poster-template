LATEX = lualatex

.PHONY: all landscape portrait clean

all: main.pdf

main.pdf: main.tex branding.tex references.bib
	$(LATEX) -interaction=nonstopmode -halt-on-error main.tex
	bibtex main
	$(LATEX) -interaction=nonstopmode -halt-on-error main.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error main.tex

# Explicit landscape copy, useful when both orientations are being compared.
landscape:
	sed 's/\\posterlandscapefalse/\\posterlandscapetrue/' main.tex > main-landscape.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error main-landscape.tex
	bibtex main-landscape
	$(LATEX) -interaction=nonstopmode -halt-on-error main-landscape.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error main-landscape.tex

# Build portrait without changing the default landscape source.
portrait:
	sed 's/\\posterlandscapetrue/\\posterlandscapefalse/' main.tex > main-portrait.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error main-portrait.tex
	bibtex main-portrait
	$(LATEX) -interaction=nonstopmode -halt-on-error main-portrait.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error main-portrait.tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc main-landscape.tex main-portrait.tex main-blx.bib
