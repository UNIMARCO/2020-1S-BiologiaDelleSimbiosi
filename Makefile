docs/Lesson1.html: docs/Lesson1.Rmd
	Rscript -e 'rmarkdown::render('docs/Lesson1.Rmd', 'xaringan::moon_reader')'
