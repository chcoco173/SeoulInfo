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

<link href="/css/product/productReviewGradeName.css" rel="stylesheet" type="text/css">
<link href="/css/product/productMain.css" rel="stylesheet" type="text/css">
<link href="/css/product/productStatus.css" rel="stylesheet" type="text/css">
<link href="/css/footer/footer.css" rel="stylesheet" type="text/css">

<style>
	.large-author-thumbnail {
	    background-image: url("/files/${member.member_imageName}"), url("/images/mypage/default_profile.jpg");
	    background-position: 50%;
	    background-size: cover;
	    border-radius: 30px;
	    width: 3.5rem;
	    height: 3.5rem;
	    margin-right: 6px;
	}
	</style>
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
							   <div data-w-id="771e0065-68e3-960e-1e46-624d6820421c"
							       style="opacity: 0" class="post-author-and-tags-wrapper">
							       <a href="#" class="large-author-wrapper w-inline-block">
							           <div class="large-author-thumbnail"></div>
							           <h5 class="author-name">${param.member_id}</h5>
									   <c:choose>
											<c:when test="${mostProduct_review != null}">
												<div class="speech-bubble-right">상품 상태 ${mostProduct_review}<br/> 대화 매너가 ${mostChat_review} <br/> 약속을 ${mostCommitment_review}</div>
											</c:when>
											<c:otherwise>
												<div class="speech-bubble-right">아직 리뷰가 없어요...</div>
											</c:otherwise>
										</c:choose>  
							       </a>
							       
							   </div>
							   <!-- 기존의 rating 섹션 -->
							   <div class="rating">
							       <div class="stars">&#9733; &#9733; &#9733; &#9734; &#9734;</div>
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
												
												<!-- 거래중 상태일 때만 오버레이 추가 -->
												<c:if test="${productList.sale_status eq '거래중' || productList.sale_status eq '판매완료'}">
													<div class="overlay">${productList.sale_status}</div>
												</c:if>

												<div class="product-info">
													<input type="hidden" class="sale_id"
														value="${productList.sale_id}">
													<h4>${productList.sale_name}</h4>
													<p>${productList.sale_area}</p>
													<p>
														<strong class='price'data-price="${productList.sale_price}"></strong>
													</p>
													<p>
														관심 ${productList.favorite_count} ∙ 조회 ${productList.sale_viewcount} ∙ ${productList.sale_status}
													</p>
													<!-- 날짜 차이 정보 추가 -->
													<p>${timeDataList[status.index]} </p>
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
		</div>

		

	</div>
	<%@ include file="../footer.jsp" %>
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
		var reviewStarAvg = ${reviewStarAvg}; // JSP에서 값을 전달받도록 설정
		
		// 별을 표시할 문자열 생성
		var filledStar = '&#9733;'; // 채워진 별
		var emptyStar = '&#9734;';  // 빈 별
		var totalStars = 5;         // 총 별 개수
		var starsHtml = '';

		// 별 문자열 생성
		for (var i = 0; i < totalStars; i++) {
			if (i < reviewStarAvg) {
				starsHtml += filledStar; // 채워진 별 추가
			} else {
				starsHtml += emptyStar; // 빈 별 추가
			}
		}
		// 별을 표시할 요소에 HTML 문자열 설정
		$('.stars').html(starsHtml);
		
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