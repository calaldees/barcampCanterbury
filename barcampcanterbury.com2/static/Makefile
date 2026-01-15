CDN_PURE:='https://cdn.jsdelivr.net/npm/purecss@3.0.0/build'

pure: pure-min.css grids-responsive-min.css pure-layout-marketing.css

pure-min.css:
	curl ${CDN_PURE}/$@ -o $@

grids-responsive-min.css:
	curl ${CDN_PURE}/$@ -o $@

pure-layout-marketing.css:
	curl https://pure-css.github.io/layouts/marketing/styles.css -o $@
