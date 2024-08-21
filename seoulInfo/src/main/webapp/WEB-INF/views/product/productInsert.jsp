<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4829"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>상품등록</title>
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
							<h1>상품 등록</h1>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<form action="insertProduct" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="sale_name">상품명</label> 
									<input type="text" class="form-control" id="sale_name" name="sale_name" placeholder="상품명을 입력해주세요" required>
								</div>
								<div class="form-group">
									<label for="sale_descript">상품 설명</label>
									<textarea class="form-control" id="sale_descript" name="sale_descript" rows="3"
										placeholder="상품 설명을 입력해주세요" wrap="soft" required></textarea>
								</div>
								<div class="form-group">
									<label>카테고리</label>
									<div class="row">
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics1" value="여성의류" required> <label
													class="form-check-label" for="categoryElectronics1">여성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics2" value="남성의류" required> <label
													class="form-check-label" for="categoryElectronics2">남성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics3" value="신발" required> <label
													class="form-check-label" for="categoryElectronics3">신발</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics4" value="가방/지갑" required> <label
													class="form-check-label" for="categoryElectronics4">가방/지갑</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics5" value="시계" required> <label
													class="form-check-label" for="categoryElectronics5">시계</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics6" value="쥬얼리" required> <label
													class="form-check-label" for="categoryElectronics6">쥬얼리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics7" value="패션 액세서리" required> <label
													class="form-check-label" for="categoryElectronics7">패션
													액세서리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics8" value="디지털" required> <label
													class="form-check-label" for="categoryElectronics8">디지털</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryElectronics9" value="가전제품" required> <label
													class="form-check-label" for="categoryElectronics9">가전제품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryHousehold" value="스포츠/레저" required> <label
													class="form-check-label" for="categoryHousehold">스포츠/레저</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryBooks" value="차량/오토바이" required> <label
													class="form-check-label" for="categoryBooks">차량/오토바이</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryClothing" value="스타굿즈" required> <label
													class="form-check-label" for="categoryClothing">스타굿즈</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers1" value="키덜트" required> <label
													class="form-check-label" for="categoryOthers1">키덜트</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers2" value="예술/희귀/수집품" required> <label
													class="form-check-label" for="categoryOthers2">예술/희귀/수집품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers3" value="음반/악기" required> <label
													class="form-check-label" for="categoryOthers3">음반/악기</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers4" value="도서/티켓/문구" required> <label
													class="form-check-label" for="categoryOthers4">도서/티켓/문구</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers5" value="뷰티/미용" required> <label
													class="form-check-label" for="categoryOthers5">뷰티/미용</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers6" value="가구/인테리어" required> <label
													class="form-check-label" for="categoryOthers6">가구/인테리어</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers7" value="생활/주방용품" required> <label
													class="form-check-label" for="categoryOthers7">생활/주방용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers8" value="공구/산업용품" required> <label
													class="form-check-label" for="categoryOthers8">공구/산업용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers9" value="식품" required> <label
													class="form-check-label" for="categoryOthers9">식품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers10" value="유아동/출산" required> <label
													class="form-check-label" for="categoryOthers10">유아동/출산</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers11" value="반려동물용품" required> <label
													class="form-check-label" for="categoryOthers11">반려동물용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="sale_cate"
													id="categoryOthers12" value="기타" required> <label
													class="form-check-label" for="categoryOthers12">기타</label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="sale_price">판매가</label> <input type="text"
										class="form-control" id="sale_price" name="sale_price"
										placeholder="가격을 입력해주세요" min="0" step="any" required>
									<small id="priceError" class="form-text text-danger" style="display: none;">올바른 가격을 입력해주세요.</small>
								</div>
								<div class="form-group">
									<label for="sale_area">거래 주소</label> 
									<c:set var="areas" value="${['강남구', '강동구', '강서구', '강북구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구']}" />

									<select class="form-control" name="sale_area" id="sale_area" required>
									    
									    <c:forEach items="${areas}" var="area">
									        <option value="${area}" ${sessionScope.member.member_area eq area ? 'selected' : ''}>${area}</option>
									    </c:forEach>
									</select>
								</div>
								<div class="form-group">
									<!-- 상품 사진 업로드 스크롤 -->
								    <div class="scroll-container">
								        <div class="scroll-wrapper" id="scrollWrapper">     
								        </div>
								    </div>
								    
								    <label for="productImage">상품 사진 업로드</label>
								    <div id="fileInputs">
								        <input type="file" class="form-control-file mt-2 file-input" name="file">
								        <input type="file" class="form-control-file mt-2 file-input" name="file">
								        <input type="file" class="form-control-file mt-2 file-input" name="file">
								        <input type="file" class="form-control-file mt-2 file-input" name="file">
								        <input type="file" class="form-control-file mt-2 file-input" name="file">
								    </div>
								</div>
								<div class="form-group submit-button">
									<button type="submit" class="btn btn-primary" id="submitButton" disabled>상품 등록</button>
								</div>
							</form>
						</div>
						<div class="col-md-2"></div>

					</div>
				</div>

			</section>

		</main>

		<%@ include file="../footer.jsp" %>
	</div>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
		// 가격 입력 필드의 입력 이벤트에 대한 처리
		$('#sale_price').on('input', function() {
			validatePrice();
		});

		
	    var fileNames = []; // 파일 이름을 저장할 배열
	    var fileInputs = []; // 파일 input 요소를 참조할 배열

	    // 파일 입력 요소에 이벤트 리스너 추가
	    $(document).ready(function() {
	        $('.file-input').each(function(index, element) {
	            $(element).on('change', previewFile);
	        });
	    });

	    // 상품 등록 시 스크롤 추가 + 삭제 시 스크롤 제거 + file 초기화
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
	                    var index = $(this).closest('.scroll-item').index();
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