<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<script type="text/javascript">WebFont.load({ google: { families: ["Plus Jakarta Sans:regular,600,italic,600italic"] }});</script>
<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
<style>
/* 상단 nav 와 .destination-banner 를 떨어뜨려 놓음 */
.navbar_m.w-nav {
	margin-bottom: 120px; /* 기본 마진 */
}


@media ( max-width : 768px) {
	.navbar_m.w-nav {
		margin-bottom: 10px; /* 작은 화면에서는 마진을 줄임 */
	}
}

@media ( max-width : 480px) {
	.navbar_m.w-nav {
		margin-bottom: 5px; /* 매우 작은 화면에서는 마진을 더 줄임 */
	}
}
</style>
</head>
<body>
	<div class="page-wrapper">
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
						
					</div>
					<div class="menu-button w-nav-button">
						<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
							class="icon-1x1-xsmall">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main-wrapper">
		<div class="section-destination-banner">
			<div class="padding-global">
				<div class="padding-section-medium">
					<div class="container-full-width"></div>				
					<div data-w-id="a984475f-e10a-c912-ac29-53a066823d5e"
						style="opacity: 0" class="destination-banner">
						<c:forEach items="${newsList}" var="news" varStatus="status">
							<c:if test="${status.first}">
								<c:choose>
									<c:when test="${param.area == '전체'}">
										<h1 class="text-color-white w-dyn-bind">전체</h1>
									</c:when>
									<c:otherwise>
										<h1 class="text-color-white w-dyn-bind">${news.news_area}</h1>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="section-posts-row">
		<div class="padding-global">
			<div class="padding-section-medium remove-top-padding">
				<div class="container-full-width">
					<h2 data-w-id="e144bf26-0d49-109b-1b5b-756bc18db81f"
						style="opacity: 0">최신 뉴스</h2>
					<div class="spacer-xlarge"></div>
					<div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db822"
						style="opacity: 0" class="divider-line"></div>
					<div class="spacer-xlarge"></div>
					<div class="w-dyn-list">
						<div role="list" class="w-dyn-items" id="filteredList">
							<c:forEach items="${newsList}" var="news">
								<dd data-w-id="e144bf26-0d49-109b-1b5b-756bc18db826"
									style="opacity: 0" role="listitem" class="w-dyn-item">
									<div class="post-row-grid">
										
											<img
											id="w-node-e144bf26-0d49-109b-1b5b-756bc18db829-4f5c4823"
											data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"
											src="${news.news_imageurl}" alt="뉴스 이미지"
											style="width: 100%; height: auto;" class="post-row-image">
										</a>
										<div id="w-node-e144bf26-0d49-109b-1b5b-756bc18db82a-4f5c4823"
											class="post-row-wrapper">
											<div class="tags-wrappers">
												<a href="#" class="tag w-inline-block">
													<div class="text-size-small w-dyn-bind">${news.news_area}</div>
												</a>
											</div>
											
												<h3 class="w-dyn-bind">${news.news_title}</h3>
											</a>
											<div class="small-author-wrapper">
												<div class="line-divider"></div>
												<div
													class="text-size-regular text-color-dark-gray w-dyn-bind">
													<fmt:formatDate value="${news.news_date}"
														pattern="yyyy-MM-dd" />
												</div>
											</div>
											<div class="small-author-wrapper">
												<div class="line-divider"></div>
												<div
													class="text-size-regular text-color-dark-gray w-dyn-bind">
													<a href="${news.news_link}">뉴스 사이트 바로 가기</a>
												</div>
											</div>
										</div>
									</div>
								</dd>
							</c:forEach>
						</div>

						<div role="navigation" aria-label="List"
							class="w-pagination-wrapper pagination">
							<button id="filtered-prevPage"
								class="w-pagination-previous previous" disabled>
								<img src="/images/ph_arrow-left-light-xxsmall.svg"
									loading="lazy" alt="" class="icon-1x1-xxsmall">
								<div class="text-size-small w-inline-block">Previous</div>
							</button>
							<div id="filtered-pageInfo" class="page-info">1 / 1</div>
							<button id="filtered-nextPage" class="w-pagination-next next"
								disabled>
								<div class="text-size-small w-inline-block">Next</div>
								<img src="/images/ph_arrow-right-light-xxsmall.svg"
									loading="lazy" alt="" class="icon-1x1-xxsmall">
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="section-footer">
		<div class="padding-global">
			<div class="spacer-xxlarge"></div>
			<div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe"
				class="container-footer">
				<div class="padding-global">
					<div class="padding-section-medium">
						<div class="_2-column-grid">
							<a href="/" class="w-inline-block"><img
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
									<a href="about.html" class="footer-link">About</a> <a
										href="contact.html" class="footer-link">Contact</a>
								</div>
								<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
									<h4>Social</h4>
									<div class="spacer-large"></div>
									<a href="http://tiktok.com" target="_blank" class="footer-link">TikTok</a>
									<a href="http://Instagram.com" target="_blank"
										class="footer-link">Instagram</a> <a
										href="http://Facebook.com" target="_blank" class="footer-link">Facebook</a>
									<a href="http://Youtube.com" target="_blank"
										class="footer-link">Youtube</a>
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
				<div class="spacer-xxlarge"></div>
			</div>
		</div>
	</div>

	</div>

	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<!-- 페이지 맨 위로 올라가게 수정 -->
	<script>
       $(document).ready(function() {
           var itemsPerPage = 6; // 페이지당 보여줄 항목 수
           var currentPage = 1; // 현재 페이지
           var $filteredItems = $('#filteredList dd'); // 필터링된 항목들
           var totalItems = $filteredItems.length; // 전체 항목 수
           var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수

           function showPage(page) {
               $filteredItems.hide();
               $filteredItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
               $('#filtered-pageInfo').text(page + ' / ' + totalPages);
               $('#filtered-prevPage').prop('disabled', page === 1);
               $('#filtered-nextPage').prop('disabled', page === totalPages);
           }
           
           function scrollToTop() {
               $('html, body').animate({
                   scrollTop: 0
               }, 500);
           }

           $('#filtered-prevPage').click(function() {
               if (currentPage > 1) {
                   currentPage--;
                   showPage(currentPage);
                   scrollToTop();
               }
           });

           $('#filtered-nextPage').click(function() {
               if (currentPage < totalPages) {
                   currentPage++;
                   showPage(currentPage);
                   scrollToTop();
               }
           });

           $('.tag.w-inline-block').click(function() {
               scrollToTop();
           });

           // 초기 페이지 로드
           showPage(currentPage);
       });
   </script>
</body>
</html>
