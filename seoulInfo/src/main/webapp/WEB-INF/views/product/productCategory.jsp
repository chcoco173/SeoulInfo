<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>${category}상품</title>
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
<link href="/css/product/productMain.css" rel="stylesheet"
	type="text/css">
	
<link href="/css/product/productStatus.css" rel="stylesheet" type="text/css">
<link href="/css/product/noProduct.css" rel="stylesheet" type="text/css">
<link href="/css/footer/footer.css" rel="stylesheet" type="text/css">

<!--아이콘을 위한 Font Awesome의 CSS 파일 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
									<div class="row justify-content-end">
										<!-- Category Selector -->
										<div class="col-md-4 col-lg-2 mb-3">
											<c:choose>
												<c:when test="${not empty param.productsearch_keyword}">
													<input type="hidden" class="productsearch_keyword" value="${param.productsearch_keyword}">
												</c:when>
											</c:choose>											
											<c:choose>
												<c:when
													test="${category == '전자제품' || category == '디지털' || category == '가전제품'}">
													<select class="form-control cate" name="cate">
														<option ${category eq '전자제품' ? 'selected' : ''}>전자제품</option>
														<option ${category eq '디지털' ? 'selected' : ''}>디지털</option>
														<option ${category eq '가전제품' ? 'selected' : ''}>가전제품</option>
													</select>
												</c:when>
												<c:when
													test="${category == '생활용품' || category == '생활/주방용품' || category == '공구/산업용품' || category == '가구/인테리어'}">
													<select class="form-control cate" name="cate">
														<option ${category eq '생활용품' ? 'selected' : ''}>생활용품</option>
														<option ${category eq '생활/주방용품' ? 'selected' : ''}>생활/주방용품</option>
														<option ${category eq '공구/산업용품' ? 'selected' : ''}>공구/산업용품</option>
														<option ${category eq '가구/인테리어' ? 'selected' : ''}>가구/인테리어</option>
													</select>
												</c:when>
												<c:when
													test="${category == '의류' || category == '여성의류' || category == '남성의류' || category == '신발' || category == '가방/지갑' || category == '패션 액세서리' || category == '쥬얼리' || category == '시계'}">
													<select class="form-control cate" name="cate">
														<option ${category eq '의류' ? 'selected' : ''}>의류</option>
														<option ${category eq '여성의류' ? 'selected' : ''}>여성의류</option>
														<option ${category eq '남성의류' ? 'selected' : ''}>남성의류</option>
														<option ${category eq '신발' ? 'selected' : ''}>신발</option>
														<option ${category eq '가방/지갑' ? 'selected' : ''}>가방/지갑</option>
														<option ${category eq '패션 액세서리' ? 'selected' : ''}>패션
															액세서리</option>
														<option ${category eq '쥬얼리' ? 'selected' : ''}>쥬얼리</option>
														<option ${category eq '시계' ? 'selected' : ''}>시계</option>
													</select>
												</c:when>
												<c:when
													test="${category == '도서' || category == '도서/티켓/문구' || category == '예술/희귀/수집품' || category == '음반/악기' || category == '스타굿즈'}">
													<select class="form-control cate" name="cate">
														<option ${category eq '도서' ? 'selected' : ''}>도서</option>
														<option ${category eq '도서/티켓/문구' ? 'selected' : ''}>도서/티켓/문구</option>
														<option ${category eq '예술/희귀/수집품' ? 'selected' : ''}>예술/희귀/수집품</option>
														<option ${category eq '음반/악기' ? 'selected' : ''}>음반/악기</option>
														<option ${category eq '스타굿즈' ? 'selected' : ''}>스타굿즈</option>
													</select>
												</c:when>
												<c:when
													test="${category == '기타' || category == '키덜트' || category == '식품' || category == '스포츠/레저' || category == '뷰티/미용' || category == '유아동/출산' || category == '차량/오토바이' || category == '반려동물용품' || category == '기타'}">
													<select class="form-control cate" name="cate">
														<option ${category eq '기타' ? 'selected' : ''}>기타</option>
														<option ${category eq '키덜트' ? 'selected' : ''}>키덜트</option>
														<option ${category eq '식품' ? 'selected' : ''}>식품</option>
														<option ${category eq '스포츠/레저' ? 'selected' : ''}>스포츠/레저</option>
														<option ${category eq '뷰티/미용' ? 'selected' : ''}>뷰티/미용</option>
														<option ${category eq '유아동/출산' ? 'selected' : ''}>유아동/출산</option>
														<option ${category eq '차량/오토바이' ? 'selected' : ''}>차량/오토바이</option>
														<option ${category eq '반려동물용품' ? 'selected' : ''}>반려동물용품</option>
														
													</select>
												</c:when>
											</c:choose>
										</div>

										<!-- Type Selector -->

										<div class="col-md-4 col-lg-2 mb-3">
											<c:if test="${path != 'productSearch'}">
											        <select class="form-control type" name="type">
											            <option ${param.type eq '전체' ? 'selected' : ''}>전체</option>
											            <option ${param.type eq '가격낮은순' ? 'selected' : ''}>가격낮은순</option>
											            <option ${param.type eq '가격높은순' ? 'selected' : ''}>가격높은순</option>
											            <option ${param.type eq '최신순' ? 'selected' : ''}>최신순</option>
											        </select>
											    </c:if>
										</div>

									</div>


									<c:choose>
										<c:when test="${empty productList}">
											<div class="no-products-message">
												<i class="fas fa-sad-tear"></i>${area}에 해당하는 상품이 없네요..</br> 
												<a href="/useTradeGu">구 선택 페이지로 이동할까요?</a>
											</div>
										</c:when>
									<c:otherwise>
									<!--  상품 ( jstl로 들어갈 예정 ) -->
									<div class="row">
										<c:forEach items="${productList}" var="productList"
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
															<img src="/NoImage/noImage.png" alt="이미지없음"
																class="product-image" style="height: 250px; width: 250px;">
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
															관심 ${productList.favorite_count} ∙ 조회 ${productList.sale_viewcount} ∙ ${productList.sale_status}
														</p>
														<!-- 날짜 차이 정보 추가 -->
														<p>
															${timeDataList[status.index]}
														</p>
														<!-- 거래중 상태일 때만 오버레이 추가 -->
														<c:if test="${productList.sale_status eq '거래중' || productList.sale_status eq '판매완료'}">
															<div class="overlay">${productList.sale_status}</div>
														</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
										</c:otherwise>
									</c:choose>
									</div>

									<!-- 페이지 네비게이션 -->
									<!-- Bootstrap 네비게이션 -->
									<nav aria-label="Page navigation">
										<ul class="pagination justify-content-center">
											<c:if test="${currentPage > 1}">
												<li class="page-item"><a class="page-link"
													href="${path}?cate=${category}&page=1&size=${pageSize}">First</a>
												</li>
												<li class="page-item"><a class="page-link"
													href="${path}?cate=${category}&page=${currentPage - 1}&size=${pageSize}"
													aria-label="Previous"> <span aria-hidden="true">&laquo;
															Previous</span>
												</a></li>
											</c:if>

											<c:set var="startPage" value="${currentPage - 2}" />
											<c:set var="endPage" value="${currentPage + 2}" />

											<c:if test="${startPage < 1}">
												<c:set var="startPage" value="1" />
												<c:set var="endPage" value="5" />
											</c:if>

											<c:if test="${endPage > totalPages}">
												<c:set var="startPage" value="${totalPages - 4}" />
												<c:set var="endPage" value="${totalPages}" />
											</c:if>

											<c:if test="${startPage < 1}">
												<c:set var="startPage" value="1" />
											</c:if>

											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:choose>
													<c:when test="${i == currentPage}">
														<li class="page-item active" aria-current="page"><span
															class="page-link">${i} <span class="sr-only">(current)</span></span>
														</li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="${path}?cate=${category}&page=${i}&size=${pageSize}">${i}</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<c:if test="${currentPage < totalPages}">
												<li class="page-item"><a class="page-link"
													href="${path}?cate=${category}&page=${currentPage + 1}&size=${pageSize}"
													aria-label="Next"> <span aria-hidden="true">Next
															&raquo;</span>
												</a></li>
												<li class="page-item"><a class="page-link"
													href="${path}?cate=${category}&page=${totalPages}&size=${pageSize}">Last</a>
												</li>
											</c:if>
										</ul>
									</nav>

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

					// 나중에 상품번호들고가서 수정예정
					location.href = "detail_post?sale_id="+sale_id;

				});

				$(".cate").change(
						function() {
							let cate = $('.cate').val();
							let type = $('.type').val();
							
							location.href = "categoryOptionSelect?cate=" + cate
									+ "&type=" + type;

				})

				$(".type").change(
						function() {
							let cate = $('.cate').val();
							let type = $('.type').val();
							let productsearch_keyword = $('.col-md-4.col-lg-2.mb-3').find('.productsearch_keyword').val();
														
							
							if ( productsearch_keyword != null){
								location.href = "categoryOptionSelect?productsearch_keyword=" + productsearch_keyword + "&type=" + type;
							}else{
								location.href = "categoryOptionSelect?cate=" + cate + "&type=" + type;
							}
							
							
				})
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