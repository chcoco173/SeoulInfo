<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>${festival.festival_name}</title>
<meta content="" property="og:title">
<meta content="" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<!-- 08/14 기진 bootstrap 추가-->	
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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

<!-- 08/14 기진 css-file 및 bootstrap 추가-->
<link href="/css/festival/festivalDetail.css" rel="stylesheet">	
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style>
.nav_wrap {position:relative;top:30px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #2962ff;overflow: hidden;z-index: 2; color:white;}
#map img {border-radius:0px;}
span img {border-radius:0px;}
</style>
</head>
<body>
	<div class="page-wrapper">
		<!-- 검색창 start -->
		<div class="page-wrapper">
			<div class="navigation-wrapper">
				<div data-animation="default" data-collapse="medium"
					data-duration="400" data-easing="ease" data-easing2="ease"
					role="banner" class="navbar_m w-nav">
					<div class="nav-wrapper">
						<a href="/" aria-current="page"
							class="brand w-nav-brand w--current"> <img
							src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
							alt="">
						</a>
						<div class="links-and-search-wrapper">
							<%
								if (session.getAttribute("member") != null) {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
									class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
									class="nav-link w-nav-link">로그아웃</a>
							</nav>
							<%
								} else {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}"
									class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
									class="nav-link w-nav-link">전기차</a> <a href="/member/login"
									class="nav-link w-nav-link">로그인</a>
							</nav>
							<%
								}
							%>
							
						</div>
						<div class="menu-button w-nav-button">
							<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
								class="icon-1x1-xsmall">
						</div>
					</div>
				</div>
			</div>
			<!-- 검색창 end -->
			<!-- 축제 상세 정보 start -->
			<div class="main-wrapper">
				<div class="section-post-banner">
					<div class="padding-global">
						<div class="padding-section-medium">
							<div class="container-full-width">
								<h3>${festival.festival_name}</h3><br>
								
								<div class="flex-container">
									<div class="flex-item image-overflow-wrapper">
										<img src="${festival.festival_imageurl}"
											alt="${festival.festival_name}">
									</div>
									<div class="flex-item festival-details">
										
										<p>일시:${festival.festival_startDate}~${festival.festival_endDate}</p>
										<p>장소: ${festival.festival_loc}</p>
										<p>이용 요금: ${festival.festival_fee}</p>
										<p>이용 대상: ${festival.festival_target}</p>
										<p>주체자: ${festival.festival_host}</p>
										<p>조회수: ${festival.festival_viewcount}</p>
										<input type="hidden" id="festivalLat" style="display: none;"
											value="${festival.festival_lat}">
										<!-- 위도 -->
										<input type="hidden" id="festivalLng" style="display: none;"
											value="${festival.festival_long}">
										<!-- 경도 -->
										<input type="hidden" id="festivalName" style="display: none;"
											value="${festival.festival_name}">
										<!-- 이름 -->
										<a href="${festival.festival_siteurl}" target="_blank"
											class="">사이트 바로가기</a>
										<div class="map_wrap">
										<div id="map"></div>
										<ul id="category">
										        <li id="etcCheckAll" data-order="0"> 
										            <span><img src="/images/festival/all.png" alt="all"></span>
										            전체
										        </li>   
												<li id="etcCheck1" data-order="1"> 
										            <span><img src="/images/festival/parking.png" alt="parking"></span>
										            주차장
										        </li>     
										        <li id="etcCheck4" data-order="2"> 
										            <span><img src="/images/festival/market.png" alt="market"></span>
										            마트
										        </li>  
										        <li id="etcCheck5" data-order="3"> 
										            <span><img src="/images/festival/pharmacy.png" alt="pharmacy"></span>
										            약국
										        </li>  
										        <li id="etcCheck3" data-order="4"> 
										            <span><img src="/images/festival/cafe.png" alt="cafe"></span>
										            카페
										        </li>  
										        <li id="etcCheck2" data-order="5"> 
										            <span><img src="/images/festival/convini.png" alt="convini"></span>
										            편의점
										        </li>      
										    </ul>
											</div>
											<div>
												<button type="button" class="btn btn-primary nav_wrap">길찾기 ▶</button>
											</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 축제 상세정보 end -->
			</br>
			
			
			<!-- 축제 후기 등록하기 start -->
			<div class="section-newsletter">
				<div class="padding-global">
					<div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd"
						class="container-newsletter background-black">
						<div class="_2-column-grid-uneven-right">
							<h4 class="newsletter-heading">사진과 함께 축제 후기를 남겨주세요!</h4>
							<input type="hidden" id="festival_id" name="festival_id"
								value="${festival.festival_id }"> <input type="submit"
								class="button-primary-large max-width-full-mobile-portrait w-button"
								value="새 후기 작성하러 가기" id="newReviewBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 축제 후기 등록하기 end -->
		</br> </br>
		<!-- 축제리뷰 리스트 start -->
		<div class="section-posts-row">
			<div class="padding-global">
				<div class="padding-section-medium remove-top-padding">
					<div class="container-full-width">
						<h4 data-w-id="e144bf26-0d49-109b-1b5b-756bc18db81f"
							style="opacity: 0">최근 축제 리뷰</h4>
						<div class="spacer-xlarge"></div>
						<div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db822"
							style="opacity: 0" class="divider-line"></div>
						<div class="spacer-xlarge"></div>
						<div class="w-dyn-list">
							<div role="list" class="w-dyn-items">
								<c:forEach items="${reviewList}" var="review">
									<div data-w-id="e144bf26-0d49-109b-1b5b-756bc18db826"
										style="opacity: 0" role="listitem" class="w-dyn-item">
										<div class="post-row-grid">
											<a id="w-node-e144bf26-0d49-109b-1b5b-756bc18db828-4f5c4823"
												data-w-id="e144bf26-0d49-109b-1b5b-756bc18db828" href="#"
												class="post-row-image-overflow-container w-inline-block">
												<c:choose>
													<c:when test="${not empty review.image}">
														<div
															id="w-node-e144bf26-0d49-109b-1b5b-756bc18db829-4f5c4823"
															data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"
															style="background-image: url('${review.image}');
						                                    transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);"
															class="post-row-image"></div>
													</c:when>
													<c:otherwise>
														<div
															id="w-node-e144bf26-0d49-109b-1b5b-756bc18db829-4f5c4823"
															data-w-id="e144bf26-0d49-109b-1b5b-756bc18db829"
															style="background-color: #ccc; transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);"
															class="post-row-image"></div>
													</c:otherwise>
												</c:choose>
											</a>
											<div
												id="w-node-e144bf26-0d49-109b-1b5b-756bc18db82a-4f5c4823"
												class="post-row-wrapper">
												<a id="w-node-e144bf26-0d49-109b-1b5b-756bc18db830-4f5c4823"
													href="#" class="w-inline-block"> <input type="hidden"
													id="fr_id" name="fr_id" value="${review.fr_id}">
													<h3>${review.fr_title}</h3>
												</a>
												<div class="small-author-wrapper">
													<a href="#"
														class="author-pic-and-name-wrapper w-inline-block">
														<div class="small-author-thumbnail">
															<img src="${review.memberImageUrl}"
																alt="${review.member_id}" class="author-thumbnail-image">
														</div>
														<div class="text-size-regular">${review.member_id}</div>
													</a>
													<div class="line-divider"></div>
													<div class="text-size-regular text-color-dark-gray">
														<fmt:formatDate value="${review.fr_regdate}"
															pattern="yyyy-MM-dd" />
													</div>
												</div>
												<div class="review-buttons">
													<input type="hidden" id="fr_id" name="fr_id"
														value="${review.fr_id}"> <input type="hidden"
														id="member_id" name="member_id"
														value="${review.member_id}">
													<button
														class="button-primary-large max-width-full-mobile-portrait w-button edit"
														style="display: none;">내 후기 수정</button>
													<button
														class="button-primary-large max-width-full-mobile-portrait w-button delete"
														style="display: none;">내 후기 삭제</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 축제리뷰 리스트 end -->

	<%@ include file="../footer.jsp"%>
	<!-- section-footer end -->
	<script>	
	document.addEventListener('DOMContentLoaded', function() {
		// 후기 남기기
		var newReviewBtn = document.getElementById('newReviewBtn');
		var festivalId = document.getElementById('festival_id').value;

		var sessionResult = '<c:out value="${sessionScope.member != null ? sessionScope.member.member_id : ''}" />';
		newReviewBtn.onclick = function() {
			// 로그인 안되있을 때
			if(sessionResult === ''){
				 var userConfirmed = confirm("후기를 작성하려면 로그인이 필요합니다.");
				 if (userConfirmed) {
				    // 로그인 페이지로 리다이렉트
				 	window.location.href = '/member/login';
				 }
			}else{
				window.location.href = "/festival/festivalReview?festival_id=" + festivalId;
				}
		}
		
	    // 후기의 이미지와 제목 요소들을 가져옵니다.
	    const reviewElements = document.querySelectorAll('.post-row-image-overflow-container, .post-row-wrapper a');

	    reviewElements.forEach(function(element) {
	        element.addEventListener('click', function(event) {
	            event.preventDefault(); // 기본 동작을 막습니다.

	            // 클릭한 요소의 부모 요소에서 hidden input 요소를 찾습니다.
	            const frIdInput = element.closest('.post-row-grid').querySelector('input[name="fr_id"]');
	            const frId = frIdInput.value;

	            // festivalReviewDetail 페이지로 이동합니다.
	            window.location.href = "/festival/festivalReviewDetail?fr_id=" + frId;
	        });
	    });
		
		// 수정 및 삭제 버튼 기능 추가
		document.querySelectorAll('.review-buttons').forEach(function(buttonContainer) {
		    const reviewId = buttonContainer.querySelector('input[name="fr_id"]').value;
		    console.log("수정 삭제 reviewId " + reviewId);
		    const reviewMemberId = buttonContainer.querySelector('input[name="member_id"]').value;
		    console.log("수정 삭제 reviewMemberId " + reviewMemberId);

		    if (sessionResult === reviewMemberId) {
		        const editButton = buttonContainer.querySelector('.edit');
		        const deleteButton = buttonContainer.querySelector('.delete');

		        editButton.style.display = 'inline-block';
		        deleteButton.style.display = 'inline-block';

		        editButton.addEventListener('click', function() {
		            window.location.href = "/festival/festivalReview?fr_id=" + reviewId;
		        });

		        deleteButton.addEventListener('click', function() {
		            var userConfirmed = confirm("삭제하시겠습니까?");
		            if (userConfirmed) {
		                // AJAX 요청을 통해 삭제 요청을 서버로 보냅니다.
		                fetch('/festival/deleteReview', {
		                    method: 'POST',
		                    headers: {
		                        'Content-Type': 'application/x-www-form-urlencoded'
		                    },
		                    body: new URLSearchParams({
		                        'fr_id': reviewId
		                    })
		                })
		                .then(response => response.text())
		                .then(result => {
		                    if (result === "success") {
		                        alert("후기가 삭제되었습니다.");
		                        window.location.reload();
		                    } else {
		                        alert("후기 삭제에 실패했습니다.");
		                    }
		                })
		                .catch(error => {
		                    console.error('Error:', error);
		                    alert("후기 삭제 중 오류가 발생했습니다.");
		                });
		            }
		        });
		    }
		});
	});


  </script>

	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<!-- 08/13 기진 : kakao map apiKey-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=008b79e594d7ab4e1058e1180ccf546c"></script>

	<!-- 8/13 기진 지도관련 script 추가 -->
	<script src="/js/festivalDetail.js" type="text/javascript"></script>

</body>

</html>
