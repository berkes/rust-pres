all: pres.html

clean:
	rm -f pres.html pres.pdf

pres.html:
	pandoc -t revealjs -s -o pres.html pres.md --incremental --css=style.css --slide-level=2 -V revealjs-url=./reveal.js/ --embed-resources --standalone

pres.pdf:
	pandoc -t beamer -o pres.pdf pres.md --slide-level=2 --pdf-engine=xelatex
