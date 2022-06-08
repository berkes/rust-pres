all:
	pandoc -t revealjs -s -o pres.html pres.md --incremental --css=style.css --slide-level=2 -V revealjs-url=./reveal.js-3.9.2/
