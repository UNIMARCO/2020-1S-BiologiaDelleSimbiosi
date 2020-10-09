all : L1 L2 L3

L1 : Lesson1.Rmd
	Rscript -e "library(rmarkdown); render('Lesson1.Rmd', 'xaringan::moon_reader')"

L2 : Lesson2.Rmd
	Rscript -e "library(rmarkdown); render('Lesson2.Rmd', 'xaringan::moon_reader')"

L3 : Lesson3.Rmd
	Rscript -e "library(rmarkdown); render('Lesson3.Rmd', 'xaringan::moon_reader')"

clean :
	rm Lesson*html; rm -r *_cache
