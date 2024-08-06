<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  -->
<!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4821"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<style>
@media ( min-width :992px) {
	html.w-mod-js:not (.w-mod-ix ) [data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5"]
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
	html.w-mod-js:not (.w-mod-ix ) [data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5"]
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
<!-- Include jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Include bxSlider CSS file -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- Include bxSlider JavaScript file -->
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="/css/product/product_detail.css" rel="stylesheet" type="text/css">
<link href="/css/product/productMain.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>

		<div class="main-wrapper">
			<div class="section-post-banner">
				<div class="padding-global">
					<div class="padding-section-medium">
						<div class="container-full-width">
							<h1 data-w-id="180b513c-4540-bab3-7036-972b35d8ddc4"
								style="opacity: 0" class="text-color-white w-dyn-bind-empty"></h1>
							<div class="spacer-xlarge"></div>
							<div data-w-id="771e0065-68e3-960e-1e46-624d6820421c"
								style="opacity: 0" class="post-author-and-tags-wrapper">
								<a href="#" class="large-author-wrapper w-inline-block"
									onmouseover="showBubble()" onmouseout="hideBubble()">
									<div class="large-author-thumbnail"></div>
									<h5 class="author-name">${param.member_id}</h5>
									<!-- Added class 'author-name' -->

								</a>
							</div>
							<div class="rating">
								<div class="stars">&#9733; &#9733; &#9733; &#9734; &#9734;
								</div>
							</div>
							
							<div class="container my-5">
								<!--  상품 ( jstl로 들어갈 예정 ) -->
								<div class="row">
									<c:forEach items="${myProductList}" var="productList"
										varStatus="status">
										<div class="col-md-3 product">
											<div class="product-card">
												<c:choose>
													<c:when test="${not empty productList.productimg_alias}">
														<img src="/productImage/${productList.productimg_alias}"
															alt="상품 이미지" class="product-image"
															style="height: 250px; width: 250px;">
													</c:when>
													<c:otherwise>
														<img src="https://via.placeholder.com/이미지없음" alt="이미지없음"
															class="product-image"
															style="height: 250px; width: 250px;">
													</c:otherwise>
												</c:choose>

												<div class="product-info">
													<input type="hidden" class="sale_id"
														value="${productList.sale_id}">
													<h4>${productList.sale_name}</h4>
													<p>${productList.sale_area}</p>
													<p>
														<strong>${productList.sale_price}</strong>
													</p>
													<p>
														관심 ${productList.favorite_count}<span
															style="margin-left: 20px;">상태:
															${productList.sale_status}</span>
													</p>
													<!-- 날짜 차이 정보 추가 -->
													<p>${timeDataList[status.index]}</p>
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
			<div class="spacer-xxlarge"></div>
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

	</div>

	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<!-- 제이쿼리 라이브러리 추가 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 제이쿼리 라이브러리 추가 + 상품클릭시 디테일페이지로이동 -->
	<script type="text/javascript">
		$(".product").click(function() {
			var sale_id = $(this).find('.sale_id').val();
			alert(sale_id);
								
			location.href = "detail_post?sale_id="+sale_id;

		});
	</script>
</body>
</html>