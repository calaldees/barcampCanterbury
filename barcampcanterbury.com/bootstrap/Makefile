
.PHONY: download
download: bootstrap.min.css bootstrap.min.js jquery.min.js popper.min.js

popper.min.js:
	curl "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" -O

jquery.min.js:
	curl "https://code.jquery.com/jquery-3.3.1.slim.min.js" -o $@

bootstrap.min.css:
	curl "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -O

bootstrap.min.js:
	curl "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" -O

.PHONY: clean
clean:
	rm -rf *.js *.css
