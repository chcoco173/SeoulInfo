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

</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>

		<%@include file="../productNav/productMyPageNav.jsp"%>

		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="container_a">
					<h1>판매목록</h1>
					<c:choose>
						<c:when test="${empty myProductList}">
							<div class="no-products-message">
								<i class="fas fa-sad-tear"></i> 현재 등록된 상품이 없습니다.</br> <a
									href="/product/productInsert">상품 등록하러 가시겠어요?</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="product-cards-container">
								<c:forEach items="${myProductList}" var="myProductList"
									varStatus="status">
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
											<p>${timeDataList[status.index]}</p>
										</div>

										<!--<input type="hidden" name="sale_id" id="sale_id""
									value="${myProductList.sale_id}">
								-->
										<input type="hidden" class="sale_id" name="sale_id"
											value="${myProductList.sale_id}">

										<div class="button-group">
											<c:choose>
												<c:when test="${myProductList.sale_status eq '판매완료'}">
													<!-- 판매완료 상태일 때 버튼을 비활성화 -->
													<button class="btn btn-secondary update" disabled>수정</button>
												</c:when>
												<c:otherwise>
													<!-- 판매완료가 아닌 경우 버튼을 활성화 -->
													<button class="btn btn-secondary update">수정</button>
												</c:otherwise>
											</c:choose>
											<button class="btn btn-secondary delete">삭제</button>
										</div>
										<div class="select-wrapper">
											<c:choose>
												<c:when test="${myProductList.sale_status eq '판매완료'}">
													<!-- 판매완료 상태인 경우 선택 상태를 보여주고 select 태그를 비활성화 -->
													<select class="form-control status" name="status" disabled>
														<option value="판매중">판매중</option>
														<option value="거래중">거래중</option>
														<option value="판매완료" selected>판매완료</option>
													</select>
												</c:when>
												<c:otherwise>
													<!-- 판매완료가 아닌 경우 select 태그를 활성화 -->
													<select class="form-control status" name="status">
														<option value="판매중"
															${myProductList.sale_status eq '판매중' ? 'selected' : ''}>판매중</option>
														<option value="거래중"
															${myProductList.sale_status eq '거래중' ? 'selected' : ''}>거래중</option>
													</select>
												</c:otherwise>
											</c:choose>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 제이쿼리 라이브러리 추가 + 상품클릭시 디테일페이지로이동 -->
	<script type="text/javascript">
		$(".update").click(
				function() {
					// 클릭된 버튼의 상위 product-card 요소에서 sale_id 값을 가져옴
					var sale_id = $(this).closest('.product-card').find(
							'.sale_id').val();
					alert(sale_id);

					location.href = "productUpdateData?sale_id=" + sale_id;

				});

		$(".delete").click(
				function() {
					var button = $(this); // 원래의 this 값을 변수에 저장
					// 클릭된 버튼의 상위 product-card 요소에서 sale_id 값을 가져옴
					var sale_id = $(this).closest('.product-card').find(
							'.sale_id').val();
					if (confirm("해당 상품을 삭제 하시겠습니까?")) {
						$.ajax({
							type : 'POST',
							url : '/product/deleteProduct',
							data : {
								"sale_id" : sale_id
							},
							success : function(result) {
								if (result === '1') {
									button.closest('.product-card').remove();
								}
							},
							error : function(err) {
								console.log(err);
							}
						});
					} else {
						// 사용자가 취소를 눌렀을 때 실행될 코드 (아무 작업도 하지 않음)
						console.log("상품 삭제가 취소되었습니다.");
					}

				});

		$(".select-wrapper").change(
				function() {
					// 상태값은 ajax 처리할 예정
					// 선택된 상태 값 가져오기
					var status = $(this).closest('.product-card').find(
							'.status').val();
					var sale_id = $(this).closest('.product-card').find(
							'.sale_id').val();
					alert(sale_id);

					$.ajax({
						type : 'POST',
						url : '/product/productUpdateStatus',
						data : {
							"sale_status" : status,
							"sale_id" : sale_id
						},
						success : function(result) {
							if (result == '1') {
								// 선택한 값 상태 변경
								$(this).closest('.product-card')
										.find('.status').val(status);

							}
						},
						error : function(err) {
							console.log(err);
						}
					})

				});
	</script>
</body>
</html>