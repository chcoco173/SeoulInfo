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
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 외부 css -->
<link href="/css/product/productCU.css" rel="stylesheet" type="text/css">
<style>
/* 컨테이너 스타일 */
.scroll-container {
	position: relative;
	width: 100%;
	overflow-x: auto; /* 가로 스크롤바 활성화 */
	white-space: nowrap; /* 자식 요소가 가로로 나열되도록 설정 */
	-webkit-overflow-scrolling: touch; /* 터치 스크롤링 활성화 (모바일 최적화) */
	padding: 10px 0; /* 스크롤바와 이미지 사이에 패딩 추가 */
}

/* 이미지 래퍼 스타일 */
.scroll-wrapper {
	display: flex; /* 자식 요소를 가로로 나열 */
	align-items: center; /* 이미지 수직 중앙 정렬 */
}

/* 개별 이미지 아이템 스타일 */
.scroll-item {
	flex: 0 0 auto; /* 자식 요소가 자동으로 크기 조정되도록 설정 */
	margin-right: 10px; /* 이미지 간 간격 설정 */
	width: 200px; /* 일정한 너비 설정 */
	height: 200px; /* 일정한 높이 설정 */
	overflow: hidden; /* 이미지가 컨테이너를 넘지 않도록 설정 */
	position: relative; /* 삭제 버튼의 절대 위치를 기준으로 설정 */
	border-radius: 10px; /* 이미지 모서리 둥글게 설정 */
}

/* 이미지 스타일 */
.product-image {
	width: 100%; /* 이미지의 너비를 컨테이너에 맞춤 */
	height: 100%; /* 이미지의 높이를 컨테이너에 맞춤 */
	object-fit: cover; /* 이미지 비율 유지하며 컨테이너에 맞춤 */
}

/* 삭제 버튼 스타일 */
.delete-btn {
	position: absolute;
	top: 10px; /* 상단에서 10px 위치 */
	right: 10px; /* 오른쪽에서 10px 위치 */
	background: rgba(0, 0, 0, 0.5); /* 배경 색상 */
	color: white; /* 글자 색상 */
	border: none;
	border-radius: 50%; /* 둥근 버튼 */
	width: 24px;
	height: 24px;
	font-size: 16px; /* 글자 크기 */
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1; /* 버튼이 이미지 위에 위치하도록 설정 */
}

.delete-btn:hover {
	background: rgba(0, 0, 0, 0.8); /* 호버 시 배경 색상 변경 */
}
</style>
</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>
		<%@include file="../productNav/productMyPageNav.jsp"%>
		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="padding-section-medium remove-bottom-padding">
					<div class="padding-global">
						<div class="container-large">
							<h1>상품 수정</h1>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<form action="" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="productName">상품명</label> <input type="text"
										class="form-control" id="productName"
										placeholder="상품명을 입력해주세요" value=${productSaleId.sale_name}>
								</div>
								<div class="form-group">
									<label for="productDescription">상품 설명</label>
									<textarea class="form-control" id="productDescription" rows="3"
										placeholder="상품 설명을 입력해주세요">${productSaleId.sale_descript}</textarea>
								</div>
								<div class="form-group">
									<label>카테고리</label>
									<div class="row">
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics1" value="여성의류"
													${productSaleId.sale_cate eq '여성의류' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics1">여성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics2" value="남성의류"
													${productSaleId.sale_cate eq '남성의류' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics2">남성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics3" value="신발"
													${productSaleId.sale_cate eq '신발' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics3">신발</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics4" value="가방/지갑"
													${productSaleId.sale_cate eq '가방/지갑' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics4">가방/지갑</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics5" value="시계"
													${productSaleId.sale_cate eq '시계' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics5">시계</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics6" value="쥬얼리"
													${productSaleId.sale_cate eq '쥬얼리' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics6">쥬얼리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics7" value="패션 액세서리"
													${productSaleId.sale_cate eq '패션 액세서리' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics7">패션
													액세서리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics8" value="디지털"
													${productSaleId.sale_cate eq '디지털' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics8">디지털</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics9" value="가전제품"
													${productSaleId.sale_cate eq '가전제품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryElectronics9">가전제품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryHousehold" value="스포츠/레저"
													${productSaleId.sale_cate eq '스포츠/레저' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryHousehold">스포츠/레저</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryBooks" value="차량/오토바이"
													${productSaleId.sale_cate eq '차량/오토바이' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryBooks">차량/오토바이</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryClothing" value="스타굿즈"
													${productSaleId.sale_cate eq '스타굿즈' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryClothing">스타굿즈</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers1" value="키덜트"
													${productSaleId.sale_cate eq '키덜트' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers1">키덜트</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers2" value="예술/희귀/수집품"
													${productSaleId.sale_cate eq '예술/희귀/수집품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers2">예술/희귀/수집품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers3" value="음반/악기"
													${productSaleId.sale_cate eq '음반/악기' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers3">음반/악기</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers4" value="도서/티켓/문구"
													${productSaleId.sale_cate eq '도서/티켓/문구' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers4">도서/티켓/문구</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers5" value="뷰티/미용"
													${productSaleId.sale_cate eq '뷰티/미용' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers5">뷰티/미용</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers6" value="가구/인테리어"
													${productSaleId.sale_cate eq '가구/인테리어' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers6">가구/인테리어</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers7" value="생활/주방용품"
													${productSaleId.sale_cate eq '생활/주방용품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers7">생활/주방용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers8" value="공구/산업용품"
													${productSaleId.sale_cate eq '공구/산업용품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers8">공구/산업용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers9" value="식품"
													${productSaleId.sale_cate eq '식품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers9">식품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers10" value="유아동/출산"
													${productSaleId.sale_cate eq '유아동/출산' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers10">유아동/출산</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers11" value="반려동물용품"
													${productSaleId.sale_cate eq '반려동물용품' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers11">반려동물용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers12" value="기타"
													${productSaleId.sale_cate eq '기타' ? 'checked' : ''}>
												<label class="form-check-label" for="categoryOthers12">기타</label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="productPrice">판매가</label> <input type="text"
										class="form-control" id="productPrice"
										placeholder="가격을 입력해주세요" value=${productSaleId.sale_price}>
								</div>
								<div class="form-group">
									<label for="productLocation">거래 주소</label> <select
										class="form-control" id="locationSelect">
										<option ${productSaleId.sale_area eq '전체' ? 'selected' : ''}>전체</option>
										<option ${productSaleId.sale_area eq '강남구' ? 'selected' : ''}>강남구</option>
										<option ${productSaleId.sale_area eq '강동구' ? 'selected' : ''}>강동구</option>
										<option ${productSaleId.sale_area eq '강서구' ? 'selected' : ''}>강서구</option>
										<option ${productSaleId.sale_area eq '강북구' ? 'selected' : ''}>강북구</option>
										<option ${productSaleId.sale_area eq '관악구' ? 'selected' : ''}>관악구</option>
										<option ${productSaleId.sale_area eq '광진구' ? 'selected' : ''}>광진구</option>
										<option ${productSaleId.sale_area eq '구로구' ? 'selected' : ''}>구로구</option>
										<option ${productSaleId.sale_area eq '금천구' ? 'selected' : ''}>금천구</option>
										<option ${productSaleId.sale_area eq '노원구' ? 'selected' : ''}>노원구</option>
										<option ${productSaleId.sale_area eq '도봉구' ? 'selected' : ''}>도봉구</option>
										<option ${productSaleId.sale_area eq '동대문구' ? 'selected' : ''}>동대문구</option>
										<option ${productSaleId.sale_area eq '동작구' ? 'selected' : ''}>동작구</option>
										<option ${productSaleId.sale_area eq '마포구' ? 'selected' : ''}>마포구</option>
										<option ${productSaleId.sale_area eq '서대문구' ? 'selected' : ''}>서대문구</option>
										<option ${productSaleId.sale_area eq '서초구' ? 'selected' : ''}>서초구</option>
										<option ${productSaleId.sale_area eq '성동구' ? 'selected' : ''}>성동구</option>
										<option ${productSaleId.sale_area eq '성북구' ? 'selected' : ''}>성북구</option>
										<option ${productSaleId.sale_area eq '송파구' ? 'selected' : ''}>송파구</option>
										<option ${productSaleId.sale_area eq '양천구' ? 'selected' : ''}>양천구</option>
										<option ${productSaleId.sale_area eq '영등포구' ? 'selected' : ''}>영등포구</option>
										<option ${productSaleId.sale_area eq '용산구' ? 'selected' : ''}>용산구</option>
										<option ${productSaleId.sale_area eq '은평구' ? 'selected' : ''}>은평구</option>
										<option ${productSaleId.sale_area eq '종로구' ? 'selected' : ''}>종로구</option>
										<option ${productSaleId.sale_area eq '중구' ? 'selected' : ''}>중구</option>
										<option ${productSaleId.sale_area eq '중랑구' ? 'selected' : ''}>중랑구</option>
									</select>
								</div>
								<div class="form-group">
									<div class="scroll-container">
										<div class="scroll-wrapper" id="scrollWrapper">
											<c:forEach var="product" items="${productImageSaleId}"
												varStatus="status">
												<div class="scroll-item">
													<input type="hidden" name="orginal_saleId"
														value="${product.sale_id}"> <input type="hidden"
														name="orginal_imgNo" value="${product.productimg_no}">
													<img src="/productImage/${product.productimg_alias}"
														alt="상품 이미지" class="product-image">
													<button class="delete-btn deletebtn" onclick="removeItem(this)">&#10005;</button>
												</div>
											</c:forEach>
										</div>
									</div>

									<label for="productImage">상품 사진 업로드</label>
									<div id="fileInputs">
										<c:forEach var="i" begin="0"
											end="${5 - productImageSaleId.size() - 1}" step="1">
											<div class="form-group">
												<input type="file" class="form-control-file mt-2 file-input"
													name="file">
											</div>
										</c:forEach>
										<div>
											<!--
										<c:forEach var="product" items="${productImageSaleId}"
											varStatus="status">
											<div class="form-group">

												<input type="file" id="file_${status.index}"
													class="form-control-file mt-2" name="file">

											</div>
										</c:forEach>

										<c:forEach begin="${productImageSaleId.size()}" end="3"
											varStatus="status">
											<div class="form-group">
												<input type="file" id="file_new_${status.index}"
													class="form-control-file mt-2" name="file">
											</div>
										</c:forEach>
										-->

										</div>
									</div>
									<div class="form-group submit-button">
										<button type="submit" class="btn btn-primary">상품 수정</button>
									</div>
							</form>
						</div>
						<div class="col-md-2"></div>

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
	<script>
		/*
		function removeItem(button) {
		    // 클릭된 버튼의 부모 요소 (이미지 아이템)를 선택
		    const itemToRemove = button.parentElement;
		    // 해당 아이템을 DOM에서 제거
		    itemToRemove.remove();
		}
		 */

		$('.deletebtn').on(
				'click',
				function() {
					// 클릭된 버튼의 부모 요소인 .scroll-item을 찾습니다.
					var $item = $(this).closest('.scroll-item');

					// .scroll-item에서 name 속성으로 sale_id와 productimg_no 값을 가져옵니다.
					var saleId = $item.find('input[name="orginal_saleId"]')
							.val();
					var productimg_no = $item.find(
							'input[name="orginal_imgNo"]').val();

					$.ajax({
						type : 'POST',
						url : '/product/deleteImage',
						data : {
							"productimg_no" : productimg_no
						},
						success : function(result) {
							console.log('Server response:', result);
							if (result === '1') {
								// .scroll-item을 DOM에서 제거합니다.
								$item.remove();
							} else {
								alert('Failed to delete image');
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
				});

		$('.file-input').on('change', function(event) {
			previewFile(event);
		});

		/* 이거 추가하면 db 삭제 안됨 하지만 스크롤에 이미지 추가는 됨...
		function previewFile(event) {
			var input = event.target;
			var files = input.files;
			var scrollWrapper = $('#scrollWrapper');

			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var reader = new FileReader();

				reader.onload = function(e) {
					var imgSrc = e.target.result;
					var scrollItem = $('<div class="scroll-item"></div>');
					var img = $('<img src="' + imgSrc + '" alt="상품 이미지" class="product-image">');
					var deleteBtn = $('<button class="delete-btn delete">&#10005;</button>');

					deleteBtn.on('click', function() {
						$(this).closest('.scroll-item').remove();
					});

					scrollItem.append(img).append(deleteBtn);
					scrollWrapper.append(scrollItem);
				}

				reader.readAsDataURL(file);
			}
		}

		function removeItem(button) {
			$(button).closest('.scroll-item').remove();
		}
		*/
	</script>
</body>
</html>