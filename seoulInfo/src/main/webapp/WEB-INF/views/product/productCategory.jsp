<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
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
	html.w-mod-js:not (.w-mod-ix ) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"]
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
	html.w-mod-js:not (.w-mod-ix ) [data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"]
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
<link href="/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.category-tab {
	margin-bottom: 20px;
	justify-content: center;
}

.category-tab .col-md-2 {
	padding-left: 5px;
	padding-right: 5px;
}

.category-tab p {
	margin: 0;
	padding: 10px 0;
}

.category-tab img {
	width: 24px;
	height: 24px;
	margin-bottom: 5px;
}

.category-tab .active {
	background-color: #e0e0e0;
	border-radius: 5px;
}

.product-card {
	margin: 20px 0;
}

.product-card img {
	width: 100%;
	height: auto;
}

.product-info {
	text-align: left;
}
</style>
</head>
<body>
	<div class="page-wrapper">
		
		<%@include file="../productNav/productNav.jsp"%>
		
		<div class="main-wrapper">
			<div class="section-destination-banner">
				<div class="padding-global">
					<div class="padding-section-medium">
						<div class="container-full-width">
							<div class="container my-5">
								<div class="row">
									<div class="col-12">
										<h1 class="text-center">${category}</h1>
									</div>
								</div>

								<div class="container my-5">
									<!-- 카테고리 탭 -->
									<!-- <div class="row category-tab text-center">
										<div class="col-md-2">
											<img src="https://via.placeholder.com/24" alt="전자제품">
											<p>전자제품</p>
										</div>
										<div class="col-md-2">
											<img src="https://via.placeholder.com/24" alt="생활 용품">
											<p>생활 용품</p>
										</div>
										<div class="col-md-2">
											<img src="https://via.placeholder.com/24" alt="도서">
											<p>도서</p>
										</div>
										<div class="col-md-2">
											<img src="https://via.placeholder.com/24" alt="의류">
											<p>의류</p>
										</div>
										<div class="col-md-2">
											<img src="https://via.placeholder.com/24" alt="기타">
											<p>기타</p>
										</div>
									</div>
 -->
									<!--  상품 ( jstl로 들어갈 예정 ) -->
									<div class="row">
										<div class="col-md-3">
											<div class="product-card">
												<img src="https://via.placeholder.com/200" alt="상품 1"
													class="product-image">
												<div class="product-info">
													<h4>상품 1</h4>
													<p>상품 1 설명</p>
													<p>
														<strong>₩10,000</strong>
													</p>
													<p>
														관심 5 <span style="margin-left: 20px;">상태: 판매중</span>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="product-card">
												<img src="https://via.placeholder.com/200" alt="상품 2"
													class="product-image">
												<div class="product-info">
													<h4>상품 2</h4>
													<p>상품 2 설명</p>
													<p>
														<strong>₩20,000</strong>
													</p>
													<p>
														관심 10 <span style="margin-left: 20px;">상태: 판매완료</span>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="product-card">
												<img src="https://via.placeholder.com/200" alt="상품 3"
													class="product-image">
												<div class="product-info">
													<h4>상품 3</h4>
													<p>상품 3 설명</p>
													<p>
														<strong>₩30,000</strong>
													</p>
													<p>
														관심 2 <span style="margin-left: 20px;">상태: 예약중</span>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="product-card">
												<img src="https://via.placeholder.com/200" alt="상품 4"
													class="product-image">
												<div class="product-info">
													<h4>상품 4</h4>
													<p>상품 4 설명</p>
													<p>
														<strong>₩40,000</strong>
													</p>
													<p>
														관심 8 <span style="margin-left: 20px;">상태: 판매중</span>
													</p>
												</div>
											</div>
										</div>
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
										style="opacity: 0">Most recent captures</h2>
									<div class="spacer-xlarge"></div>
									<div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db822"
										style="opacity: 0" class="divider-line"></div>
									<div class="spacer-xlarge"></div>
									<div class="w-dyn-list">
										<div role="list" class="w-dyn-items">
											<div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db826"
												style="opacity: 0" role="listitem" class="w-dyn-item">
												<div class="post-row-grid">
													<a
														id="w-node-e144bf26-0d49-109b-1b5b-756bc18db828-4f5c4823"
														data-w-id="e144bf26-0d49-109b-1b5b-756bc18db828" href="#"
														class="post-row-image-overflow-container w-inline-block">
														<div
															id="w-node-e144bf26-0d49-109b-1b5b-756bc18db829-4f5c4823"
															data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"
															style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
															class="post-row-image"></div>
													</a>
													<div
														id="w-node-e144bf26-0d49-109b-1b5b-756bc18db82a-4f5c4823"
														class="post-row-wrapper">
														<div class="tags-wrappers">
															<a href="#" class="tag w-inline-block">
																<div class="text-size-small w-dyn-bind-empty"></div>
															</a> <a href="#" class="tag w-inline-block">
																<div class="text-size-small w-dyn-bind-empty"></div>
															</a>
														</div>
														<a
															id="w-node-e144bf26-0d49-109b-1b5b-756bc18db830-4f5c4823"
															href="#" class="w-inline-block">
															<h3 class="w-dyn-bind-empty"></h3>
														</a>
														<div class="small-author-wrapper">
															<a href="#"
																class="author-pic-and-name-wrapper w-inline-block">
																<div class="small-author-thumbnail"></div>
																<div class="text-size-regular w-dyn-bind-empty"></div>
															</a>
															<div class="line-divider"></div>
															<div
																class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
														</div>
													</div>
													<a
														id="w-node-e144bf26-0d49-109b-1b5b-756bc18db838-4f5c4823"
														data-w-id="e144bf26-0d49-109b-1b5b-756bc18db838" href="#"
														class="button-icon hide-mobile-landscape w-inline-block"><img
														src="/images/ph_arrow-up-right-light-xxsmall-dark-gray.svg"
														loading="lazy" alt="" class="icon-1x1-xxsmall"></a>
												</div>
											</div>
										</div>
										<div class="empty-state w-dyn-empty">
											<div class="text-size-regular">No items found.</div>
										</div>
										<div role="navigation" aria-label="List"
											class="w-pagination-wrapper pagination">
											<a href="#" aria-label="Previous Page"
												class="w-pagination-previous previous"><img
												src="/images/ph_arrow-left-light-xxsmall.svg" loading="lazy"
												alt="" class="icon-1x1-xxsmall">
												<div class="text-size-small w-inline-block">Previous</div> </a>
											<a href="#" aria-label="Next Page"
												class="w-pagination-next next">
												<div class="text-size-small w-inline-block">Next</div> <img
												src="/images/ph_arrow-right-light-xxsmall.svg" loading="lazy"
												alt="" class="icon-1x1-xxsmall">
											</a>
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
										<a href="index.html" class="w-inline-block"><img
											src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
											alt=""></a>
										<div>
											<h3>The stories of a travel photographer and blogger
												exploring the world .</h3>
											<div
												id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb"
												class="spacer-xxlarge"></div>
										</div>
									</div>
									<div class="_2-column-grid footer">
										<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb"
											class="footer-micro-links-wrapper">
											<p class="text-size-small">
												Website template by <a
													href="https://www.callistodigitalstudio.com/"
													target="_blank" class="text-size-small">Callisto
													Digital Studio</a>.
											</p>
											<p class="text-size-small">
												Powered by <a
													href="https://webflow.com/templates/html/sightseer-travel-website-template"
													target="_blank" class="text-size-small">Webflow</a>.
											</p>
										</div>
										<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb"
											class="_3-column-grid footer-links">
											<div
												id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
												<h4>About</h4>
												<div class="spacer-large"></div>
												<a href="about.html" class="footer-link">About</a> <a
													href="contact.html" class="footer-link">Contact</a>
											</div>
											<div
												id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
												<h4>Social</h4>
												<div class="spacer-large"></div>
												<a href="http://tiktok.com" target="_blank"
													class="footer-link">TikTok</a> <a
													href="http://Instagram.com" target="_blank"
													class="footer-link">Instagram</a> <a
													href="http://Facebook.com" target="_blank"
													class="footer-link">Facebook</a> <a
													href="http://Youtube.com" target="_blank"
													class="footer-link">Youtube</a>
											</div>
											<div
												id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
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
			</div>
			<script
				src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
				type="text/javascript"
				integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
				crossorigin="anonymous"></script>
			<script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>