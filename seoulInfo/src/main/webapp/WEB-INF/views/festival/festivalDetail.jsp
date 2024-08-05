<%@page contentType="text/html; charset=UTF-8"%>
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
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
									class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
									class="nav-link w-nav-link">로그아웃</a>
							</nav>
							<%
								} else {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
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
		<!-- 검색창 end -->
		
		<!-- 축제(제목,이미지) start-->
		  <div class="main-wrapper">
		    <div class="section-post-banner background-black">
		      <div class="padding-global">
		        <div class="padding-section-medium">
		          <div class="container-full-width">
		            <h1 data-w-id="180b513c-4540-bab3-7036-972b35d8ddc4" style="opacity:0" class="text-color-white w-dyn-bind-empty"></h1>
		            <div class="spacer-xlarge"></div>
		            <div data-w-id="771e0065-68e3-960e-1e46-624d6820421c" style="opacity:0" class="post-author-and-tags-wrapper">
		              <a href="#" class="large-author-wrapper w-inline-block">
		                <div class="large-author-thumbnail"></div>
		                <div>
		                  <div class="text-size-regular text-color-white w-dyn-bind-empty"></div>
		                  <div class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
		                </div>
		              </a>
		              <div class="tags-wrappers">
		                <a href="#" class="tag w-inline-block">
		                  <div class="text-size-small w-dyn-bind-empty"></div>
		                </a>
		                <a href="#" class="tag w-inline-block">
		                  <div class="text-size-small w-dyn-bind-empty"></div>
		                </a>
		              </div>
		            </div>
		            <div class="spacer-xlarge"></div>
		            <div class="image-overflow-wrapper">
		              <div data-w-id="10bfb973-e4fc-fd4f-7f86-22b02dc42218" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="post-featured-image"></div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		    <div class="section-post-text">
		      <div class="padding-global">
		        <div class="padding-section-medium remove-bottom-padding">
		          <div class="container-small">
		            <div data-w-id="ea3e6aa5-b9ca-36db-ec21-7072a097305a" style="opacity:0" class="rich-text w-dyn-bind-empty w-richtext"></div>
		          </div>
		        </div>
		      </div>
		    </div>
		    <div class="section-posts-grid background-light-gray">
		      <div class="padding-global">
		        <div class="padding-section-medium">
		          <div class="container-full-width">
		            <h2 data-w-id="9cd55f64-9d5f-e93b-4891-5196167f55bc" style="opacity:0">Keep exploring</h2>
		            <div class="spacer-xlarge"></div>
		            <div data-w-id="b1e774c6-4b2b-b3d4-cf1a-05e688bc0a4b" style="opacity:0" class="divider-line"></div>
		            <div class="spacer-xlarge"></div>
		            <div class="w-dyn-list">
		              <div role="list" class="_3-column-grid w-dyn-items">
		                <div data-w-id="3685bd48-e5ab-20e0-9347-b40d2d3445f4" style="opacity:0" role="listitem" class="post-grid-collection-item w-dyn-item">
		                  <div class="post-grid-wrapper">
		                    <a id="w-node-_4786a47f-17a7-4845-3f57-410c5a533ed6-4f5c4821" href="#" class="cms-grid-image-overflow-container w-inline-block">
		                      <div data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5" class="cms-grid-image"></div>
		                    </a>
		                    <div class="tags-wrappers">
		                      <a href="#" class="tag w-inline-block">
		                        <div class="text-size-small w-dyn-bind-empty"></div>
		                      </a>
		                      <a href="#" class="tag w-inline-block">
		                        <div class="text-size-small w-dyn-bind-empty"></div>
		                      </a>
		                    </div>
		                    <a id="w-node-a84994d4-c317-d35e-36e3-09e254755d94-4f5c4821" href="#" class="w-inline-block">
		                      <h3 class="w-dyn-bind-empty"></h3>
		                    </a>
		                    <div class="small-author-wrapper">
		                      <a href="#" class="author-pic-and-name-wrapper w-inline-block">
		                        <div class="small-author-thumbnail"></div>
		                        <div class="text-size-regular w-dyn-bind-empty"></div>
		                      </a>
		                      <div class="line-divider"></div>
		                      <div class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
		                    </div>
		                  </div>
		                  <div class="grid-post-link-wrapper">
		                    <a href="#" class="button-text-only w-button">Read more</a>
		                    <a id="w-node-a66acb0f-ee54-d598-d077-87c3081e470b-4f5c4821" href="#" class="button-icon hide-mobile-landscape w-inline-block"><img src="images/ph_arrow-up-right-light-xxsmall-dark-gray.svg" loading="lazy" alt="" class="icon-1x1-xxsmall"></a>
		                  </div>
		                </div>
		              </div>
		              <div class="empty-state w-dyn-empty">
		                <div class="text-size-regular">${festival.festival_id}</div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		    <div class="spacer-xxlarge"></div>
		  </div>
		  <!-- 댓글 작성하기 start -->
		  <div class="section-newsletter">
		  	<div class="padding-global">
		  		<div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd"
		  			class="container-newsletter background-black">
		  			<div class="_2-column-grid-uneven-right">
		  				<h3 class="newsletter-heading">댓글</h3>
		  				<div id="Style-Guide-Form"
		  					class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
		  					<form name="wf-form-Newsletter-Form" data-name="Newsletter Form"
		  						method="get" id="wf-form-Newsletter-Form"
		  						class="newsletter-form"
		  						data-wf-page-id="628ab4b45549af6399a230d3"
		  						data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
		  						<input class="form-field newsletter w-input" maxlength="256"
		  							name="Email" data-name="Email" placeholder="댓글을 작성해주세요."
		  							type="email" id="Email" required="" /> <input type="submit"
		  							data-wait="Please wait..."
		  							class="button-primary-large max-width-full-mobile-portrait w-button"
		  							value="댓글달기" />
		  					</form>
		  					<div class="form-success-message w-form-done">
		  						<div class="text-size-regular text-color-white">Thank you!
		  							Your submission has been received!</div>
		  					</div>
		  					<div class="form-error-message w-form-fail">
		  						<div class="text-size-regular">Oops! Something went wrong
		  							while submitting the form.</div>
		  					</div>
		  				</div>
		  			</div>
		  		</div>
		  	</div>
		  </div>
		  <!-- 댓글 작성하기 end -->

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
  <script
  	src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
  	type="text/javascript"
  	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  	crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>

</html>
