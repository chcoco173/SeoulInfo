<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4820"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도 생성하기</title>
<link href="/css/evMain.css" rel="stylesheet" type="text/css">



<!-- template default setting -->
<meta content="Sightseer - Webflow Travel Photography Website Template"
	name="description">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="og:title">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="og:description">
<meta
	content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg"
	property="og:image">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="twitter:title">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="twitter:description">
<meta
	content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg"
	property="twitter:image">
<meta property="og:type" content="website">
<meta content="summary_large_image" name="twitter:card">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<style>
@media ( min-width :992px) {
	html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"]
		{
		-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0)
			rotateZ(0) skew(0, 0);
	}
}

@media ( max-width :991px) and (min-width:768px) {
	html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"]
		{
		-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		-moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		-ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0)
			rotateY(0) rotateZ(0) skew(0, 0);
		transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0)
			rotateZ(0) skew(0, 0);
	}
}
</style>
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
<style>
/* 기본 CSS 설정 */
#map {
	width: 50%;
	height: 1000px;
	position: relative; /* Position 설정 */
	z-index: -99
}

.map-filter {
	position: absolute; /* 절대 위치 설정 */
	z-index: 100; /* z-index 설정 */
	background-color: rgba(255, 255, 255, 0.8); /* 배경색 및 투명도 설정 */
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="page-wrapper">
		<div class="navigation-wrapper">
			<div data-animation="default" data-collapse="medium"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="navbar w-nav">
				<div class="nav-wrapper">
					<a href="index.html" aria-current="page"
						class="brand w-nav-brand w--current"><img
						src="images/ph_globe-simple-light-medium.svg" loading="lazy"
						alt=""></a>
					<div class="links-and-search-wrapper">
						<nav role="navigation" class="nav-links-wrapper w-nav-menu">
							<a href="about" class="nav-link w-nav-link">About</a> <a
								href="contact" class="nav-link w-nav-link">Contact</a>
						</nav>
						<form action="/search"
							data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
							class="search w-form">
							<div class="search-div">
								<img src="images/ph_magnifying-glass-light-xsmall.svg"
									loading="lazy" alt="" class="icon-1x1-xsmall">
							</div>
							<div class="nav-search-outer-wrapper">
								<div class="nav-search-internal-wrapper">
									<input class="form-field w-input" maxlength="256" name="query"
										placeholder="Search…" type="search" id="search" required="">
									<div class="search-button-wrapper">
										<input type="submit" class="button-primary-small w-button"
											value="Search"> <a
											data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
											class="close-search-link-block w-inline-block"><img
											src="images/ph_x-light-xsmall.svg" loading="lazy" alt=""
											class="icon-1x1-xsmall"></a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="menu-button w-nav-button">
						<img src="images/ph_list-light-xsmall.svg" loading="lazy" alt=""
							class="icon-1x1-xsmall">
					</div>
				</div>
			</div>
		</div>
		<br>
		<hr />
		<!-- end of header -->
		<div class="container">
			<div class="mapFilter">
				<table style="padding-left: 10%;">
						<tr>
							<td style="width: 20%;"><header>
									<div class="test">
										<span class="btn-primary" ><button onclick="alert('test')">search</button></span> | 
										<span><button onclick="alert('test')">navigation</button></span> | 
										<span><button onclick="alert('test')">like</button>
									</div>
								</header>
								<section>
									<form>
										<div>type</div>
										<select class="id">
											<option>all</option>
											<option>dd1</option>
											<option>dd2</option>
											<option>dd3</option>
											<option>dd4</option>
										</select>
										<div>company</div>
										<select class="id">
											<option>INTP</option>
											<option>ENTP</option>
											<option>ESTP</option>
											<option>INFJ</option>
										</select>
										<div>location</div>
										<select class="id">
											<option>all</option>
											<option>dd1</option>
											<option>dd2</option>
											<option>dd3</option>
											<option>dd4</option>
										</select><br> <select class="id">
											<option>dd</option>
											<option>dd1</option>
											<option>dd2</option>
											<option>dd3</option>
											<option>dd4</option>
										</select> <input placeholder="test"><br>
										<button>1</button>
										<button>2</button>
										<hr>
									</form>
								</section>
								<section>
									<dd>
										<dl>
											<div>
												<img src="" alt="mark">&nbsp; <span>test</span> &nbsp;
												<span>using</span> <label htmlFor=""></label>
											</div>
										</dl>
										<dl>
											<img src="" alt="mark2">&nbsp;
											<span>test</span> &nbsp;
											<span>using</span>
											<label htmlFor=""></label>
										</dl>
									</dd>
								</section></td>
						</tr>
				</table>
				</div>
			<!-- Map container -->
			<div class="map"><%@ include file="mapFilter.jsp"%></div>
		</div>
	</div>

		<script
			src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
			type="text/javascript"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
			crossorigin="anonymous"></script>
		<script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>