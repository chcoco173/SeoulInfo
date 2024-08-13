<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>JADE&#x27;s Dandy Site</title>
<meta content="" property="og:title">
<meta content="" property="twitter:title">
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
<style>
	/* 전체 래퍼 스타일 */
	.main-wrapper {
	    padding: 20px;
	    display: flex;
	    justify-content: center;
	}

	/* 배너 섹션 스타일 */
	.section-post-banner {
	    background-color: #fff;
	    border: 1px solid #ddd;
	    border-radius: 12px;
	    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    width: 100%;
	    max-width: 1800px;
	    margin: 0 auto;
	    padding: 20px;
	}

	/* 글로벌 패딩 설정 */
	.padding-global {
	    padding: 0 20px;
	}

	/* 섹션 패딩 설정 */
	.padding-section-medium {
	    padding: 20px 0;
	}

	/* 전체 컨테이너 스타일 */
	.container-full-width {
	    width: 100%;
	}

	/* 제목 스타일 */
	.container-full-width h3 {
	    color: #333;
		font-weight: bold;
	    text-align: center;
	    margin-bottom: 20px;
	}


	/* 플렉스 컨테이너 스타일 */
	.flex-container {
	    display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    gap: 20px;
	    justify-content: center;
	    flex-wrap: wrap;
	}

	/* 이미지 래퍼 스타일 */
	.image-overflow-wrapper {
	    flex: 1 1 400px; /* 이미지 영역의 기본 너비를 400px로 설정 */
	    max-width: 100%;
	    margin-bottom: 20px;
		display: flex; /* 플렉스 박스 설정 */
		justify-content: center; /* 이미지 수평 가운데 정렬 */
		align-items: center; /* 이미지 수직 가운데 정렬 */
	}

	/* 이미지 스타일 */
	.image-overflow-wrapper img {
	    width: 80%; /* 이미지가 컨테이너에 맞춰 100%로 확장 */
	    height: auto;
	    object-fit: cover;
	    border: 1px solid #ddd;
	}

	/* 세부사항 영역 스타일 */
	.festival-details {
	    flex: 2 1 500px; /* 세부사항 영역의 기본 너비를 500px로 설정 */
	    max-width: 100%;
	}

	/* 텍스트 스타일 */
	.festival-details p {
	    margin: 8px 0;
	    font-size: 16px;
	    color: #555;
	}

	/* 링크 스타일 */
	.festival-details a {
	    display: inline-block;
	    margin-top: 10px;
	    font-size: 16px;
	    color: #007bff;
	    text-decoration: none;
	    border-bottom: 1px solid #007bff;
	    transition: color 0.3s, border-bottom-color 0.3s;
	}

	.festival-details a:hover {
	    color: #0056b3;
	    border-bottom-color: #0056b3;
	}

	/* 숨겨진 input 스타일 */
	input[type="hidden"] {
	    display: none;
	}

	/* 맵 스타일 */
	#map {
	    width: 100%; /* 맵을 100% 너비로 설정 */
	    height: 500px; /* 맵의 높이를 400px로 증가 */
	    border-radius: 20px 20px 0 0;
	    margin: 20px 0 0;
	    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	}
	
	/* 반응형 디자인을 위한 미디어 쿼리 */
	@media (max-width: 768px) {
	    .flex-container {
	        flex-direction: column;
	        align-items: center;
	    }

	    .image-overflow-wrapper,
	    .festival-details {
	        flex: 1 1 100%;
	        max-width: 100%;
	    }

	    /* 이미지 스타일을 모바일에서 가운데 정렬하고 크기를 조정 */
	    .image-overflow-wrapper {
	        display: flex;
	        justify-content: center;
	    }

	    .image-overflow-wrapper img {
	        width: 50%; /* 모바일 화면에서 이미지의 너비를 50%로 설정 */
	    }

	    /* 맵 스타일을 모바일에서 조정 */
	    #map {
	        width: 100%;
	        height: 200px; /* 모바일 화면에서 맵의 높이를 200px로 설정 */
	    }
	}

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
							<form action="/search"
								data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
								class="search w-form">
								<div class="search-div">
									<img src="/images/ph_magnifying-glass-light-xsmall.svg"
										loading="lazy" alt="" class="icon-1x1-xsmall">
								</div>
								<div class="nav-search-outer-wrapper">
									<div class="nav-search-internal-wrapper">
										<input class="form-field w-input" maxlength="256" name="query"
											placeholder="Search…" type="search" id="search" required="">
										<div class="search-button-wrapper">
											<input type="submit" class="button-primary-small w-button"
												value="Search"> <a
												data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
												class="close-search-link-block w-inline-block"> <img
												src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
												class="icon-1x1-xsmall">
											</a>
										</div>
									</div>
								</div>
							</form>
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
								<h3>${festival.festival_name}</h3>
								
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
										<a href="${festival.festival_siteurl}" target="_blank"
											class="">사이트 바로가기</a>
										<div id="map"></div>	
											
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
	<script>
		// 위도와 경도 값을 가져옵니다
		var festivalLat = document.getElementById('festivalLat').value;
		var festivalLng = document.getElementById('festivalLng').value;

		// 지도를 표시할 div를 가져옵니다
		var mapContainer = document.getElementById('map');

		// 지도 옵션을 설정합니다
		var mapOption = { 
		    center: new kakao.maps.LatLng(festivalLat, festivalLng), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};

		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커 이미지 설정
		var imageSrc = '/images/festival/festivalMarker.png', // 마커이미지의 주소    
		    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기
		    imageOption = {offset: new kakao.maps.Point(27, 69)};

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(festivalLat, festivalLng); // 마커가 표시될 위치

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

	</script>
</body>

</html>
