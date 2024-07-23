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
<link href="/css/product/product_detail.css" rel="stylesheet" type="text/css">
<style>
	.carousel-image-wrapper {
	    background-color: #000000; /* 배경색 설정 */
	    width: 100%;
	    height: 400px;
	    padding-top: 50%; /* 비율 설정, 예: 16:9 비율 */
		position: relative; /* 자식 요소를 절대 위치로 설정하기 위한 준비 */
	    display: flex; /* 중앙 정렬을 위한 flex 사용 */
	    align-items: center;
	    justify-content: center;
	    overflow: hidden;
		
	}

	.carousel-image-wrapper img {
	    position: absolute; /* 절대 위치로 부모 요소에 맞게 조정 */
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%); /* 중앙 정렬 */
	    width: 100%;
	    height: 80%; /* 비율 유지 */
	    max-width: 100%; /* 이미지가 컨테이너 너비를 넘지 않도록 설정 */
	    max-height: 100%; /* 이미지가 컨테이너 높이를 넘지 않도록 설정 */
	    object-fit: contain; /* 이미지 비율 유지하며 컨테이너에 맞춰 조정 */
	}

	/* 미디어 쿼리: 화면 크기에 따라 비율을 조정 */
	@media (max-width: 1200px) {
	    .carousel-image-wrapper {
	        padding-top: 50%; /* 비율 조정 예: 2:1 비율 */
	    }
	}

	@media (max-width: 992px) {
	    .carousel-image-wrapper {
	        padding-top: 75%; /* 비율 조정 예: 4:3 비율 */
	    }
	}

	@media (max-width: 768px) {
	    .carousel-image-wrapper {
	        padding-top: 100%; /* 비율 조정 예: 1:1 비율 */
	    }
	}

	@media (max-width: 576px) {
	    .carousel-image-wrapper {
	        padding-top: 120%; /* 비율 조정 예: 더 작은 화면에서 비율 조정 */
	    }
	}

	
	

	

</style>


<script>
	function showBubble() {
		document.querySelector('.speech-bubble-right').style.display = 'inline-block';
	}

	function hideBubble() {
		document.querySelector('.speech-bubble-right').style.display = 'none';
	}
	function toggleHeart() {
		var img = document.getElementById('heartImage');
		
		if (img.src.includes('heart_off.png')) {
			img.src = '/productimages/heart_on.png';
		} else {
			img.src = '/productimages/heart_off.png';
			
		}
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
								<div class="spacer-xlarge"></div>
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
								            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
								                <!-- 인디케이터 (슬라이드 표시점) -->
								                <ol class="carousel-indicators">
								                    <c:forEach var="image" items="${productImgList}" varStatus="status">
								                        <li data-target="#carouselExampleIndicators" data-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}"></li>
								                    </c:forEach>
								                </ol>

								                <!-- 슬라이드 항목 -->
								                <div class="carousel-inner">
								                    <c:forEach var="image" items="${productImgList}" varStatus="status">
								                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
								                            <div class="carousel-image-wrapper">
								                                <img src="/productImage/${image.productimg_alias}" class="d-block img-fluid mx-auto"/>
								                            </div>
								                        </div>
								                    </c:forEach>
								                </div>

								                <!-- 이전 버튼 -->
								                <a class="carousel-control-prev" href="javascript:void(0)" role="button" data-target="#carouselExampleIndicators" data-slide="prev">
								                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								                    <span class="sr-only">Previous</span>
								                </a>

								                <!-- 다음 버튼 -->
								                <a class="carousel-control-next" href="javascript:void(0)" role="button" data-target="#carouselExampleIndicators" data-slide="next">
								                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								                    <span class="sr-only">Next</span>
								                </a>
								            </div>
								        </div>
								    </div>
								    <div class="col-md-6">
								        <div class="product-description">
								            <h3 class="product-header">
								                ${product.sale_name} 
								                <img id="heartImage" src="/productimages/heart_off.png" class="heart-image" onclick="toggleHeart()"/>
								            </h3>
								            <h6>
								                <img id="wonImage" src="/productimages/won.png" class="won-image" />
								                ${product.sale_price}
								            </h6>
								            <h6>
								                <img id="deal_stateImage" src="/productimages/deal_state.png" class="deal_state-image" /> 
								                ${product.sale_status}
								            </h6>
								            <h6>${product.sale_cate}</h6>
								            <h6>
								                <img id="lociImage" src="/productimages/loci.png" class="loci-image" /> 
								                ${product.sale_area}
								            </h6>
								            <div class="form-field-wrapper">
								                <label for="Style-Guide-Form-Message" class="form-field-label">상품 상세</label>
								                <textarea id="Style-Guide-Form-Message" name="Message" maxlength="5000" data-name="Message" placeholder="Message" class="form-field text-area w-input" readonly>${product.sale_descript}</textarea>
								            </div>
								            <br />
								            <div class="container mt-5 text-center">
								                <button class="button-primary-small w-button">판매자와 채팅</button>
								                <button class="button-primary-small w-button">바로 구입하기</button>
								            </div>
								            <br />
								        </div>
								    </div>
								</div> <!-- row 끝-->

							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

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
							<div role="list" class="_3-column-grid w-dyn-items">
								<div data-w-id="3685bd48-e5ab-20e0-9347-b40d2d3445f4"
									style="opacity: 0" role="listitem"
									class="post-grid-collection-item w-dyn-item">
									<div class="post-grid-wrapper">
										<a id="w-node-_4786a47f-17a7-4845-3f57-410c5a533ed6-4f5c4821"
											href="#"
											class="cms-grid-image-overflow-container w-inline-block">
											<div data-w-id="b2556d4a-0911-4df3-0312-5cc129a4b6f5"
												class="cms-grid-image"></div>
										</a>
										<div class="tags-wrappers">
											<a href="#" class="tag w-inline-block">
												<div class="text-size-small w-dyn-bind-empty"></div>
											</a> <a href="#" class="tag w-inline-block">
												<div class="text-size-small w-dyn-bind-empty"></div>
											</a>
										</div>
										<a id="w-node-a84994d4-c317-d35e-36e3-09e254755d94-4f5c4821"
											href="#" class="w-inline-block">
											<h3 class="w-dyn-bind-empty"></h3>
										</a>
										<div class="small-author-wrapper">
											<a href="#"
												class="author-pic-and-name-wrapper w-inline-block">
												<div class="small-author-thumbnail"></div>
												<div class="text-size-regular w-dyn-bind-empty"></div>
											</a>
											<div class="line-divider"></div>
											<div
												class="text-size-regular text-color-dark-gray w-dyn-bind-empty"></div>
										</div>
									</div>
									<div class="grid-post-link-wrapper">
										<a href="#" class="button-text-only w-button">Read more</a> <a
											id="w-node-a66acb0f-ee54-d598-d077-87c3081e470b-4f5c4821"
											href="#"
											class="button-icon hide-mobile-landscape w-inline-block"><img
											src="/images/ph_arrow-up-right-light-xxsmall-dark-gray.svg"
											loading="lazy" alt="" class="icon-1x1-xxsmall"></a>
									</div>
								</div>
							</div>
							<div class="empty-state w-dyn-empty">
								<div class="text-size-regular">No items found.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
</body>
</html>