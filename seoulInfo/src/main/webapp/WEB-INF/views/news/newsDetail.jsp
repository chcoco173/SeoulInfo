<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  -->
<!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JADE&#x27;s Dandy Site</title>
<meta content="" property="og:title">
<meta content="" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<style>
@media ( min-width :992px) {
	html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"]
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
	html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"]
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
<script type="text/javascript">
	WebFont.load({
		google : {
			families : [ "Plus Jakarta Sans:regular,600,italic,600italic" ]
		}
	});
</script>
<script type="text/javascript">
	!function(o, c) {
		var n = c.documentElement, t = " w-mod-";
		n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch
				&& c instanceof DocumentTouch)
				&& (n.className += t + "touch")
	}(window, document);
</script>
<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
</head>
<body>
	<div class="page-wrapper">

		<!-- 검색창 start -->
		<div class="navigation-wrapper background-black">
			<div class="navigation-wrapper">
				<div data-animation="default" data-collapse="medium"
					data-duration="400" data-easing="ease" data-easing2="ease"
					role="banner" class="navbar_m w-nav">
					<div class="nav-wrapper">
						<a href="/" aria-current="page"
							class="brand w-nav-brand w--current"> <img
							src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
							alt="">
						</a>
						<div class="links-and-search-wrapper">
							<%
								if (session.getAttribute("member") != null) {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/festival/festival?area=${param.area}"
									class="nav-link w-nav-link">문화행사</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
									class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
									class="nav-link w-nav-link">로그아웃</a>
							</nav>
							<%
								} else {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/festival/festival?area=${param.area}"
									class="nav-link w-nav-link">문화행사</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/member/login"
									class="nav-link w-nav-link">로그인</a>
							</nav>
							<%
								}
							%>
							<form action="/search"
								data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
								class="search w-form">
								<div class="search-div">
									<img src="/images/ph_magnifying-glass-light-xsmall.svg"
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
												class="close-search-link-block w-inline-block"> <img
												src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
												class="icon-1x1-xsmall">
											</a>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="menu-button w-nav-button">
							<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
								class="icon-1x1-xsmall">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 검색창 end -->

		<div class="main-wrapper">
			<!-- 뉴스(제목,이미지) start-->
			<div class="section-post-banner background-black">
				<div class="padding-global">
					<div class="padding-section-medium">
						<div class="container-full-width">
							<h1 class="text-color-white">${news.news_title}</h1>
							<div class="spacer-xlarge"></div>
							<div class="spacer-xlarge"></div>
							<div class="image-overflow-wrapper">
								<div style="background-image:url('${news.news_imageurl}');"
									class="post-featured-image"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 뉴스(제목,이미지) end-->

			<!-- 뉴스(내용) start -->
			<div class="section-post-text">
				<div class="padding-global">
					<div class="padding-section-medium remove-bottom-padding">
						<div class="container-small">
							<div class="rich-text w-richtext">
								<p id="news-content">${news.news_content}</p>
								
								<div class="text-size-regular text-color-dark-gray w-dyn-bind" >
									<span>작성일자 : </span>
									<fmt:formatDate value="${news.news_date}" pattern="yyyy-MM-dd"/>
								</div>
								<a href="${news.news_link}">뉴스 사이트 바로 가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="spacer-xxlarge"></div>
			<!-- 뉴스(내용) end -->

		</div>
		<!-- main-wrapper end -->
		
		<div class="section-footer">
			<div class="padding-global">
				<div class="spacer-xxlarge"></div>
				<div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe"
					class="container-footer">
					<div class="padding-global">
						<div class="padding-section-medium">
							<div class="_2-column-grid">
								<a href="/" aria-current="page"
									class="w-inline-block w--current"><img
									src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
									alt=""></a>
								<div>
									<h3>The stories of a travel photographer and blogger
										exploring the world .</h3>
									<div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb"
										class="spacer-xxlarge"></div>
								</div>
							</div>
							<div class="_2-column-grid footer">
								<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb"
									class="footer-micro-links-wrapper">
									<p class="text-size-small">
										Website template by <a
											href="https://www.callistodigitalstudio.com/" target="_blank"
											class="text-size-small">Callisto Digital Studio</a>.
									</p>
									<p class="text-size-small">
										Powered by <a
											href="https://webflow.com/templates/html/sightseer-travel-website-template"
											target="_blank" class="text-size-small">Webflow</a>.
									</p>
								</div>
								<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb"
									class="_3-column-grid footer-links">
									<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
										<h4>About</h4>
										<div class="spacer-large"></div>
										<a href="about" class="footer-link">About</a> <a
											href="contact" class="footer-link">Contact</a>
									</div>
									<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
										<h4>Social</h4>
										<div class="spacer-large"></div>
										<a href="http://tiktok.com" target="_blank"
											class="footer-link">TikTok</a> <a href="http://Instagram.com"
											target="_blank" class="footer-link">Instagram</a> <a
											href="http://Facebook.com" target="_blank"
											class="footer-link">Facebook</a> <a href="http://Youtube.com"
											target="_blank" class="footer-link">Youtube</a>
									</div>
									<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
										<h4>Theme</h4>
										<div class="spacer-large"></div>
										<a href="template/template-style-guide.html"
											class="footer-link">Style Guide</a> <a
											href="template/changelog.html" class="footer-link">Changelog</a>
										<a href="template/licenses.html" class="footer-link">Licenses</a>
										<a
											href="https://webflow.com/templates/designers/callisto-digital-studio"
											target="_blank" class="footer-link">All Templates</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="spacer-xxlarge"></div>
			</div>
		</div>
		<!-- section-footer end -->

	</div>
	<!--page-wrapper end -->

	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var contentElement = document.getElementById('news-content');
		    var content = contentElement.innerHTML;

		    // "☞ [관련 기사]" 문구를 제거
		    content = content.replace(/☞ \[관련 기사\]/g, '');
			content = content.replace(/☞ \상세내용 바로가기/g, '');

		    // "ⓒ" 문자와 그 뒤의 세 글자를 제거
		    content = content.replace(/ⓒ.{3}/g, '');
		    content = content.replace(/Ⓒ.{3}/g, '');
		    content = content.replace(/©.{3}/g, '');

		    // 시작과 끝에 <p> 태그 추가
		    content = '<p>' + content + '</p>';

		    // "다."로 끝나는 부분마다 줄바꿈을 추가
		    content = content.replace(/다\./g, '다.</p><p>');
		    content = content.replace(/\?/g, '?<br>');

		    // "▴" 앞에 <br> 태그 추가
		    content = content.replace(/▴/g, '<br>▴');

		    // "○" 모양이 있는 부분을 <dl><dd>로 묶음
		    content = content.replace(/(○.*?)(?=(○|$))/gs, '<dl><dd>$1</dd></dl>');

		    // 첫 번째 <dl> 태그 앞에 <hr> 추가
		    content = content.replace('<dl>', '<hr><dl>');
			// "-" 앞에 공백이 있는 경우 <br> 태그 추가
			 content = content.replace(/　- /g, '<br> &nbsp; - ');
			 content = content.replace(/⁲-/g, '<br> &nbsp; ⁲- ');

		    // "?" 문자 뒤에 <br> 태그 추가
		    content = content.replace(/\?/g, '?<br>');

		    // 시작과 끝에 <p> 태그 추가 (이전에 추가된 <p> 태그와 중첩되지 않도록 수정)
		    content = content.replace(/<p><\/p>/g, ''); // 빈 <p> 태그 제거
		    content = content.replace(/<\/dd><dd>/g, '</dd><dd>'); // 중첩된 <dd> 태그 제거

		    // 여러 개의 <p></p> 사이에 불필요한 공백 제거
		    content = content.replace(/<\/p>\s*<p>/g, '</p><p>');

		    contentElement.innerHTML = content;
		});

	</script>


</body>
</html>
