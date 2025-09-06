.PHONY: pdf clean view

PDF = resume.pdf
SRC = resume.tex

pdf:
	latexmk -pdfxe -f $(SRC)

clean:
	latexmk -C

view:
	latexmk -pvc -pdfxe -f $(SRC)
