<%
	import datetime
	event = events[0]
	event_datetime = datetime.datetime.fromisoformat(event.isodatetime)
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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

	<title>${title}</title>
	<link id="favicon" rel="shortcut icon" type="image/svg" href="images/barcampcanterbury_logo.svg">

	##<link rel="stylesheet" href="static/pure-min.css">
	##<link rel="stylesheet" href="static/grids-responsive-min.css">
	<style>
	<%include file="pure-min.css"/>
	<%include file="grids-responsive-min.css"/>
	<%include file="pure-layout-marketing.css"/>
	<%include file="index.css"/>
	</style>
</head>
<body>

<!--
<h1>${title}</h1>
Variable a:${root.a}
<%include file="_addition.mako"/>
-->


## Template from https://pure-css.github.io/layouts/marketing/
<div class="header">
	<div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
		<a class="pure-menu-heading" href="#">
			<img src="images/barcampcanterbury_logo.svg" class="logo" />
			${title}
		</a>

		<ul class="pure-menu-list">
			<li class="pure-menu-item pure-menu-selected"><a href="#" class="pure-menu-link">Home</a></li>
			<li class="pure-menu-item"><a href="#" class="pure-menu-link">Tour</a></li>
			<li class="pure-menu-item"><a href="#" class="pure-menu-link">Sign Up</a></li>
		</ul>
	</div>
</div>

<div class="splash-container">
	<div class="splash">
		<h1 class="splash-head">${title}</h1>
		<p class="splash-subhead">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit.
		</p>
		<p>
			<a href="http://purecss.io" class="pure-button pure-button-primary">Get Started</a>
		</p>
	</div>
</div>

<div class="content-wrapper">
	<div class="content">
		<h2 class="content-head is-center">Excepteur sint occaecat cupidatat.</h2>

		<div class="pure-g">
			<div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">

				<h3 class="content-subhead">
					<i class="fa fa-rocket"></i>
					Get Started Quickly
				</h3>
				<p>
					Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
				</p>
			</div>
			<div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
				<h3 class="content-subhead">
					<i class="fa fa-mobile"></i>
					Responsive Layouts
				</h3>
				<p>
					Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
				</p>
			</div>
			<div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
				<h3 class="content-subhead">
					<i class="fa fa-th-large"></i>
					Modular
				</h3>
				<p>
					Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
				</p>
			</div>
			<div class="l-box pure-u-1 pure-u-md-1-2 pure-u-lg-1-4">
				<h3 class="content-subhead">
					<i class="fa fa-check-square-o"></i>
					Plays Nice
				</h3>
				<p>
					Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.
				</p>

				## Days Until - JS Dynamic Content
				<% target_date_str = event_datetime.strftime(r'%m/%d/%Y') %>
				<p id="days_until_event"></p>
				<script>
					const target_date_str = '${target_date_str}'
					const days_between = (d1, d2) => Math.ceil((d1.getTime() - d2.getTime()) / (1000 * 3600 * 24)) // https://linuxhint.com/calculate-days-between-two-dates-javascript/
					const days = days_between(new Date(target_date_str), new Date())
					let days_text = ''
					if      (days > 7) {days_text = `${Math.floor(days/7)} weeks`}
					else if (days > 0) {days_text =                `${days} days`}
					if (days_text) {
						document.getElementById("days_until_event").textContent = `${days_text} until BarCamp`
					}
				</script>
			</div>
		</div>
	</div>

	<div class="ribbon l-box-lrg pure-g">
		<div class="l-box-lrg is-center pure-u-1 pure-u-md-1-2 pure-u-lg-2-5">
			<img width="300" alt="File Icons" class="pure-img-responsive" src="/images/barcampcanterbury_logo.svg">
		</div>
		<div class="pure-u-1 pure-u-md-1-2 pure-u-lg-3-5">

			<h2 class="content-head content-head-ribbon">Laboris nisi ut aliquip.</h2>

			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
				quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat. Duis aute irure dolor.
			</p>
		</div>
	</div>

	<div class="content">
		<h2 class="content-head is-center">Dolore magna aliqua. Uis aute irure.</h2>

		<div class="pure-g">
			<div class="l-box-lrg pure-u-1 pure-u-md-2-5">
				<form class="pure-form pure-form-stacked">
					<fieldset>

						<label for="name">Your Name</label>
						<input id="name" type="text" placeholder="Your Name">


						<label for="email">Your Email</label>
						<input id="email" type="email" placeholder="Your Email">

						<label for="password">Your Password</label>
						<input id="password" type="password" placeholder="Your Password">

						<button type="submit" class="pure-button">Sign Up</button>
					</fieldset>
				</form>
			</div>

			<div class="l-box-lrg pure-u-1 pure-u-md-3-5">
				<h4>Contact Us</h4>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat.
				</p>

				<h4>More Information</h4>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua.
				</p>
			</div>
		</div>

	</div>

	##<div class="footer l-box is-center">
	##    View the source of this layout to learn more. Made with love by the Pure Team.
	##</div>

</div>


</body>
</html>