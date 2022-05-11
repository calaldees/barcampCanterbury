serve:
	$(MAKE) --directory bootstrap
	python3 -m http.server

deploy:
	ssh barcampcanterbury \
		'cd barcampcanterbury.com && git pull'