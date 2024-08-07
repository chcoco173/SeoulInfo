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
							<form action="productUpdate" method="post" enctype="multipart/form-data">
								<input type="hidden" name="sale_id" value="${productSaleId.sale_id}">
								<div class="form-group">
									<label for="productName">상품명</label> <input type="text"
										class="form-control" id="sale_name" name="sale_name"
										placeholder="상품명을 입력해주세요" value="${productSaleId.sale_name}" required>
								</div>
								<div class="form-group">
									<label for="productDescription">상품 설명</label>
									<textarea class="form-control" id="sale_descript" rows="3" name="sale_descript"
										placeholder="상품 설명을 입력해주세요" required>${productSaleId.sale_descript}</textarea>
								</div>
								<div class="form-group">
									<label>카테고리</label>
									<div class="row">
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cate" value="여성의류"
													${productSaleId.sale_cate eq '여성의류' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cate1" >여성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics2" value="남성의류"
													${productSaleId.sale_cate eq '남성의류' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cate2">남성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics3" value="신발"
													${productSaleId.sale_cate eq '신발' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics3">신발</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics4" value="가방/지갑"
													${productSaleId.sale_cate eq '가방/지갑' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics4">가방/지갑</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics5" value="시계"
													${productSaleId.sale_cate eq '시계' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics5">시계</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics6" value="쥬얼리"
													${productSaleId.sale_cate eq '쥬얼리' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics6">쥬얼리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics7" value="패션 액세서리"
													${productSaleId.sale_cate eq '패션 액세서리' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics7">패션
													액세서리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics8" value="디지털"
													${productSaleId.sale_cate eq '디지털' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics8">디지털</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateElectronics9" value="가전제품"
													${productSaleId.sale_cate eq '가전제품' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateElectronics9">가전제품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateHousehold" value="스포츠/레저"
													${productSaleId.sale_cate eq '스포츠/레저' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateHousehold">스포츠/레저</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateBooks" value="차량/오토바이"
													${productSaleId.sale_cate eq '차량/오토바이' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateBooks">차량/오토바이</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateClothing" value="스타굿즈"
													${productSaleId.sale_cate eq '스타굿즈' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateClothing">스타굿즈</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers1" value="키덜트"
													${productSaleId.sale_cate eq '키덜트' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers1">키덜트</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers2" value="예술/희귀/수집품"
													${productSaleId.sale_cate eq '예술/희귀/수집품' ? 'checked' : ''}>
												<label class="form-check-label" for="sale_cateOthers2">예술/희귀/수집품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers3" value="음반/악기"
													${productSaleId.sale_cate eq '음반/악기' ? 'checked' : ''}>
												<label class="form-check-label" for="sale_cateOthers3">음반/악기</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers4" value="도서/티켓/문구"
													${productSaleId.sale_cate eq '도서/티켓/문구' ? 'checked' : ''}>
												<label class="form-check-label" for="sale_cateOthers4">도서/티켓/문구</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers5" value="뷰티/미용"
													${productSaleId.sale_cate eq '뷰티/미용' ? 'checked' : ''}>
												<label class="form-check-label" for="sale_cateOthers5">뷰티/미용</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers6" value="가구/인테리어"
													${productSaleId.sale_cate eq '가구/인테리어' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers6">가구/인테리어</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers7" value="생활/주방용품"
													${productSaleId.sale_cate eq '생활/주방용품' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers7">생활/주방용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers8" value="공구/산업용품"
													${productSaleId.sale_cate eq '공구/산업용품' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers8">공구/산업용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers9" value="식품"
													${productSaleId.sale_cate eq '식품' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers9">식품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers10" value="유아동/출산"
													${productSaleId.sale_cate eq '유아동/출산' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers10">유아동/출산</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers11" value="반려동물용품"
													${productSaleId.sale_cate eq '반려동물용품' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers11">반려동물용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="sale_cateOthers12" value="기타"
													${productSaleId.sale_cate eq '기타' ? 'checked' : ''} required>
												<label class="form-check-label" for="sale_cateOthers12">기타</label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="productPrice">판매가</label> <input type="text"
										class="form-control" id="sale_price" name="sale_price"
										placeholder="가격을 입력해주세요" value=${productSaleId.sale_price}  min="0" step="any" required>
									<small id="priceError" class="form-text text-danger" style="display: none;">올바른 가격을 입력해주세요.</small>
								</div>
								<div class="form-group">
									<label for="productLocation">거래 주소</label>
									<select class="form-control" id="sale_area" name="sale_area" required>
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
													<button class="delete-btn deletebtn">&#10005;</button>
												</div>
											</c:forEach>
										</div>
									</div>

									<label for="productImage">상품 사진 업로드</label>
									<div id="fileInputs">
										<c:choose>
										        <c:when test="${productImageSaleId.size() < 5}">
										            <c:forEach var="i" begin="0" end="${5 - productImageSaleId.size() - 1}" step="1">
										                <div class="form-group">
										                    <input type="file" class="form-control-file mt-2 file-input" name="file">
										                </div>
										            </c:forEach>
										        </c:when>
										        <c:otherwise>
										            <p>이미지가 최대 개수(5개)에 도달했습니다.</p>
										        </c:otherwise>
										</c:choose>
									</div>
									<div class="form-group submit-button">
										<button type="submit" class="btn btn-primary"  id="submitButton">상품 수정</button>
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
		
		// 가격 입력칸 유효성 검사
		function validatePrice() {
			var priceInput = $('#sale_price').val();
			var errorElement = $('#priceError');
			var submitButton = $('#submitButton');
			
			// 입력값이 비어있거나 숫자가 아니거나 음수인 경우
			if (priceInput === '' || isNaN(priceInput) || parseFloat(priceInput) < 0) {
				errorElement.show(); // 오류 메시지 표시
				submitButton.prop('disabled', true); // 버튼 비활성화
			} else {
				errorElement.hide(); // 오류 메시지 숨기기
				submitButton.prop('disabled', false); // 버튼 활성화
			}
		}
		// 페이지 로드 시 초기 유효성 검사 수행
		validatePrice();
		
		// 가격 입력 필드의 입력 이벤트에 대한 처리
		$('#sale_price').on('input', function() {
			validatePrice();
		});
		
		
		$('.deletebtn').on('click', function(evt) {
				
					evt.preventDefault();
			
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
								updateFileInputs(); // 파일 입력 필드 업데이트 함수 호출
							} else {
								alert('Failed to delete image');
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
				});
				
				
				// 파일 입력 필드를 업데이트하는 함수
				function updateFileInputs() {
				    var maxFiles = 5;
				    var currentImages = $('#scrollWrapper .scroll-item').length;
				    var fileInputsContainer = $('#fileInputs');

				    // 파일 입력 필드 초기화
				    fileInputsContainer.empty();

				    // 현재 이미지 수에 따라 파일 입력 필드 추가
				    if (currentImages < maxFiles) {
				        for (var i = 0; i < (maxFiles - currentImages); i++) {
				            fileInputsContainer.append('<div class="form-group"><input type="file" class="form-control-file mt-2 file-input" name="file"></div>');
				        }
				    } else {
				        fileInputsContainer.append('<p>이미지가 최대 개수(5개)에 도달했습니다.</p>');
				    }
				}
		$('.file-input').on('change', function(event) {
			previewFile(event);
		});

		
		
		var fileNames = []; // 파일 이름을 저장할 배열
		var fileInputs = []; // 파일 input 요소를 참조할 배열


		$('#fileInput').on('change', previewFile);
		
		// 상품 등록시 스크롤 추가 + 삭제시 스크롤 아웃 + file 초기화
		function previewFile(event) {
		    var input = event.target;
		    var files = input.files;
		    var scrollWrapper = $('#scrollWrapper');

		    fileInputs.push(input); // 파일 input 요소를 배열에 추가

		    for (var i = 0; i < files.length; i++) {
		        var file = files[i];
		        fileNames.push(file.name); // 배열에 파일 이름 추가
		        var reader = new FileReader();

		        reader.onload = function(e) {
		            var imgSrc = e.target.result;
		            var scrollItem = $('<div class="scroll-item"></div>');
		            var img = $('<img src="' + imgSrc + '" alt="상품 이미지" class="product-image">');
		            var deleteBtn = $('<button class="delete-btn delete">&#10005;</button>');

		            deleteBtn.on('click', function() {
		                var index = $(this).closest('.scroll-item').index() - $('.scroll-item').length + fileInputs.length;
		                fileNames.splice(index, 1); // 배열에서 파일 이름 제거
		                fileInputs[index].value = ""; // 파일 input 요소 초기화
		                fileInputs.splice(index, 1); // 배열에서 파일 input 요소 제거
		                $(this).closest('.scroll-item').remove(); // 이미지와 삭제 버튼을 DOM에서 제거
		            });

		            scrollItem.append(img).append(deleteBtn);
		            scrollWrapper.append(scrollItem);
		        }

		        reader.readAsDataURL(file);
		    }
		}
		
		
		
		
	</script>
</body>
</html>