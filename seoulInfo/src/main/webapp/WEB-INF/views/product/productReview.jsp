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
<link href="/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 별점아이콘 링크 https://sisiblog.tistory.com/355 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<style>
.main-wrapper {
	margin-top: 20px;
}

.product-card {
	border: 1px solid #ddd;
	padding: 10px;
	margin-bottom: 10px;
}

.product-card img {
	width: 50px;
	height: 50px;
	margin-right: 10px;
}

.product-details {
	display: flex;
	align-items: center;
}

.review-section {
	padding-left: 20px;
}

.review-buttons {
	display: flex;
	justify-content: center;
	margin-bottom: 10px;
}

.review-buttons label, .review-buttons input[type="text"] {
	margin: 0 5px;
}

.review-buttons input[type="radio"] {
	display: none;
}

.review-buttons label {
	padding: 10px 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	cursor: pointer;
}

.review-buttons input[type="radio"]:checked+label {
	background-color: #007bff;
	color: white;
}

.review-buttons input[type="text"] {
	padding: 10px 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	flex-grow: 1;
	max-width: 220px;
}


/*별점추가  */

.rating {
   position: relative;
   background: transparent;
   display: flex;
   justify-content: center;
   align-items: center;
   gap: .3em;
   padding: 5px;
   overflow: hidden;
   /* border-radius: 20px;
   box-shadow: 0 0 2px #b3acac; */
}

.rating__result {
   position: absolute;
   top: 0;
   left: 0;
   transform: translateY(-10px) translateX(-5px);
   z-index: -9;
   font: 3em Arial, Helvetica, sans-serif;
   color: #ebebeb8e;
   pointer-events: none;
}

.rating__star {
   font-size: 1.3em;
   cursor: pointer;
   color: #dabd18b2;
   transition: filter linear .3s;
}

.rating__star:hover {
   filter: drop-shadow(1px 1px 4px gold);
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
							<h1>구매내역</h1>
						</div>

						<div class="container-large">
							<div class="row">
								<div class="col-md-4">
									<div class="product-card">
										<div class="product-details">
											<img src="https://via.placeholder.com/50" alt="상품 1">
											<div>
												<h5>구매 상품 1</h5>
												<p>
													구매한 날짜<br>구매 상태 (예약/구매완료)
												</p>
											</div>
										</div>
										<button class="btn btn-secondary">후기 남기기</button>
									</div>
									<div class="product-card">
										<div class="product-details">
											<img src="https://via.placeholder.com/50" alt="상품 1">
											<div>
												<h5>구매 상품 1</h5>
												<p>
													구매한 날짜<br>구매 상태 (예약/구매완료)
												</p>
											</div>
										</div>
										<button class="btn btn-secondary">후기 남기기</button>
									</div>

								</div>

								<div class="col-md-8 text-center">
									<div class="product-card">
										<h2>판매자 거래 후기 남기기</h2>
										<p>받은 상품은 만족하나요?</p>
										<div class="review-buttons btn-group">
											<input type="radio" id="satisfied" name="satisfaction"
												value="satisfied"> <label for="satisfied">만족해요!</label>
											<input type="radio" id="unsatisfied" name="satisfaction"
												value="unsatisfied"> <label for="unsatisfied">아쉬워요..</label>
										</div>

										<p>대화 매너는 어땠나요?</p>
										<div class="review-buttons btn-group">
											<input type="radio" id="polite" name="manner" value="polite">
											<label for="polite">친절해요!</label> <input type="radio"
												id="impolite" name="manner" value="impolite"> <label
												for="impolite">별로에요..</label>
										</div>

										<p>약속은 잘 지켜졌나요?</p>
										<div class="review-buttons btn-group">
											<input type="radio" id="kept" name="commitment" value="kept">
											<label for="kept">잘 지켰어요!</label> <input type="radio"
												id="notkept" name="commitment" value="notkept"> <label
												for="notkept">아니요..</label>
										</div>
										<p>기타</p>
										<div class="review-buttons">
											<input type="text" id="etc" name="etc"
												placeholder="기타 의견을 입력하세요">
										</div>

										<p>별점 평가</p>
										<div class="rating center">
											<span class="rating__result"></span> <i
												class="rating__star far fa-star"></i> <i
												class="rating__star far fa-star"></i> <i
												class="rating__star far fa-star"></i> <i
												class="rating__star far fa-star"></i> <i
												class="rating__star far fa-star"></i>
										</div>
										
									</div>
								</div>
							</div>
						</div>
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
	<script type="text/javascript">
	const ratingStars = [...document.getElementsByClassName("rating__star")];

	function executeRating(stars) {
	  const starClassActive = "rating__star fas fa-star";
	  const starClassInactive = "rating__star far fa-star";
	  const starsLength = stars.length;
	  let i;

	  stars.map((star) => {
	    star.onclick = () => {
	      i = stars.indexOf(star);

	      if (star.className===starClassInactive) {
	        for (i; i >= 0; --i) stars[i].className = starClassActive;
	      } else {
	        for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
	      }
	    };
	  });
	}

	executeRating(ratingStars);
	

	</script>
</body>
</html>