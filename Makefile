talk.pdf: talk.md
	pandoc -t beamer talk.md -o talk.pdf

clean:
	-rm talk.pdf

