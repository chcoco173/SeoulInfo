<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
.main-wrapper {
	margin-top: 20px;
}

.form-group label {
	font-weight: bold;
}

.checkbox-group label {
	margin-right: 10px;
}

.submit-button {
	display: flex;
	justify-content: center;
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
							<form>
								<div class="form-group">
									<label for="productName">상품명</label> <input type="text"
										class="form-control" id="productName"
										placeholder="상품명을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="productDescription">상품 설명</label>
									<textarea class="form-control" id="productDescription" rows="3"
										placeholder="상품 설명을 입력해주세요"></textarea>
								</div>
								<div class="form-group">
									<label>카테고리</label>
									<div class="row">
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics1" value="여성의류"> <label
													class="form-check-label" for="categoryElectronics1">여성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics2" value="남성의류"> <label
													class="form-check-label" for="categoryElectronics2">남성의류</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics3" value="신발"> <label
													class="form-check-label" for="categoryElectronics3">신발</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics4" value="가방/지갑"> <label
													class="form-check-label" for="categoryElectronics4">가방/지갑</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics5" value="시계"> <label
													class="form-check-label" for="categoryElectronics5">시계</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics6" value="쥬얼리"> <label
													class="form-check-label" for="categoryElectronics6">쥬얼리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics7" value="패션 액세서리"> <label
													class="form-check-label" for="categoryElectronics7">패션
													액세서리</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics8" value="디지털"> <label
													class="form-check-label" for="categoryElectronics8">디지털</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryElectronics9" value="가전제품"> <label
													class="form-check-label" for="categoryElectronics9">가전제품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryHousehold" value="스포츠/레저"> <label
													class="form-check-label" for="categoryHousehold">스포츠/레저</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryBooks" value="차량/오토바이"> <label
													class="form-check-label" for="categoryBooks">차량/오토바이</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryClothing" value="스타굿즈"> <label
													class="form-check-label" for="categoryClothing">스타굿즈</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers1" value="키덜트"> <label
													class="form-check-label" for="categoryOthers1">키덜트</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers2" value="예술/희귀/수집품"> <label
													class="form-check-label" for="categoryOthers2">예술/희귀/수집품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers3" value="음반/악기"> <label
													class="form-check-label" for="categoryOthers3">음반/악기</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers4" value="도서/티켓/문구"> <label
													class="form-check-label" for="categoryOthers4">도서/티켓/문구</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers5" value="뷰티/미용"> <label
													class="form-check-label" for="categoryOthers5">뷰티/미용</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers6" value="가구/인테리어"> <label
													class="form-check-label" for="categoryOthers6">가구/인테리어</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers7" value="생활/주방용품"> <label
													class="form-check-label" for="categoryOthers7">생활/주방용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers8" value="공구/산업용품"> <label
													class="form-check-label" for="categoryOthers8">공구/산업용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers9" value="식품"> <label
													class="form-check-label" for="categoryOthers9">식품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers10" value="유아동/출산"> <label
													class="form-check-label" for="categoryOthers10">유아동/출산</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers11" value="반려동물용품"> <label
													class="form-check-label" for="categoryOthers11">반려동물용품</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryOthers12" value="기타"> <label
													class="form-check-label" for="categoryOthers12">기타</label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="productPrice">판매가</label> <input type="text"
										class="form-control" id="productPrice"
										placeholder="가격을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="productLocation">거래 주소</label> <select
										class="form-control" id="locationSelect">
										<option>전체</option>
										<option>강남구</option>
										<option>강동구</option>
										<option>강서구</option>
										<option>강북구</option>
										<option>관악구</option>
										<option>광진구</option>
										<option>구로구</option>
										<option>금천구</option>
										<option>노원구</option>
										<option>도봉구</option>
										<option>동대문구</option>
										<option>동작구</option>
										<option>마포구</option>
										<option>서대문구</option>
										<option>서초구</option>
										<option>성동구</option>
										<option>성북구</option>
										<option>송파구</option>
										<option>양천구</option>
										<option>영등포구</option>
										<option>용산구</option>
										<option>은평구</option>
										<option>종로구</option>
										<option>중구</option>
										<option>중랑구</option>
									</select>
								</div>
								<div class="form-group">
									<label for="productImage">상품 사진 업로드</label>
									<div>
										<input type="file" class="form-control-file mt-2"
											id="productImage">
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
								<a href="../index.html" class="w-inline-block"><img
									src="images/ph_globe-simple-light-medium.svg" loading="lazy"
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
</body>
</html>