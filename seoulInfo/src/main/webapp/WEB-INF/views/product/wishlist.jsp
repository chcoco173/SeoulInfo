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
<link href="/css/product/noProduct.css" rel="stylesheet" type="text/css">
<link href="/css/footer/footer.css" rel="stylesheet" type="text/css">

<!--아이콘을 위한 Font Awesome의 CSS 파일 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
/*status*/
.product-card {
	position: relative;
	overflow: hidden;
}

.product-image {
	width: 100%;
	height: auto;
	transition: filter 0.3s ease;
}

.product-card.sold-out .product-image {
	filter: grayscale(100%);
}

.overlay {
	position: absolute;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 10px;
	border-radius: 5px;
	text-align: center;
}

.product-card.sold-out .overlay {
	display: block;
}
</style>
</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>

		<%@include file="../productNav/productMyPageNav.jsp"%>

		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="container_a">
					<h1>찜목록</h1>
					<c:choose>
						<c:when test="${empty wishList}">
							<div class="no-products-message">
								<i class="fas fa-sad-tear"></i> 현재 찜한 상품이 없습니다.</br> <a
									href="/product/productMain">상품 보러 가시겠어요?</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="product-cards-container">
								<c:forEach items="${wishList}" var="wishList">
									<div class="product-card">
										<input type="hidden" class="sale_id"
											value="${wishList.sale_id}">
										<c:choose>
											<c:when test="${not empty wishList.productimg_alias}">
												<img src="/productImage/${wishList.productimg_alias}"
													alt="상품 이미지" class="product-image"
													style="height: 100px; width: 100px;">
											</c:when>
											<c:otherwise>
												<img src="https://via.placeholder.com/100" alt="이미지없음"
													class="product-image">
											</c:otherwise>
										</c:choose>
										<!-- 거래중 상태일 때만 오버레이 추가 -->
										<c:if
											test="${wishList.sale_status eq '거래중' || wishList.sale_status eq '판매완료'}">
											<div class="overlay">${wishList.sale_status}</div>
										</c:if>
										<div class="product-details">
											<h5>${wishList.sale_name}</h5>
											<p>${wishList.sale_status}</p>
											<p class='price' data-price="${wishList.sale_price}"></p>

										</div>
										<div class="button-group">
											<button class="btn btn-secondary product">상품보러가기</button>
											<button class="btn btn-secondary delete">삭제</button>
										</div>
									</div>
								</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</section>
		</main>

	</div>
	<%@ include file="../footer.jsp"%>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">
		// 위시 삭제
		$(".delete").on('click', function() {
			var $item = $(this).closest('.product-card');
			var saleId = $item.find('.sale_id').val();
			alert(saleId);

			$.ajax({
				type : 'POST',
				url : '/product/deleteWish',
				data : {
					'sale_id' : saleId
				},
				success : function(result) {
					if (result == '1') {
						$item.remove();
					} else {
						alert('위시삭제실패');
					}
				},
				error : function(err) {
					console.log(err);
				}
			});

		});

		// 상품상세보기
		$(".product").click(
				function() {
					var sale_id = $(this).closest('.product-card').find(
							'.sale_id').val();
					alert(sale_id);

					// 나중에 상품번호들고가서 수정예정
					location.href = "detail_post?sale_id=" + sale_id;
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