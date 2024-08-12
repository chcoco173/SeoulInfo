<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 외부css-->
<link href="/css/product/productMain.css" rel="stylesheet" type="text/css">
<link href="/css/product/productStatus.css" rel="stylesheet" type="text/css">
<style>
	.h1, h1 {
	    font-size: 2.5rem;
		margin-bottom : 3rem;
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
										<h1 class="text-center">
											${title}
										</h1>
									</div>
								</div>

								<div class="container my-5">
									<!--  상품 ( jstl로 들어갈 예정 ) -->
									<div class="row">
										<c:forEach items="${productList}" var="productList" varStatus="status">
											<div class="col-md-3 product">
												<div class="product-card">
													<c:choose>
													    <c:when test="${not empty productList.productimg_alias}">
													        <img src="/productImage/${productList.productimg_alias}" alt="상품 이미지" class="product-image" style="height: 250px; width:250px;">
													    </c:when>
													    <c:otherwise>
															<img src="https://via.placeholder.com/이미지없음" alt="이미지없음" class="product-image" style="height: 250px; width:250px;">
													    </c:otherwise>
													</c:choose>
													
													<div class="product-info">
														<input type="hidden" class="sale_id" value="${productList.sale_id}">
																												
														<h4>${productList.sale_name}</h4>
														<p>${productList.sale_area}</p>
														<p>
															<strong class='price'data-price="${productList.sale_price}"></strong>
															
														</p>
														<p>
															관심 : ${productList.favorite_count}<span style="margin-left: 20px;">상태: ${productList.sale_status}</span>
														</p>
														
														<!-- 날짜 차이 정보 추가 -->
														<p>
															${timeDataList[status.index]}<span style="margin-left: 30px;">조회수 : ${productList.sale_viewcount}</span>
														</p>
														<!-- 거래중 상태일 때만 오버레이 추가 -->
														<c:if test="${productList.sale_status eq '거래중' || productList.sale_status eq '판매완료'}">
															<div class="overlay">${productList.sale_status}</div>
														</c:if>
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
				<!--  end of padding-global -->

				<%@ include file="../footer.jsp" %>
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

				// 가격 포맷 함수
				function formatPrice(price) {
					return Number(price).toLocaleString('ko-KR') + '원';
				}
				// 모든 가격 요소에 대해 포맷팅을 적용합니다.
				$('.price').each(function() {
					var rawPrice = $(this).data('price');
					$(this).text(formatPrice(rawPrice));
				});
			</script>
</body>
</html>