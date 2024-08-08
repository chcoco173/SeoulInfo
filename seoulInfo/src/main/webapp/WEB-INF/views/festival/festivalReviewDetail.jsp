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
		/* Flexbox 컨테이너 스타일 추가 */
		.flex-container {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 20px;
		}

		.flex-item {
		    flex: 1;
		    min-width: 300px; /* 최소 너비 설정 */
		}

		/* 이미지 크기 조정 */
		.image-overflow-wrapper img {
		    width: 40%; /* 가로 크기를 4분의 1로 줄이기 */
		    height: auto; /* 비율을 유지하며 크기 조정 */
			align: center;
		}
		@media (min-width:992px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}@media (max-width:991px) and (min-width:768px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}</style>
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
		<img src="../static/festRevImage/4cd4db1bf98e01c9c5c0fae27728fa7a">
		<!-- 리뷰 사진 start -->
		<div class="main-wrapper">
		    <div class="section-destination-banner">
		        <div class="padding-global">
		            <div class="padding-section-medium">
		                <div class="container-full-width">
		                    <div data-w-id="a984475f-e10a-c912-ac29-53a066823d5a" style="opacity:0" class="_3-column-grid">
		                        <c:forEach items="${images}" var="image">
		                            <div id="w-node-_9eb9e867-d75f-01e1-e35b-5c8e2fc339e3-4f5c4823" data-w-id="9eb9e867-d75f-01e1-e35b-5c8e2fc339e3" style="opacity:0" class="image-overflow-wrapper">
		                                <div id="w-node-a984475f-e10a-c912-ac29-53a066823d5b-4f5c4823" data-w-id="a984475f-e10a-c912-ac29-53a066823d5b" style="background-image: url('${image.fr_imgUrl}'); -webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform-style:preserve-3d" class="destination-featured-image">
											<img src="${image.fr_imgUrl}">
										</div>
		                            </div>
		                        </c:forEach>
		                    </div>
		                    <div data-w-id="a984475f-e10a-c912-ac29-53a066823d5e" style="opacity:0" class="destination-banner">
		                        <div class="accent text-color-white">후기 제목</div>
		                        <h1 class="text-color-white">${review.fr_title}</h1>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		<!-- 리뷰 사진 end --> 
		<!-- 리뷰 내용 start -->
		<div class="main-wrapper">
		    <div class="padding-global">
		        <div class="padding-section-medium">
		            <div class="container-full-width">
		                <div class="flex-container">
		                    <div class="flex-item text-color-black review-content">
		                        <p>${review.fr_content}</p>
		                        <p>작성자: ${review.member_id}</p>
		                        <p>작성일: <fmt:formatDate value="${review.fr_regdate}" pattern="yyyy-MM-dd" /></p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- 리뷰 내용 end -->
	<!-- 추가해야할 댓글 리스트 start -->
	<div class="section-posts-row">
	    <div class="padding-global">
	        <div class="padding-section-medium remove-top-padding">
	            <div class="container-full-width">
	                <h4 data-w-id="e144bf26-0d49-109b-1b5b-756bc18db81f" style="opacity:0">댓글 목록</h4>
	                <div class="spacer-xlarge"></div>
	                <div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db822" style="opacity:0" class="divider-line"></div>
	                <div class="spacer-xlarge"></div>
	                <div class="w-dyn-list">
	                    <div role="list" class="w-dyn-items">
	                        <c:forEach items="${commentList}" var="comment">
	                            <div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db826" style="opacity:0" role="listitem" class="w-dyn-item">
	                                <div class="post-row-grid">
	                                    <div id="w-node-e144bf26-0d49-109b-1b5b-756bc18db82a-4f5c4823" class="post-row-wrapper">
	                                        <div class="tags-wrappers">
	                                            <a href="#" class="tag w-inline-block">
	                                                <div class="text-size-small">${comment.member_id}</div>
	                                            </a>
	                                        </div>
	                                        <div class="comment-content">
	                                            <p>${comment.comment_content}</p>
	                                            <div class="small-author-wrapper">
	                                                <div class="line-divider"></div>
	                                                <div class="text-size-regular text-color-dark-gray"><fmt:formatDate value="${comment.comment_regdate}" pattern="yyyy-MM-dd" /></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </c:forEach>  
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 축제리뷰 리스트 end -->
		<!-- 댓글 작성하기 start -->
		<div class="section-newsletter">
			<div class="padding-global">
				<div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd"
					class="container-newsletter background-black">
					<div class="_2-column-grid-uneven-right">
						<h3 class="newsletter-heading">댓글을 작성해주세요!</h3>
						<div id="Style-Guide-Form"
							class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
							<form name="wf-form-Newsletter-Form" data-name="Newsletter Form"
								method="get" id="wf-form-Newsletter-Form"
								class="newsletter-form"
								data-wf-page-id="628ab4b45549af6399a230d3"
								data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
								<input class="form-field newsletter w-input" maxlength="256"
									name="Email" data-name="Email" placeholder="내용을 입력하세요"
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
  <script>	
	var newReviewBtn = document.getElementById('newReviewBtn');
	var festivalId = document.getElementById('festival_id').value;

	newReviewBtn.onclick = function() {
	    alert(festivalId);
	    window.location.href = "/festival/festivalReview?festival_id=" + festivalId;
	}

  </script>
	  
  <script
  	src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
  	type="text/javascript"
  	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  	crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>

</html>
