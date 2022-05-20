all:
	pandoc -t revealjs -s -o pres.html pres.md -V revealjs-url=./reveal.js-3.9.2/
