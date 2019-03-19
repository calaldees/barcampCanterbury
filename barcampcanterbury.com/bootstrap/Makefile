VERSION_BOOTSTRAP:=4.3.1
VERSION_JQUERY:=3.3.1

.PHONY: download
download: bootstrap.min.css bootstrap.min.js jquery.min.js popper.min.js


popper.min.js:
	curl "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/$@" -O
	curl "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/$@.map" -O

jquery.min.js:
	curl "https://code.jquery.com/jquery-${VERSION_JQUERY}.slim.min.js" -o $@

bootstrap.min.css:
	curl "https://stackpath.bootstrapcdn.com/bootstrap/${VERSION_BOOTSTRAP}/css/$@" -O
	curl "https://stackpath.bootstrapcdn.com/bootstrap/${VERSION_BOOTSTRAP}/css/$@.map" -O

bootstrap.min.js:
	curl "https://stackpath.bootstrapcdn.com/bootstrap/${VERSION_BOOTSTRAP}/js/$@" -O
	curl "https://stackpath.bootstrapcdn.com/bootstrap/${VERSION_BOOTSTRAP}/js/$@.map" -O


.PHONY: clean
clean:
	rm -rf *.js *.css
