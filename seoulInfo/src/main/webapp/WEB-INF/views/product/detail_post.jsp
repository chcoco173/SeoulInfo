<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  -->
<!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4821"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${product.sale_name} 상품 상세 내용</title>
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

<link href="/css/product/productStatus.css" rel="stylesheet" type="text/css">
<style>
	.large-author-thumbnail {
	    background-image: url("/files/${member.member_imageName}"), url("/images/mypage/default_profile.jpg");
	    background-position: 50%;
	    background-size: cover;
	    border-radius: 30px;
	    width: 3.5rem;
	    height: 3.5rem;
	    margin-right: 6px;
	}
	.h2, h2 {
		    font-size: 2rem;
			font-weight: bold; 
			margin : 1.5rem 0;
		}
		/* 뷰포트가 480px 이하일 때 */
		@media (max-width: 480px) {
		    .h2, h2 {
		        font-size: 1.2rem; /* 폰트 크기 더 조정 */
				font-weight: bold; 
				margin : 1.5rem 0; /* margin도 필요에 따라 조정 */
		    }
		}
</style>
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
									<a href="#" class="large-author-wrapper w-inline-block">
										<div class="large-author-thumbnail"></div>
										<h5 class="author-name">${product.member_id}</h5>
										<c:choose>
											<c:when test="${mostProduct_review != null}">
												<div class="speech-bubble-right">상품 상태 ${mostProduct_review}<br/> 대화 매너가 ${mostChat_review} <br/> 약속을 ${mostCommitment_review}</div>
											</c:when>
											<c:otherwise>
												<div class="speech-bubble-right">아직 리뷰가 없어요...</div>
											</c:otherwise>
										</c:choose>
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
													<!-- productImgList가 비어있는지 확인 -->
													   <c:choose>
													       <c:when test="${empty productImgList}">
													           <!-- productImgList가 비어있을 때 대체 이미지 표시 -->
													           <div class="carousel-item active">
													               <div class="carousel-image-wrapper">
													                   <img src="/NoImage/noimg.png" class="d-block img-fluid mx-auto" 
																	   			style="width: 500px;"/>
													               </div>
													           </div>
													       </c:when>
													       <c:otherwise>
													           <!-- productImgList가 비어있지 않을 때 이미지 표시 -->
													           <c:forEach var="image" items="${productImgList}" varStatus="status">
													               <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
													                   <div class="carousel-image-wrapper">
													                       <img src="/productImage/${image.productimg_alias}" 
													                            class="d-block img-fluid mx-auto" />
													                   </div>
													               </div>
													           </c:forEach>
													       </c:otherwise>
													   </c:choose>
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

											<h2 class="product-header">
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
											</h2>
											<h6>${product.sale_cate} ∙ ${timeAgo}</h6>
											<h6>
													 ${product.sale_area}
											</h6>
											<p>
												<strong class='price'data-price="${product.sale_price}"></strong>
												
											<p>
											<div class="form-field-wrapper">
												<textarea class="form-control" id="Style-Guide-Form-Message" name="Message" rows="6" readonly>${product.sale_descript}</textarea>
											</div>
											<h6>
												조회 ${product.sale_viewcount} ∙ 관심 <span class="interest">${interest}</span>∙ ${product.sale_status} 
											</h6>
											<div class="container mt-5 text-center">
												<input type="hidden" class="sale_id" value="${product.sale_id}"> <input type="hidden" class="member_id" value="${product.member_id}">
												<c:choose>
													<c:when test="${product.sale_status eq '판매완료'}">
														<!-- 판매 완료된 상품인 경우 -->
														<button class="button-primary-small w-button chatDisabled" disabled>이미 판매된 상품입니다</button>
													</c:when>
													<c:when test="${product.member_id eq sessionScope.member.member_id}">
														<!-- 현재 세션 사용자가 상품 소유자일 때 -->
														<button class="button-primary-small w-button chat">내 채팅방 가기</button>
													</c:when>
													<c:otherwise>
														<!-- 현재 세션 사용자가 상품 소유자가 아닐 때 -->
														<button class="button-primary-small w-button chatCreate">판매자와 채팅</button>
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
							style="opacity: 0">알고리즘이 추천한 유사상품 입니다</h2>
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
												<strong class='price' data-price="${similarList.sale_price}"></strong>
											</p>
											<p>
												관심 ${similarList.favorite_count} ∙ 조회 ${similarList.sale_viewcount} ∙ ${similarList.sale_status}
											</p>
											<!-- 날짜 차이 정보 추가 -->
											<p>
												${timeDataList[status.index]}
											</p>
											<!-- 거래중 상태일 때만 오버레이 추가 -->
											<c:if test="${similarList.sale_status eq '거래중' || productList.sale_status eq '판매완료'}">
												<div class="overlay">${similarList.sale_status}</div>
											</c:if>
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

	<%@ include file="../footer.jsp" %>

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
				
				
		// 위시 삭제 (heartOn -> heartOff)
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
						success: function(response) {
							 if (response.success) {
								// 관심 수 업데이트
								$this.attr('src', '/productimages/heart_off.png')
									.removeClass('heartOn')
									.addClass('heartOff');
								$this.closest('.product-description').find('.interest').text(response.interest);
						        alert('위시 삭제 성공');
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
				});

		// 위시 등록 (heartOff -> heartOn)
		$(document).on(
				'click',
				'.heartOff',
				function() {
					const loggedInUserId = document.getElementById('loggedInUserId').value;
					
					if (!loggedInUserId) {
						// 로그인 정보가 없을 경우 로그인 페이지로 리디렉션
						alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
						location.href = '/member/login';
					}
					var $this = $(this);
					var sale_id = $this.closest('.product-description').find(
							'.sale_id').val();

					$.ajax({
						type : 'POST',
						url : '/product/wishInsert',
						data : {
							"sale_id" : sale_id
						},
						success: function(response) {
							if (response.success) {
								// 관심 수 업데이트
								$this.attr('src', '/productimages/heart_on.png')
									.removeClass('heartOff')
						            .addClass('heartOn');
						        $this.closest('.product-description').find('.interest').text(response.interest);
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
		//유사상품 상품 상세 페이지로 이동
		$(".product-card").click(function(){
			var simailar_saleId = $(this).find('.similar_saleId').val();
			
			location.href = "/product/detail_post?sale_id="+simailar_saleId;	
		})
		var reviewStarAvg = ${reviewStarAvg}; // JSP에서 값을 전달받도록 설정
		
		// 별을 표시할 문자열 생성
		var filledStar = '&#9733;'; // 채워진 별
		var emptyStar = '&#9734;';  // 빈 별
		var totalStars = 5;         // 총 별 개수
		var starsHtml = '';

		// 별 문자열 생성
		for (var i = 0; i < totalStars; i++) {
			if (i < reviewStarAvg) {
				starsHtml += filledStar; // 채워진 별 추가
			} else {
				starsHtml += emptyStar; // 빈 별 추가
			}
		}
		// 별을 표시할 요소에 HTML 문자열 설정
		$('.stars').html(starsHtml);
		
		
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