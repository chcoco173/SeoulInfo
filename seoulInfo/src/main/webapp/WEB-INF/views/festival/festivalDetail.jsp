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

<!-- 08/14 기진 bootstrap 추가-->	
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap/js/bootstrap.min.js"></script>



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
	    height: auto; /* 8/14 기진 css 수정 */
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
<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
.nav_wrap {position:relative;top:80px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #2962ff;overflow: hidden;z-index: 2; color:white;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
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
										            <span class="category_bg bank"></span>
										            전체
										        </li>       
										        <li id="etcCheck4" data-order="1"> 
										            <span class="category_bg mart"></span>
										            마트
										        </li>  
										        <li id="etcCheck5" data-order="2"> 
										            <span class="category_bg pharmacy"></span>
										            약국
										        </li>  
										        <li id="etcCheck3" data-order="4"> 
										            <span class="category_bg cafe"></span>
										            카페
										        </li>  
										        <li id="etcCheck2" data-order="5"> 
										            <span class="category_bg store"></span>
										            편의점
										        </li>      
										    </ul>
											</div>
											<div>
												<button type="button" class="btn btn-warning nav_wrap">길찾기 ▶</button>
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
	<script>
	    // 위도와 경도 값을 가져옵니다
	    var festivalLat = document.getElementById('festivalLat').value;
	    var festivalLng = document.getElementById('festivalLng').value;
		var festivalName = document.getElementById('festivalName').value;
	console.log(festivalLat+","+festivalLng+","+festivalName)
	    // 지도를 표시할 div를 가져옵니다
	    var mapContainer = document.getElementById('map');

	    // 지도 옵션을 설정합니다
	    var mapOption = { 
	        center: new kakao.maps.LatLng(festivalLat, festivalLng), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

	    // 지도를 생성합니다
	    var map = new kakao.maps.Map(mapContainer, mapOption);

	    // 마커 이미지 설정
	    var imageSrc = '/images/festival/festivalMarker.gif', // 마커이미지의 주소    
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
		marker.setZIndex(2);
		// 전역변수 설정
		var circlePositions = [];
		var locationMarkers = [];
	    // 위치 정보를 가져오는 AJAX 호출
	    $.ajax({
	        url: 'getCircleLocation',
	        type: 'GET',
	        data: {
	            centerLat: festivalLat,
	            centerLng: festivalLng,
	            radius: 1000 // 반경 1000m 내의 정보
	        },
	        success: function(data) {
	            

	            clearMarkers(); // 기존 마커를 초기화하는 함수 (정의 필요)
	            
	            data.forEach(function(item) {
	                circlePositions.push({
	                    latlng: new kakao.maps.LatLng(item.etc_lat, item.etc_long),
	                    title: item.etc_category,
	                    name: item.etc_name,
	                    address: item.etc_address
	                });
	            });

	            var imageSrcs = {
	                "카페": "/images/ev/etc_cafe.png",
	                "편의점": "/images/ev/etc_convini.png",
	                "슈퍼마켓": "/images/ev/etc_market.png",
	                "약국": "/images/ev/etc_pharmacy.png",
	                "주차장": "/images/ev/etc_parking.png"
	            };
	            var imageSize = new kakao.maps.Size(24, 24);

	            if (circlePositions.length > 0) {
	                circlePositions.forEach(function(position) {
	                    var imageSrc = imageSrcs[position.title] || "/images/ev/etc_parking.png";
	                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	                    var locationMarker = new kakao.maps.Marker({
	                        map: map,
	                        position: position.latlng,
	                        title: position.title,
	                        image: markerImage,
	                        name: position.name,
	                        address: position.address
	                    });
						locationMarker.setZIndex(1);
	                    // InfoWindow 설정
	                    var distance = getDistanceFromLatLonInMeters(marker.getPosition().getLat(), marker.getPosition().getLng(), position.latlng.getLat(), position.latlng.getLng());
	                    var iwContent = '';
	                    iwContent += '<div style="border-radius:10px; border: 1px solid black; background-color: #fff; box-shadow: 0px 0px 5px rgba(0,0,0,0.2); width: 200px; height: 150px;">';
	                    iwContent += '<div style="font-size:14px; border-radius:10px 10px 0px 0px; border-bottom: 1px solid black; font-weight:bold; background-color:yellowgreen; text-align:center;">';
	                    iwContent += '<b>' + (position.name || 'Unknown') + '</b></div>';
	                    iwContent += '<div style="margin:5px;">';
	                    iwContent += '<div style="font-size:12px;">' + formatAddress(position.address) + '</div><hr>';
	                    iwContent += '<div><span class="number" style="font-size:12px;">' + (position.title || 'Unknown') + '까지 직선거리 : ';
	                    iwContent += getTimeHTML(distance);
	                    iwContent += '</div>';
	                    iwContent += '</div>';

	                    var infoWindow = new kakao.maps.InfoWindow({
	                        content: iwContent,
	                        removable: true
	                    });
						infoWindow.setZIndex(3);
						// 마커 hover 이벤트 리스너 추가
		                var closeTimeout;
		                kakao.maps.event.addListener(locationMarker, 'click', function() {
		                    clearTimeout(closeTimeout); // 기존의 타이머가 있다면 제거합니다
		                    infoWindow.open(map, locationMarker); // 마커 위치에 InfoWindow를 엽니다
		                });

		                kakao.maps.event.addListener(locationMarker, 'mouseout', function() {
		                    closeTimeout = setTimeout(function() {
		                        infoWindow.close(); // InfoWindow를 닫습니다
		                    }, 1500); // 1.5초 후에 창을 닫습니다
		                });

	                    locationMarkers.push(locationMarker);
	                });
	            } else {
	                alert("원 안에 편의시설 정보가 없습니다.");
	            }
	        },
	        error: function(err) {
	            console.error("위치 정보 가져오기 오류: ", err);
	        }
	    });

	    // 지도 위의 기존 마커들을 초기화하는 함수
	    function clearMarkers() {
	        if (locationMarkers) {
	            locationMarkers.forEach(function(marker) {
	                marker.setMap(null); // 지도에서 마커 제거
	            });
	        }
	    }

	    // 위도, 경도 간의 거리 계산 함수 (Haversine Formula)
	    function getDistanceFromLatLonInMeters(lat1, lng1, lat2, lng2) {
	        var R = 6371e3; // 지구 반지름 (미터)
	        var dLat = (lat2 - lat1) * Math.PI / 180;
	        var dLng = (lng2 - lng1) * Math.PI / 180;
	        var a = 
	            Math.sin(dLat/2) * Math.sin(dLat/2) +
	            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * 
	            Math.sin(dLng/2) * Math.sin(dLng/2);
	        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	        var d = R * c;
	        return d;
	    }

	    // 주소 형식화 함수
	    function formatAddress(address) {
	        return address || '주소 정보 없음';
	    }

		function getTimeHTML(distance) {
			    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			    var walkkTime = distance / 67 | 0;
			    var walkHour = '', walkMin = '';

			    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			    if (walkkTime > 60) {
			        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 ';
			    }
			    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분';

			    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			    var bycicleTime = distance / 267 | 0;
			    var bycicleHour = '', bycicleMin = '';

			    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			    if (bycicleTime > 60) {
			        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 ';
			    }
			    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분';

			    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			    var content = '';
			    content += distance.toFixed(0) + '</span>m</div><table>';
			    content += '    <tr><td >';
			    content += '        <span class="label" >도보 : &nbsp;</span></td><td>' + walkHour + walkMin;
			    content += '    </td></tr>';
			    content += '    <tr><td >';
			    content += '        <span class="label">자전거 : &nbsp;</span></td><td>' + bycicleHour + bycicleMin;
			    content += '    </td></tr>';
			    content += '</table>';

			    return content;
			}
		
		function clearMarkers() {
	        for (var i = 0; i < locationMarkers.length; i++) {
	            locationMarkers[i].setMap(null); // 지도에서 제거
	        }
	        locationMarkers = []; // 배열 초기화
	    }

		// 편의시설 필터 - 버튼클릭 이벤트 리스너
			$('#etcCheckAll').click(function() {
			    onButtonClick(); // 카테고리 필터 없이 모든 데이터를 요청
			});
			
			$('#etcCheck2').click(function() {
			    onButtonClick('편의점');
			});

			$('#etcCheck3').click(function() {
			    onButtonClick('카페');
			});

			$('#etcCheck4').click(function() {
			    onButtonClick('슈퍼마켓');
			});

			$('#etcCheck5').click(function() {
			    onButtonClick('약국');
			});
			
			function onButtonClick(category) {
			    
			    fetchAndDisplayLocations(category);
			}
			
			function fetchAndDisplayLocations(category) {						
					$.ajax({
						url: 'getCircleLocation',
						type: 'GET',
						data: {
							centerLat: festivalLat,
							centerLng: festivalLng,
							radius: 1000,
							category: category
						},
						success: function(data) {
							console.log("서버 응답 데이터:", data);
							clearMarkers();
							var circlePositions = [];

							if (Array.isArray(data)) {
								data.forEach(function(item) {
									if (item.etc_lat && item.etc_long) {
								    	circlePositions.push({
								        	latlng: new kakao.maps.LatLng(parseFloat(item.etc_lat), parseFloat(item.etc_long)),
								            title: 	 item.etc_category,
								            name: 	 item.etc_name,
								            address: item.etc_address
								    	});
									}
								});

								var imageSrcs = {
									"카페": "/images/ev/etc_cafe.png",
								    "편의점": "/images/ev/etc_convini.png",
								    "슈퍼마켓": "/images/ev/etc_market.png",
								    "약국": "/images/ev/etc_pharmacy.png",
								    "주차장": "/images/ev/etc_parking.png"
								};
								
								var imageSize = new kakao.maps.Size(24, 24);

								if (circlePositions.length > 0) {
									console.log("마커 생성 시작:", circlePositions.length);

								    circlePositions.forEach(function(position, index) {
								    	var imageSrc = imageSrcs[position.title] || "/images/ev/etc_parking.png";
								        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
								        var locationMarker = new kakao.maps.Marker({
								        	map: map,
								            position: position.latlng,
								            title: 	  position.title ,
								            image: 	  markerImage,
											name: 	  position.name,
											address:  position.address
								        });

								        console.log(`마커 ${index} 생성:`, position.latlng.toString());

										var distance = getDistanceFromLatLonInMeters(marker.getPosition().getLat(), marker.getPosition().getLng(), position.latlng.getLat(), position.latlng.getLng());
										var iwContent = '';
										iwContent += '<div style="border-radius:10px; border: 1px solid black; background-color: #fff; box-shadow: 0px 0px 5px rgba(0,0,0,0.2); width: 200px; height: 150px;">';
										iwContent += '<div style="font-size:14px; border-radius:10px 10px 0px 0px; border-bottom: 1px solid black; font-weight:bold; background-color:yellowgreen; text-align:center;">';
										iwContent += '<b>' + (position.name || 'Unknown') + '</b></div>';
										iwContent += '<div style="margin:5px;">';
										iwContent += '<div style="font-size:12px;">' + formatAddress(position.address) + '</div><hr>';
										iwContent += '<div><span class="number" style="font-size:12px;">' + (position.title || 'Unknown') + '까지 직선거리 : ';
										iwContent += getTimeHTML(distance);
										iwContent += '</div>';
										iwContent += '</div>';
										
										// InfoWindow 인스턴스를 생성합니다
										var infoWindow = new kakao.maps.InfoWindow({
											content: iwContent,
											removable: true
										});
										
										infoWindow.setZIndex(3);
										// 마커 hover 이벤트 리스너 추가
						                var closeTimeout;
						                kakao.maps.event.addListener(locationMarker, 'click', function() {
						                    clearTimeout(closeTimeout); // 기존의 타이머가 있다면 제거합니다
						                    infoWindow.open(map, locationMarker); // 마커 위치에 InfoWindow를 엽니다
						                });

						                kakao.maps.event.addListener(locationMarker, 'mouseout', function() {
						                    closeTimeout = setTimeout(function() {
						                        infoWindow.close(); // InfoWindow를 닫습니다
						                    }, 1500); // 1.5초 후에 창을 닫습니다
						                });
										
								        locationMarkers.push(locationMarker);
									});

									console.log("마커 생성 완료:", locationMarkers.length);
								}
							}
						},
						error: function(err) {
							console.error("위치 정보 가져오기 오류: ", err);
						}
					});
				}
			
		$('.nav_wrap').click(function() {
		    // 세션 스토리지에 데이터 저장
		    sessionStorage.setItem('festivalName', festivalName);
		    sessionStorage.setItem('endx', festivalLng);
		    sessionStorage.setItem('endy', festivalLat);

		    // 페이지 이동
		    window.location.href = "/ev/ev_Navigation";
		});
	</script>

</body>

</html>
