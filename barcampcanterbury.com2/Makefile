
.PHONEY: build_site
build_site:
	uv run build_site.py
# -m pdb -c continue

serve: build_site
	python3 -m http.server -d build

build/images/og_image.png:
	"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
		--headless --screenshot --window-size=1200,630 \
		http://localhost:8000
	mv screenshot.png $@
	optipng $@
