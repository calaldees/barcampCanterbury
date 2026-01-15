
build_site:
	${MAKE} --directory static
	uv run build_site.py
# -m pdb -c continue

serve_watch:
	find . \
		-not -path '*/.*' -and \
		-not -path '*/__*' -and \
		-not -path '*/build*' | \
		entr -rs '\
			uv run build_site.py && \
			python3 -m http.server -d build \
		\'

serve: build_site
	python3 -m http.server -d build

build/index.html.gz:
	find build -type f \
			-iname '*.html' \
		-or -iname '*.css' \
		-or -iname '*.svg' \
		-or -iname '*.js' \
		-or -iname '*.json' \
		-or -iname '*.xml' \
		-or -iname '*.txt' \
		-or -iname '*.md' \
		| xargs gzip -9 -k

build/images/og_image.png:
	"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
		--headless --screenshot --window-size=1200,630 \
		http://localhost:8000
	mv screenshot.png $@
	optipng $@

test:
	uv run pytest

clear:
	rm -rf build screenshot.png
clear_all: clear
	rm -rf .venv uv.lock __*/
