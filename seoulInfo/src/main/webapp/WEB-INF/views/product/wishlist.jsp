<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4829"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>Template Style Guide</title>
<meta content="Template Style Guide" property="og:title">
<meta content="Template Style Guide" property="twitter:title">
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
<!-- 부트스트랩 태그 추가-->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 외부 css -->
<link href="/css/product/myProduct.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>

		<%@include file="../productNav/productMyPageNav.jsp"%>

		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="container_a">
					<h1>찜목록</h1>
					<div class="product-cards-container">
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 1">
							<div class="product-details">
								<h5>찜한 상품 1</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 2">
							<div class="product-details">
								<h5>찜한 상품 2</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 1">
							<div class="product-details">
								<h5>찜한 상품 1</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 2">
							<div class="product-details">
								<h5>찜한 상품 2</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 1">
							<div class="product-details">
								<h5>찜한 상품 1</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<div class="product-card">
							<img src="https://via.placeholder.com/100" alt="상품 2">
							<div class="product-details">
								<h5>찜한 상품 2</h5>
								<p>판매 상태 (예약/판매완료)</p>
							</div>
							<button class="btn btn-secondary">삭제</button>
						</div>
						<!--<c:forEach items="${myProductList}" var="myProductList">
							<div class="product-card">
								<c:choose>
									<c:when test="${not empty myProductList.productimg_alias}">
										<img src="/productImage/${myProductList.productimg_alias}"
											alt="상품 이미지" class="product-image"
											style="height: 100px; width: 100px;">
									</c:when>
									<c:otherwise>
										<img src="https://via.placeholder.com/100" alt="이미지없음"
											class="product-image">
									</c:otherwise>
								</c:choose>
								<div class="product-details">
									<h5>${myProductList.sale_name}</h5>
									<p>
										${myProductList.sale_regdate}<br>${myProductList.sale_status}
									</p>
								</div>
								<input type="hidden" name="sale_id"
									value="${myProductList.sale_id}">

								<button class="btn btn-secondary update">수정</button>
								<button class="btn btn-secondary delete">삭제</button>
							</div>
						</c:forEach>-->
					</div>
				</div>
			</section>
		</main>
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
										<a href="../about.html" class="footer-link">About</a> <a
											href="../contact.html" class="footer-link">Contact</a>
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
										<a href="../template/template-style-guide.html"
											aria-current="page" class="footer-link w--current">Style
											Guide</a> <a href="../template/changelog.html"
											class="footer-link">Changelog</a> <a
											href="../template/licenses.html" class="footer-link">Licenses</a>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 제이쿼리 라이브러리 추가 + 상품클릭시 디테일페이지로이동 -->
	<script type="text/javascript">
	
	</script>
</body>
</html>