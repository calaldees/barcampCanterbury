<%
	import datetime
	event = events[0]
	event_datetime = datetime.datetime.fromisoformat(event.isodatetime)
%>
	## https://www.ogimage.gallery/libary/the-ultimate-guide-to-og-image-dimensions-2024-update
	## 1200x630 pixels
	<meta property="og:title" content="${title}">
	<meta property="og:description" content="${description}">
	<meta property="og:image" content="/images/og_image.png">
	<meta property="og:url" content="${site}">
	<meta property="og:logo" content="${logo}" />
	<meta property="og:type" content="event">
	<meta property="event:start_time" content="${event_datetime.strftime('%Y-%m-%dT%H:%M:%SZ')}">
	<meta name="twitter:card" content="summary_large_image">
