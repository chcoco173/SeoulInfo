<%@page contentType="text/html; charset=UTF-8"%>
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

<!-- 외부 css -->
<link href="/css/product/product_detail.css" rel="stylesheet"
	type="text/css">



<script>
	function showBubble() {
		document.querySelector('.speech-bubble-right').style.display = 'inline-block';
	}

	function hideBubble() {
		document.querySelector('.speech-bubble-right').style.display = 'none';
	}
</script>

</head>
<body>
	<div class="page-wrapper">
		<%@include file="../productNav/productNav.jsp"%>

		<div class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="padding-section-medium remove-bottom-padding">
					<div class="padding-global">
						<div class="container-fluid">
							<div class="container-full-width">
								<h1 data-w-id="180b513c-4540-bab3-7036-972b35d8ddc4"
									style="opacity: 0" class="text-color-white w-dyn-bind-empty"></h1>
								<div data-w-id="771e0065-68e3-960e-1e46-624d6820421c"
									style="opacity: 0" class="post-author-and-tags-wrapper">
									<a href="#" class="large-author-wrapper w-inline-block"
										onmouseover="showBubble()" onmouseout="hideBubble()">
										<div class="large-author-thumbnail"></div>
										<h5 class="author-name">${product.member_id}</h5>
										<div class="speech-bubble-right">대화 매너가 좋아요!</div>
										<div>
											<div
												class="text-size-regular text-color-white w-dyn-bind-empty"></div>
											<div
												class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
										</div>
									</a>
								</div>
								<div class="rating">
									<div class="stars">&#9733; &#9733; &#9733; &#9734;
										&#9734;</div>
								</div>

								<div class="spacer-xlarge"></div>
								<div class="row">
									<div class="col-md-6">
										<div class="image-overflow-wrapper">
											<div id="carouselExampleIndicators" class="carousel slide"
												data-ride="carousel">
												<!-- 인디케이터 (슬라이드 표시점) -->
												<ol class="carousel-indicators">
													<c:forEach var="image" items="${productImgList}"
														varStatus="status">
														<li data-target="#carouselExampleIndicators"
															data-slide-to="${status.index}"
															class="${status.index == 0 ? 'active' : ''}"></li>
													</c:forEach>
												</ol>

												<!-- 슬라이드 항목 -->
												<div class="carousel-inner">
													<c:forEach var="image" items="${productImgList}"
														varStatus="status">
														<div
															class="carousel-item ${status.index == 0 ? 'active' : ''}">
															<div class="carousel-image-wrapper">
																<img src="/productImage/${image.productimg_alias}"
																	class="d-block img-fluid mx-auto" />
															</div>
														</div>
													</c:forEach>
												</div>

												<!-- 이전 버튼 -->
												<a class="carousel-control-prev" href="javascript:void(0)"
													role="button" data-target="#carouselExampleIndicators"
													data-slide="prev"> <span
													class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="sr-only">Previous</span>
												</a>

												<!-- 다음 버튼 -->
												<a class="carousel-control-next" href="javascript:void(0)"
													role="button" data-target="#carouselExampleIndicators"
													data-slide="next"> <span
													class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="sr-only">Next</span>
												</a>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="product-description">

											<h3 class="product-header">
												${product.sale_name}
												<!-- 찜기능 구현 -->
												<c:choose>
													<c:when test="${wishCheck}">
														<img src="/productimages/heart_on.png"
															class="heart-image heartOn" />
													</c:when>
													<c:otherwise>
														<img src="/productimages/heart_off.png"
															class="heart-image heartOff" />
													</c:otherwise>
												</c:choose>

											</h3>
											<h6>
												<img id="wonImage" src="/productimages/won.png"
													class="won-image" /> ${product.sale_price}
											</h6>
											<h6>
												<img id="deal_stateImage"
													src="/productimages/deal_state.png"
													class="deal_state-image" /> ${product.sale_status}
											</h6>
											<h6>${product.sale_cate}</h6>
											<h6>
												<img id="lociImage" src="/productimages/loci.png"
													class="loci-image" /> ${product.sale_area}
											</h6>
											<h6>
												조회수  ${product.sale_viewcount}
											</h6>
											
											<div class="form-field-wrapper">
												<label for="Style-Guide-Form-Message"
													class="form-field-label">상품 상세</label>
												<textarea id="Style-Guide-Form-Message" name="Message"
													maxlength="5000" data-name="Message" placeholder="Message"
													class="form-field text-area w-input" readonly>${product.sale_descript}</textarea>
											</div>
											<br />
											<div class="container mt-5 text-center">
												<input type="hidden" class="sale_id"
													value="${product.sale_id}"> <input type="hidden"
													class="member_id" value="${product.member_id}">
												<c:choose>
													<c:when
														test="${product.member_id eq sessionScope.member.member_id}">
														<button class="button-primary-small w-button chat">내채팅방
															가기</button>
													</c:when>
													<c:otherwise>
														<button class="button-primary-small w-button chatCreate">판매자와
															채팅</button>
													</c:otherwise>
												</c:choose>
											</div>
											<br />
										</div>
									</div>
								</div>
								<!-- row 끝-->

							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!--	유사상품	-->
		<div class="section-posts-grid background-light-gray">
			<div class="padding-global">
				<div class="padding-section-medium">
					<div class="container-full-width">
						<h2 data-w-id="9cd55f64-9d5f-e93b-4891-5196167f55bc"
							style="opacity: 0">유사한 상품 추천</h2>
						<div class="spacer-xlarge"></div>
						<div data-w-id="b1e774c6-4b2b-b3d4-cf1a-05e688bc0a4b"
							style="opacity: 0" class="divider-line"></div>
						<div class="spacer-xlarge"></div>
						<div class="w-dyn-list">
							<c:forEach items="${similarList}" var="similarList"
								varStatus="status">
									<div class="product-card">
										<c:choose>
											<c:when test="${not empty similarList.productimg_alias}">
												<img src="/productImage/${similarList.productimg_alias}"
													alt="상품 이미지" class="product-image"
													style="height: 250px; width: 250px;">
											</c:when>
											<c:otherwise>
												<img src="https://via.placeholder.com/200" alt="이미지없음"
													class="product-image">
											</c:otherwise>
										</c:choose>

										<div class="product-info">
											<input type="hidden" class="similar_saleId"
												value="${similarList.sale_id}">
											<h4>${similarList.sale_name}</h4>
											<p>${similarList.sale_area}</p>
											<p>
												<strong>${similarList.sale_price}</strong>
											</p>
											<p>
												관심 ${similarList.favorite_count}<span
													style="margin-left: 20px;">상태:
													${similarList.sale_status}</span>
											</p>
											<!-- 날짜 차이 정보 추가 -->
											<p>
												${timeDataList[status.index]}<span style="margin-left: 30px;">조회수 : ${similarList.sale_viewcount}</span>
											</p>
										</div>
									</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--유사상품 구현 끝-->
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
									<a href="http://tiktok.com" target="_blank" class="footer-link">TikTok</a>
									<a href="http://Instagram.com" target="_blank"
										class="footer-link">Instagram</a> <a
										href="http://Facebook.com" target="_blank" class="footer-link">Facebook</a>
									<a href="http://Youtube.com" target="_blank"
										class="footer-link">Youtube</a>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- 로그인 여부 확인을 위한 hidden input -->
	<c:choose>
	    <c:when test="${not empty sessionScope.member}">
	        <input type="hidden" id="loggedInUserId" value="${sessionScope.member.member_id}">
	    </c:when>
	    <c:otherwise>
	        <input type="hidden" id="loggedInUserId" value="">
	    </c:otherwise>
	</c:choose>
	<script>
		$(".chatCreate")
				.click(
						function() {
							const loggedInUserId = document.getElementById('loggedInUserId').value;

				            if (!loggedInUserId) {
				                // 로그인 정보가 없을 경우 로그인 페이지로 리디렉션
				                alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
				                window.location.href = '/member/login';
				                return;
				            }
							// 현재 페이지가 chat.jsp 인지 확인해서 삭제된 채팅방 다시 생성안되게 함
							if (window.location.pathname.includes('chat.jsp')) {
							    console.log('현재 채팅 페이지에 있으므로 chatCreate를 호출하지 않습니다.');
							    return;
							}
							var memberId = $(this).closest(
									'.product-description').find('.member_id')
									.val();
							var saleId = $(this)
									.closest('.product-description').find(
											'.sale_id').val();

							console
									.log(`memberId: ${memberId}, saleId: ${saleId}`); // 디버깅용 로그
							var url = `chatCreate?member_id=${memberId}&sale_id=${saleId}`;
							console.log(`URL: ${url}`); // 디버깅용 로그
							location.href = 'chatCreate?member_id=' + memberId
									+ '&sale_id=' + saleId;

						});

		$(".chat").click(
				function() {
					var memberId = $(this).closest('.product-description')
							.find('.member_id').val();
					var sale_id = $(this).closest('.product-description').find(
							'.sale_id').val();
					alert(memberId);
					alert(sale_id);

					window.location.href = "chat";
				});

		$(document).on(
				'click',
				'.heartOn',
				function() {
					var $this = $(this);
					var sale_id = $this.closest('.product-description').find(
							'.sale_id').val();

					$.ajax({
						type : 'POST',
						url : '/product/wishDelete',
						data : {
							"sale_id" : sale_id
						},
						success : function(result) {
							if (result == '1') {
								// heartOff로 바꾸기
								$this.attr('src',
										'/productimages/heart_off.png')
										.removeClass('heartOn').addClass(
												'heartOff');
								alert('위시 삭제 성공');
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
				});

		// heartOff 버튼 클릭 시
		$(document).on(
				'click',
				'.heartOff',
				function() {
					var $this = $(this);
					var sale_id = $this.closest('.product-description').find(
							'.sale_id').val();

					$.ajax({
						type : 'POST',
						url : '/product/wishInsert',
						data : {
							"sale_id" : sale_id
						},
						success : function(result) {
							if (result == '1') {
								// heartOn로 바꾸기
								$this
										.attr('src',
												'/productimages/heart_on.png')
										.removeClass('heartOff').addClass(
												'heartOn');
								alert('위시 등록 성공');
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
				});

		//author-name 클릭시

		$(".author-name").click(function() {
			var memberId = $(this).closest('.author-name').text();

			location.href = "productMemberPage?member_id=" + memberId;
		})
		
		$(".product-card").click(function(){
			var simailar_saleId = $(this).find('.similar_saleId').val();
			
			location.href = "/product/detail_post?sale_id="+simailar_saleId;
			
			
			
		})
	</script>
</body>
</html>