<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 모바일 화면 확대 방지-->
	<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
	<title>지도 생성하기</title>
	
	<!-- template default setting -->
	<meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	
	<link href="/css/normalize.css" rel="stylesheet" type="text/css">
	<link href="/css/webflow.css" rel="stylesheet" type="text/css">
	<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
	
	<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link href="/images/webclip.png" rel="apple-touch-icon">
	
	<!-- EV setting -->
	<link href="/css/ev/evMain.css" rel="stylesheet" type="text/css">
	
	<!-- 기존의 CSS 및 JavaScript 파일 포함 -->
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"	rel="stylesheet">
	<!-- Bootstrap JS (necessary for Bootstrap's JavaScript plugins) -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<style>
		#loading {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(255, 255, 255, 0.8);
			display: flex;
			justify-content: center;
			align-items: center;
			z-index: 9999;
			flex-direction: column;
		}
		
		.spinner-border {
			width: 3rem;
			height: 3rem;
			margin-bottom: 1rem;
		}
		
		.loading-text {
			font-size: 1.5rem;
			font-weight: bold;
		}
		
		/* CSS for dropdown */
		.dropdown-menu {
			background-color: white;
			border: 1px solid rgba(0, 0, 0, 0.15);
			border-radius: .25rem;
			box-shadow: 0 .5rem 1rem rgba(0, 0, 0, 0.175);
			display: none; /* Hide by default */
		}
		
		.dropdown-menu.show {
			display: block;
		}
		
		/* Additional styles if necessary */
		.dropdown-toggle {
			border: 1px solid #ccc;
			padding: 0.5rem 1rem;
			cursor: pointer;
		}
		
		.dropdown-item {
			padding: 0.5rem 1rem;
		}
	</style>
</head>
<body onload="initMap()">
	<!-- Overlay for black background -->
	<div class="overlay"></div>
	<!-- Delay for page loading -->
	<div id="loading">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
		<div class="loading-text">Loading . . .</div>
	</div>
	
	<!-- header navigation -->
	<div class="navigation-wrapper">
		<div data-animation="default" data-collapse="medium"
			data-duration="400" data-easing="ease" data-easing2="ease"
			role="banner" class="navbar_m w-nav">
			<div class="nav-wrapper">
				<a href="/" aria-current="page" class="brand w-nav-brand w--current">
					<img src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
					alt="">
				</a>
				<div class="links-and-search-wrapper">
					<%
						if (session.getAttribute("member") != null) {
					%>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/news/news?area=${sessionScope.member.member_area}"
							class="nav-link w-nav-link">뉴스</a> <a
							href="/festival/festival?area=${sessionScope.member.member_area}"
							class="nav-link w-nav-link">문화행사</a> <a href="/mypage/profile"
							class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
							class="nav-link w-nav-link">로그아웃</a>
					</nav>
					<%
						} else {
					%>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/gu" class="nav-link w-nav-link">문화행사/뉴스</a> <a
							href="/member/login" class="nav-link w-nav-link">로그인</a>
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
	<!-- end of header navigation -->

	<!-- kakao map API -->
	<div class="map_wrap after-loading">

		<!-- Service Buttons -->
		<div class="d-flex justify-content-center mt-4">
			<button class="btn btn-success mx-2" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDirections"
				aria-controls="offcanvasDirections"	style="width: 33%; height: 40px;"><a href="/ev/ev_Navigation">길찾기</a></button>
			<button class="btn btn-primary mx-2" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch"
				aria-controls="offcanvasSearch" style="width: 33%; height: 40px;">충전소 검색</button>
			<button class="btn btn-secondary btnShowFavorite mx-2" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasFavorites"
				aria-controls="offcanvasFavorites" style="width: 33%; height: 40px;">즐겨찾기</button>
		</div>

		<div>
			<div id="map"></div>
			<div id="dropdown-container" style="position: absolute; top: 10px; right: 10px; z-index: 100;">
				<div class="btn-group">
					<button class="btn btn-secondary" type="button"	data-bs-toggle="collapse" data-bs-target="#collapseMenu" aria-expanded="false" aria-controls="collapseMenu">지도 필터</button>
				</div>
				<div class="collapse" id="collapseMenu">
					<div class="card card-body">
						<ul class="list-unstyled">
							<li><a class="dropdown-item" href="#" data-bs-toggle="collapse" data-bs-target="#option1Content" aria-expanded="false" aria-controls="option1Content"> 옵션 1 </a>
								<div class="collapse mt-1" id="option1Content">
									<ul class="list-group">
										<li class="list-group-item">Sub Option 1</li>
										<li class="list-group-item">Sub Option 2</li>
										<li class="list-group-item">Sub Option 3</li>
									</ul>
								</div>
							</li>
							<li><a class="dropdown-item" href="#" data-bs-toggle="collapse" data-bs-target="#option2Content" aria-expanded="false" aria-controls="option2Content"> 옵션 2 </a>
								<div class="collapse mt-2" id="option2Content">
									<ul class="list-group">
										<li class="list-group-item">Sub Option 1</li>
										<li class="list-group-item">Sub Option 2</li>
										<li class="list-group-item">Sub Option 3</li>
									</ul>
								</div>
							</li>
							<li><a class="dropdown-item" href="#" data-bs-toggle="collapse" data-bs-target="#option3Content" aria-expanded="false" aria-controls="option3Content"> 옵션 3 </a>
								<div class="collapse mt-3" id="option3Content">
									<!-- convenience category Buttons -->
									<ul class="list-group">
										<li class="list-group-item" id="BK9" data-order="0"><span class="category_bg bank"></span>
											은행</li>
										<li class="list-group-item" id="MT1" data-order="1"><span class="category_bg mart"></span>
											마트</li>
										<li class="list-group-item" id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
											약국</li>
										<li class="list-group-item" id="OL7" data-order="3"><span class="category_bg oil"></span>
											주유소</li>
										<li class="list-group-item" id="CE7" data-order="4"><span class="category_bg cafe"></span>
											카페</li>
										<li class="list-group-item" id="CS2" data-order="5"><span class="category_bg store"></span>
											편의점</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- show diffrent map type-->
		<div id="map_show_type">
			<button class="btn btn-info" id="btnTerrain" data-enabled="false" onclick="setOverlayMapTypeId()">
			지형도</button>
		</div>
	</div>

	<!-- Offcanvas : 충전소 검색 -->
	<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasSearch" aria-labelledby="offcanvasSearchLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasSearchLabel">충전소 검색</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<form class="search-filter" id="searchForm" action="ev_MapFilter" method="post">
				<table class="table">
					<tr>
						<td>충전 타입</td>
						<td><select id="charger_type" name="charger_type" style="width: 95%">
								<option ${coordinate.charger_type eq '전체' ? 'selected' : ''}>
									전체</option>
								<option ${coordinate.charger_type eq 'AC3상' ? 'selected' : ''}>
									AC3상</option>
								<option ${coordinate.charger_type eq 'AC완속' ? 'selected' : ''}>
									AC완속</option>
								<option ${coordinate.charger_type eq 'DC차데모' ? 'selected' : ''}>
									DC차데모</option>
								<option
									${coordinate.charger_type eq 'DC차데모+AC3상' ? 'selected' : ''}>
									DC차데모+AC3상</option>
								<option
									${coordinate.charger_type eq 'DC차데모+AC3상+DC콤보' ? 'selected' : ''}>DC차데모+AC3상+DC콤보</option>
								<option
									${coordinate.charger_type eq 'DC차데모+DC콤보' ? 'selected' : ''}>
									DC차데모+DC콤보</option>
								<option ${coordinate.charger_type eq 'DC콤보' ? 'selected' : ''}>
									DC콤보</option></select>
						</td>
					</tr>
					<tr><td colspan="2"><hr></td></tr>
					<tr>
						<td>지역 선택</td>
						<td>
							<select id="evc_area" name="evc_area" class="form-select">
								<option ${coordinate.evc_area eq '전체' ? 'selected' : ''}>전체</option>
								<option ${coordinate.evc_area eq '강남구' ? 'selected' : ''}>강남구</option>
								<option ${coordinate.evc_area eq '강동구' ? 'selected' : ''}>강동구</option>
								<option ${coordinate.evc_area eq '강서구' ? 'selected' : ''}>강서구</option>
								<option ${coordinate.evc_area eq '강북구' ? 'selected' : ''}>강북구</option>
								<option ${coordinate.evc_area eq '관악구' ? 'selected' : ''}>관악구</option>
								<option ${coordinate.evc_area eq '광진구' ? 'selected' : ''}>광진구</option>
								<option ${coordinate.evc_area eq '구로구' ? 'selected' : ''}>구로구</option>
								<option ${coordinate.evc_area eq '금천구' ? 'selected' : ''}>금천구</option>
								<option ${coordinate.evc_area eq '노원구' ? 'selected' : ''}>노원구</option>
								<option ${coordinate.evc_area eq '동대문구' ? 'selected' : ''}>동대문구</option>
								<option ${coordinate.evc_area eq '도봉구' ? 'selected' : ''}>도봉구</option>
								<option ${coordinate.evc_area eq '동작구' ? 'selected' : ''}>동작구</option>
								<option ${coordinate.evc_area eq '마포구' ? 'selected' : ''}>마포구</option>
								<option ${coordinate.evc_area eq '서대문구' ? 'selected' : ''}>서대문구</option>
								<option ${coordinate.evc_area eq '성동구' ? 'selected' : ''}>성동구</option>
								<option ${coordinate.evc_area eq '성북구' ? 'selected' : ''}>성북구</option>
								<option ${coordinate.evc_area eq '서초구' ? 'selected' : ''}>서초구</option>
								<option ${coordinate.evc_area eq '송파구' ? 'selected' : ''}>송파구</option>
								<option ${coordinate.evc_area eq '영등포구' ? 'selected' : ''}>영등포구</option>
								<option ${coordinate.evc_area eq '용산구' ? 'selected' : ''}>용산구</option>
								<option ${coordinate.evc_area eq '양천구' ? 'selected' : ''}>양천구</option>
								<option ${coordinate.evc_area eq '은평구' ? 'selected' : ''}>은평구</option>
								<option ${coordinate.evc_area eq '종로구' ? 'selected' : ''}>종로구</option>
								<option ${coordinate.evc_area eq '중구' ? 'selected' : ''}>중구</option>
								<option ${coordinate.evc_area eq '중랑구' ? 'selected' : ''}>중랑구</option>
							</select>
						</td>
					</tr>
					<tr><td colspan="2"><hr></td></tr>
					<tr>
						<td>운영시설</td>
						<td><select id="charger_opbig" name="charger_opbig" class="form-select">
								<option ${coordinate.charger_opbig eq '전체' ? 'selected' : ''}>전체</option>
								<option ${coordinate.charger_opbig eq '환경부' ? 'selected' : ''}>환경부</option>
								<option ${coordinate.charger_opbig eq '타기관' ? 'selected' : ''}>타기관</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>검색</td>
						<td><select id="name" name="name" class="form-select">
								<option>전체</option>
								<option>${coordinate.charger_opsmall eq '운영기관명' ? 'selected' : ''}>운영기관명</option>
								<option>${coordinate.evc_name eq '충전소명' ? 'selected' : ''}>충전소명</option>
						</select> <input type="text" class="form-control mt-2" id="searchText" name="searchText" placeholder="검색어를 입력하세요."></td>
					</tr>
				</table>
				<div class="d-flex justify-content-between">
					<button type="submit" class="btn btn-primary btn-search w-50">검색</button>
					<button type="button" class="btn btn-danger btn-reset w-50">초기화</button>
				</div>
			</form>

			<!-- 결과가 출력될 div -->
			<div id="resultContainer" class="result-list" style="display: none;"></div>
		</div>
	</div>

	<!-- Offcanvas : 길찾기 -->
	<div class="offcanvas offcanvas-start" data-bs-scroll="true"
		tabindex="-1" id="offcanvasDirections"
		aria-labelledby="offcanvasDirectionsLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasDirectionsLabel">길찾기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<form id="directionsForm">
				<div class="form-group">
					<label for="startPoint">출발지</label> <input type="text"
						class="form-control" id="startPoint" placeholder="출발지를 입력하세요">
				</div>
				<div class="form-group">
					<label for="endPoint">도착지</label> <input type="text"
						class="form-control" id="endPoint" placeholder="도착지를 입력하세요">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">길찾기</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Offcanvas : 즐겨찾기 -->
	<div class="offcanvas offcanvas-start" data-bs-scroll="true"
		tabindex="-1" id="offcanvasFavorites"
		aria-labelledby="offcanvasFavoritesLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasFavoritesLabel">즐겨찾기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<%	if (session.getAttribute("member") != null) {	%>
			<div class="afterLogin"><dl id="userFavoriteList"></dl></div>
			<% } else { %>
			<div class="beforeLogin" style="text-align: center">
				<p>로그인 후 서비스 이용 가능</p>
				<a href="/member/login"><input type="button" value="로그인" class="login btn btn-primary"></a>
			</div>
			<% } %>
		</div>
	</div>
	<!-- end of kakao map API -->

	<div class="service_detail"><%@include file="./ev_Info.jsp"%><div>
		
	<!-- kakao map Script-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=008b79e594d7ab4e1058e1180ccf546c&libraries=clusterer"></script>
	<script>
		// session 값 받아오기 
		var sessionResult = '<c:out value="${sessionScope.member != null ? sessionScope.member.member_id : ''}" />';
		
		// ## delay 1 - 로딩 바 표시
		document.getElementById('loading').style.display = 'flex';
		
		// ########### 지도 생성 ############## 
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 4,
            maxLevel: 8 // 확대 최대 레벨
        };  
        var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 회원의 경우, 회원정보를 이용해 지도의 중심 좌표 변경
		if (sessionResult !=='') {
		    $.ajax({
		        url: 'getUserLocation', // 실제 사용자 정보 API의 URL로 대체
		        type: 'GET',
		        data: { member_id: sessionResult },
		        success: function(data) {
		            var userRegion = data.member_area;
		            var guCenters = {
		                "종로구": {lat: 37.573050, lng: 126.979189},
		                "중구": {lat: 37.563797, lng: 126.997314},
		                "용산구": {lat: 37.531100, lng: 126.981074},
		                "성동구": {lat: 37.563494, lng: 127.036693},
		                "광진구": {lat: 37.538577, lng: 127.082551},
		                "동대문구": {lat: 37.574371, lng: 127.039592},
		                "중랑구": {lat: 37.606324, lng: 127.092133},
		                "성북구": {lat: 37.589400, lng: 127.016645},
		                "강북구": {lat: 37.639751, lng: 127.025589},
		                "도봉구": {lat: 37.668763, lng: 127.046658},
		                "노원구": {lat: 37.654205, lng: 127.056792},
		                "은평구": {lat: 37.602889, lng: 126.929116},
		                "서대문구": {lat: 37.579308, lng: 126.936829},
		                "마포구": {lat: 37.566324, lng: 126.901491},
		                "양천구": {lat: 37.516951, lng: 126.866507},
		                "강서구": {lat: 37.550926, lng: 126.849750},
		                "구로구": {lat: 37.495403, lng: 126.887369},
		                "금천구": {lat: 37.456971, lng: 126.895533},
		                "영등포구": {lat: 37.526420, lng: 126.896916},
		                "동작구": {lat: 37.511274, lng: 126.939601},
		                "관악구": {lat: 37.478492, lng: 126.951291},
		                "서초구": {lat: 37.483575, lng: 127.032693},
		                "강남구": {lat: 37.517236, lng: 127.047325},
		                "송파구": {lat: 37.514575, lng: 127.105381},
		                "강동구": {lat: 37.530125, lng: 127.123761}
		            };
		            var centerCoordinates = guCenters[userRegion];
		            if (centerCoordinates) {
		                // 지도 중심 좌표 설정
		                map.setCenter(new kakao.maps.LatLng(centerCoordinates.lat, centerCoordinates.lng));
		            } else {
		                alert('해당 구의 좌표 정보를 찾을 수 없습니다.');
		            }
		        },
		        error: function() {
		            alert('사용자 정보를 가져오는 데 실패했습니다.');
		        }
		    });
		}
		
		// 마커/클러스터러 생성 : 각 DB data의 위도,경도를 forEach 문으로 마커정보 담기
        var positions = [
            <c:forEach var="coordinate" items="${evStationList}" varStatus="status">
                {
                    title: "${coordinate.evc_id}",
                    latlng: new kakao.maps.LatLng(${coordinate.evc_lat}, ${coordinate.evc_long})
                }
                <c:if test="${!status.last}">,</c:if>
            </c:forEach>];
		console.log(positions);

        var imageSrc = "/images/ev/ev_normal.png"; 
        var clickedImageSrc = "/images/ev/ev_click.png"; 

		var markers = [];
		var imageSize = new kakao.maps.Size(30, 30); 
		var currentClickedMarker = null;
		var circle = null;
		var locationMarkers = [];

		for (var i = 0; i < positions.length; i++) {        
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    var marker = new kakao.maps.Marker({
		        position: positions[i].latlng,
		        title: positions[i].title,
		        image: markerImage,
		        isClicked: false,
		    });

		    // 마커에 클릭 기능 넣어주기 
		    (function(marker) {
		        kakao.maps.event.addListener(marker, 'click', function() {
		            if (currentClickedMarker && currentClickedMarker !== marker) {
		                var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		                currentClickedMarker.setImage(originalImage);
		                currentClickedMarker.isClicked = false;
		            }

		            if (marker.isClicked) {
		                var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		                marker.setImage(originalImage);
		                marker.isClicked = false;
		                if (circle) {
		                    circle.setMap(null); // 원 삭제
		                    $('#distanceInfo').hide(); // 거리 정보 숨기기
		                }
		            } else {
		                var clickedImage = new kakao.maps.MarkerImage(clickedImageSrc, imageSize);
		                marker.setImage(clickedImage);
		                marker.isClicked = true;
		                currentClickedMarker = marker;

		                $('.overlay').show();
		                $('.overlay').css({'z-index':'1099'});
		                $('.charger_Information').show();
		                $(".charger_Information").css({"display":"inherit",'z-index':'1100'});

		                // AJAX 요청 보내기 - 마커에 해당하는 상세정보 불러오기
						$.ajax({
									                    url: 'ev_info',
									                    type: 'GET',
									                    data: { evc_id: marker.Gb },
									                    success: function(data) {
									                        console.log('data: ' + data);
									                        if (data.length > 0) {
									                            var chargerDetailsBody = $('#chargerDetailsBody');
									                            chargerDetailsBody.empty();
									                            data.forEach(function(charger) {
									                                var row = '<tr>';
									                                row += '<td><b id="charger_no" style="font-size:23px;">' + charger.charger_no + '</b></td>';
									                                row += '<td id="charger_mechine">' + charger.charger_mechine + '</td>';
									                                row += '<td class="charger_type">' + charger.charger_type + '</td>';
									                                row += '<td><span style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"><b id="charger_state">' + charger.charger_state + '</b></span><br><span>{(갱신한 시간)}</span></td>';
									                                row += '</tr>';
									                                chargerDetailsBody.append(row);
									                            });

									                            $('#evc_address').text(data[0].evc_address);
									                            $('.ev_name').text(data[0].evc_name);
									                            $('.evc_id').text(data[0].evc_id);
									                            $('#charger_facsmall').text(data[0].charger_facsmall);
									                            $('#charger_opsmall').text(data[0].charger_opsmall);
									                            $('#charger_userlimit').text(data[0].charger_userlimit);
																
																var img = $('#favoriteImage');
																var newImageUrl = '/images/ev/like_off.png';
																	img.attr('src', newImageUrl);
																	
									                            // 사용자 즐겨찾기 데이터와 비교하기
									                            if (sessionResult !== '') {
									                                var clickedEVID = marker.Gb;
									                                $.ajax({
									                                    url: 'ev_Favorite',
									                                    type: 'GET',
									                                    data: { member_id: sessionResult },
									                                    success: function(favoriteData) {
									                                        // favoriteData가 배열일 경우 처리
									                                        favoriteData.forEach(function(fav) {
									                                            if (fav.evc_id === clickedEVID) {
									                                                var img = $('#favoriteImage');
									                                                var newImageUrl = '/images/ev/like_on.png';
									                                                img.attr('src', newImageUrl);
									                                            }
									                                        });
									                                    },
									                                    error: function(err) {
									                                        $('#favoriteList').html('');
									                                        $('#favoriteList').show(); // 결과 영역 표시
									                                        console.error(err);
									                                    }
									                                });
									                            }
									                        }else {
																var chargerDetailsBody = $('#chargerDetailsBody');
																	chargerDetailsBody.empty();
																alert("no data found");
																$('.overlay').hide();
																$('.charger_Information').css({'display':'none','z-index':'-1'});
																
																var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
																	marker.setImage(originalImage);
																	marker.isClicked = false;
															}
									                    },
									                    error: function(err) {
									                        console.error("Error fetching charger info: ", err);
									                    }
									                }); // end of AJAX
		                
		                // 클릭한 마커를 중심으로 반경 1km 원 그리기
						if (circle) {
						    circle.setMap(null);
						}
						circle = new kakao.maps.Circle({
						    center: marker.getPosition(),
						    radius: 1000,
						    strokeWeight: 2,
						    strokeColor: '#75B8FA',
						    strokeOpacity: 0.4,
						    strokeStyle: 'solid',
						    fillColor: '#CFE7FF',
						    fillOpacity: 0.4
						});
						circle.setMap(map);

						var distance = 1;
						var walkingSpeed = 4;
						var cyclingSpeed = 15;
						var walkingTime = (distance / walkingSpeed) * 60;
						var cyclingTime = (distance / cyclingSpeed) * 60;
						var distanceInfoHtml = `
						    <div>
						        <p><strong>거리:</strong> 1km</p>
						        <p><strong>도보 시간:</strong> 약 ${walkingTime.toFixed(0)}분</p>
						        <p><strong>자전거 시간:</strong> 약 ${cyclingTime.toFixed(0)}분</p>
						    </div>`;
						$('#distanceInfo').html(distanceInfoHtml);
						$('#distanceInfo').show();
						$('#walkingTime').text(`도보: 약 ${walkingTime.toFixed(0)}분`);
						$('#cyclingTime').text(`자전거: 약 ${cyclingTime.toFixed(0)}분`);

						var circlePositions = [];
						//var locationMarkers = [];

						function clearMarkers() {
						    for (var i = 0; i < locationMarkers.length; i++) {
						        locationMarkers[i].setMap(null); // 지도에서 제거
						    }
						    locationMarkers = []; // 배열 초기화
						}


						// AJAX 호출
						$.ajax({
						    url: 'getCircleLocation',
						    type: 'GET',
						    data: {
						        centerLat: marker.getPosition().getLat(),
						        centerLng: marker.getPosition().getLng(),
						        radius: 1000
						    },
						    success: function(data) {
						        clearMarkers(); // 마커를 클리어
						        console.log(data); // 데이터 구조 확인
						        alert("success " + data.length + " checked.");

						        // 데이터 배열을 순회하면서 circlePositions 배열에 추가
						        data.forEach(function(item) {
						            circlePositions.push({
						                latlng: new kakao.maps.LatLng(item.etc_lat, item.etc_long), // LatLng 객체로 생성
						                title: item.etc_category
						            });
						        });

						        var imageSrcs = {
						            "카페": "/images/ev/etc_cafe.png",
						            "편의점": "/images/ev/etc_convini.png",
						            "슈퍼마켓": "/images/ev/etc_market.png",
						            "약국": "/images/ev/etc_pharmacy.png",
						            "주차장": "/images/ev/etc_parking.png"
						        };

						        var imageSize = new kakao.maps.Size(24, 24); // 이미지 크기 정의

						        if (circlePositions.length > 0) {
						            circlePositions.forEach(function(position) {
						                var imageSrc = imageSrcs[position.title] || "/images/ev/etc_parking.png";
						                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
						                var locationMarker = new kakao.maps.Marker({
						                    map: map,                              // 마커를 표시할 지도
						                    position: position.latlng,             // 마커를 표시할 위치
						                    title: position.title,                 // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						                    image: markerImage                     // 마커 이미지
						                });
						                locationMarkers.push(locationMarker);
						                console.log("Marker added at:", position.latlng.getLat(), position.latlng.getLng());
						            });
						        } else {
						            alert("원 안에 위치 정보가 없습니다.");
						        }
						    },
						    error: function(err) {
						        console.error("Error fetching locations: ", err);
						    }
						});
						}
						});

						        })(marker);
						        markers.push(marker);
						        console.log(marker);
						    }

						    var clusterer = new kakao.maps.MarkerClusterer({
						        map: map,
						        averageCenter: true,
						        minLevel: 4,
						        disableClickZoom: true
						    });

						    clusterer.addMarkers(markers);
//-----------------------------
						    kakao.maps.event.addListener(map, 'tilesloaded', function() {
						        document.getElementById('loading').style.display = 'none';
						    });
		
		// ######## 클러스터러 확대 이벤트 ##############
        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
            var level = map.getLevel() - 1;
            map.setLevel(level, { anchor: cluster.getCenter() });			
        });

		// ######## 서울 범위 밖에 이동 시, 중심 지로 이동하는 기능 ####################
        var seoulBounds = new kakao.maps.LatLngBounds(
            new kakao.maps.LatLng(37.113294, 126.034086),
            new kakao.maps.LatLng(37.915133, 128.169311)
        );

        kakao.maps.event.addListener(map, 'center_changed', function() {
            var center = map.getCenter();
            if (!seoulBounds.contain(center)) {
                map.setCenter(new kakao.maps.LatLng(37.5665, 126.9780));
                //alert("서울시 정보만 제공됩니다.");
            }
        });
		
		// ######## 지도 이미지 타입 변경 이벤트 ##############
        var mapTypes = {
            terrain: kakao.maps.MapTypeId.TERRAIN
        };

        function setOverlayMapTypeId() {
            var btnTerrain = document.getElementById('btnTerrain');
            var isTerrainEnabled = btnTerrain.getAttribute('data-enabled') === 'true';

            if (isTerrainEnabled) {
                map.removeOverlayMapTypeId(mapTypes.terrain);
                btnTerrain.setAttribute('data-enabled', 'false');
                btnTerrain.innerText = "지형도";
                btnTerrain.classList.remove('btn-warning');
                btnTerrain.classList.add('btn-info');
            } else {
                map.addOverlayMapTypeId(mapTypes.terrain);
                btnTerrain.setAttribute('data-enabled', 'true');
                btnTerrain.innerText = "이미지";
                btnTerrain.classList.remove('btn-info');
                btnTerrain.classList.add('btn-warning');
            }
        }
		
		//<!-- 충전소 검색-->
		$(document).ready(function() {
			$('#searchForm').on('submit', function(e) {
				e.preventDefault();
				$('.search-filter').css({'display':'none'});
				$.ajax({
					url: 'ev_MapFilter',
				    type: 'POST',
				    data: $(this).serialize(),
				    	success: function(data) {
				        $('#resultContainer').html(''); // 결과 영역 초기화
				        if (data && data.length > 0) {
				        	data.forEach(function(item) {
				            var resultHTML  =  '<dl id="filteredList" class="high-z-index">';
				            	resultHTML +=  '<dd>';
				                resultHTML +=      '<table class="filtered-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
				                resultHTML +=          '<tr>';
				                resultHTML +=              '<td rowspan="2"><img src="'+getImageUrl(item.charger_opsmall)+'" /></td>';
				                resultHTML +=              '<td colspan="2">' + item.evc_name + '</td>';
				                resultHTML +=          '</tr>';
				                resultHTML +=          '<tr>';
				                resultHTML +=              '<td><span style="font-size: 12px">' + item.charger_opsmall + '</span></td>';
				                resultHTML +=              '<td><span style="font-size: 12px">' + item.evc_area + '</span></td>';
				                resultHTML +=          '</tr>';
				                resultHTML +=      '</table>';
				                resultHTML +=      '<br>';
				                resultHTML +=  '</dd>';
				                resultHTML += '</dl>';
				        	$('#resultContainer').append(resultHTML);
							});
									
					        var paginationHTML = `
					        	<div class="filtered-list result-list-pagination" style="text-align: center; margin-top: 20px;">
					            <button type="button" class="btn btn-secondary" id="filtered-prevPage" disabled>이전</button>
					            <span id="filtered-pageInfo">1 / 1</span>
					            <button type="button" class="btn btn-secondary" id="filtered-nextPage">다음</button><hr>
					            <button type="button" class="btn btn-primary btn-back" style="width: 50%"><b>재검색</b></button>
					            </div>`;
					        $('#resultContainer').append(paginationHTML);
					        $('#resultContainer').show(); // 결과 영역 표시
	
					        // 페이징 기능
					        initializePagination();
					                    
					        // 재검색 버튼 이벤트
					        $(document).on('click', '.btn-back', function(event) {
					        	event.stopPropagation(); // 이벤트 전파 방지
					        	event.preventDefault();
					        	$('.search-filter').css({'display':'inherit'});
					        	$('.result-list').css({'display':'none'});
					        });
	
					        // 닫기 버튼 이벤트
					        $(document).on('click', '.btn-close', function(event) {
					        	event.stopPropagation(); // 이벤트 전파 방지
					            event.preventDefault();
					            $(".search_map").css({"display":"none"});
					            $(".search_navigation").css({"display":"none"});
					            $(".search_favorite").css({"display":"none"});
					                        
					            // 화면을 원래대로 복귀
					            $('.overlay').hide();
					            $('.overlay').css({'display':'none','z-index':'-1'});
					            $('.charger_Information').css({'display':'none','z-index':'-1'});
					        });                        
						} else {
							// 결과 없을 경우
				            $('#resultContainer').html('<p>검색 결과가 없습니다.</p>');
				            var paginationHTML = `
				            	<div class="filtered-list result-list-pagination" style="text-align: center; margin-top: 20px;">
				            	<button type="button" class="btn btn-secondary" id="filtered-prevPage" disabled>이전</button>
				            	<span id="filtered-pageInfo">1 / 1</span>
				            	<button type="button" class="btn btn-secondary" id="filtered-nextPage">다음</button><hr>
				            	<button type="button" class="btn btn-primary btn-back" style="width: 50%"><b>재검색</b></button>
				            	</div>`;
				            $('#resultContainer').append(paginationHTML);
				            $('#resultContainer').show(); // 결과 영역 표시    
				                    
				            // 재검색 버튼 이벤트
				            $(document).on('click', '.btn-back', function(event) {
				            	event.stopPropagation(); // 이벤트 전파 방지
				                event.preventDefault();
				                $('.search-filter').css({'display':'inherit'});
				                $('.result-list').css({'display':'none'});
				            });
						}
					},
				    error: function(err) {
				    	$('#resultContainer').html('');
				        $('#resultContainer').show(); // 결과 영역 표시
						console.log(err);
				    }
				});
			});

		// map moving smooth하게
		function panTo(lat, lng, level) {
			var moveLatLon = new kakao.maps.LatLng(lat, lng);
				map.panTo(moveLatLon);
				map.setLevel(level);
				        
			var markerImage = new kakao.maps.MarkerImage('/images/ev/ev_normal.png', new kakao.maps.Size(24, 24));
			var marker = new kakao.maps.Marker({
				position: moveLatLon,
				image: markerImage,
				title: title
			});
		}
		
		// 이미지 URL을 결정하는 함수
		function getImageUrl(chargerOpsmall) {
			switch(chargerOpsmall) {
				case '환경부(협회)':
					return '/images/ev/goverment-logo.png';
				case '한국전력':
					return '/images/ev/ev_opImg_korelec.png';
				case '한국전자금융':
				    return '/images/ev/ev_opImg_korelec.png';
				case '한국홈충전':
				    return '/images/ev/ev_opImg_korelec.png';
				case '한화솔루션':
				    return '/images/ev/hanhwa.png';
				case '해피차지':
				    return '/images/ev/ev_opImg.png';
				case '현대엔지니어링':
				    return '/images/ev/hyundai.png';
				case '현대오일뱅크':
				    return '/images/ev/hyundai.png';
				case '현대자동차':
				    return '/images/ev/hyundai.png';
				case '휴맥스이브이':
				    return '/images/ev/ev_opImg.png';
				case '한국전자금융':
				    return '/images/ev/ev_opImg.png';
				default:
				    return '/images/ev/charging-station.png';
			}
		}
				    
		// paging event function
		function initializePagination() {
			var itemsPerPage = 6; // 페이지당 보여줄 항목 수
			var currentPage = 1; // 현재 페이지
			var $filteredItems = $('#resultContainer dl'); // 필터링된 항목들
			var totalItems = $filteredItems.length; // 전체 항목 수
			var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수
			
			// 초기 페이지 로드
			function showPage(page) {
				$filteredItems.hide();
				$filteredItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
				$('#filtered-pageInfo').text(page + ' / ' + totalPages);
				$('#filtered-prevPage').prop('disabled', page === 1);
				$('#filtered-nextPage').prop('disabled', page === totalPages);
			}
				        
			$('#filtered-prevPage').click(function() {
				if (currentPage > 1) {
					currentPage--;
				    showPage(currentPage);
				}
			});
				        
			$('#filtered-nextPage').click(function() {
				if (currentPage < totalPages) {
					currentPage++;
				    showPage(currentPage);
				}
			});

			showPage(currentPage);
		}
	});
		// 상세정보 - 검색결과
		$(document).on('click', '.result-list-table', function() {
			var lat   = $(this).data('lat');
			var lng   = $(this).data('lng');
			var title = $(this).data('title');
			var evcId = $(this).data('id');
			
			$('.charger_Information').css({'display':'inherit', 'z-index':'1100'});
			$('.overlay').show();
			$('.overlay').css({'display':'inherit', 'z-index':'1090'});
			// AJAX 요청 보내기
			$.ajax({
				url: 'ev_info',
				type: 'GET',
				data: { evc_id: evcId },
				success: function(data) {
					console.log('data: ', data);
					// 데이터가 존재하는 경우
					if (data.length > 0) {
						var chargerDetailsBody = $('#chargerDetailsBody');
							chargerDetailsBody.empty(); // 기존 내용을 지움
						// 각 충전기 정보를 테이블에 추가
						data.forEach(function(charger) {
							var row = '<tr>';
								row += '<td><b id="charger_no" style="font-size:23px;">' + charger.charger_no + '</b></td>';
								row += '<td id="charger_mechine">' + charger.charger_mechine + '</td>';
								row += '<td class="charger_type">' + charger.charger_type + '</td>';
								row += '<td><span style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"><b id="charger_state">' + charger.charger_state + '</b></span><br><span>{(갱신한 시간)}</span></td>';
								row += '</tr>';
								chargerDetailsBody.append(row);
						});

						// 기타 정보 업데이트
						$('#evc_address').text(data[0].evc_address);
						$('.ev_name').text(data[0].evc_name);
						$('.evc_id').text(data[0].evc_id);
						$('#charger_facsmall').text(data[0].charger_facsmall);
						$('#charger_opsmall').text(data[0].charger_opsmall);
						$('#charger_userlimit').text(data[0].charger_userlimit);
						
						// 초기 이미지 설정 (즐겨찾기 해제 상태)
						var img = $('#favoriteImage');
						var newImageUrl = '/images/ev/like_off.png';
							img.attr('src', newImageUrl);

						// 사용자 즐겨찾기 데이터와 비교하여 이미지 업데이트
						if (sessionResult !== '') {
							var clickedEVID = evcId; // 클릭된 EVC ID
							$.ajax({
								url: 'ev_Favorite',
								type: 'GET',
								data: { member_id: sessionResult },
								success: function(favoriteData) {
									// favoriteData가 배열일 경우 처리
									favoriteData.forEach(function(fav) {
										if (fav.evc_id === clickedEVID) {
											var img = $('#favoriteImage');
											var newImageUrl = '/images/ev/like_on.png'; // 즐겨찾기 설정 상태 이미지
												img.attr('src', newImageUrl);
												console.log('Image updated successfully to ' + newImageUrl);
										}
									});
								},
								error: function(err) {
									console.error('AJAX request failed:', err);
								}
							});
						}
					} else {
						// 데이터가 없는 경우 처리
						var chargerDetailsBody = $('#chargerDetailsBody');
							chargerDetailsBody.empty(); // 기존 내용을 지움
							alert("No data found");
							$('.overlay').hide();
							$('.charger_Information').css({'display':'none','z-index':'-1'});
							
							// 원래 이미지로 복원
							var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
								marker.setImage(originalImage);
								marker.isClicked = false;
						}
					},
					error: function(err) {
					console.error("Error fetching charger info: ", err);
				}
			}); // end of AJAX
			panTo(lat, lng, 1, title);
		});
		
		// 즐겨찾기 - 버튼 클릭 이벤트
		$('.btnShowFavorite').click(function() {
		if (sessionResult !== '') {
			$.ajax({
				url: 'ev_Favorite',
				type: 'GET',
				data: { member_id: sessionResult },
				success: function(data) {
					$('#userFavoriteList').empty(); // 결과 영역 초기화
					if (data == null || data.length === 0) {
				    	$('#userFavoriteList').append('<p>검색 결과가 없습니다.</p>');
				    } else {
				        data.forEach(function(item) {
				        var resultHTML = '<dd>';
				        	resultHTML += '<table class="favorite-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
				        	resultHTML += '<tr>';
				        	resultHTML += '<td rowspan="2"><img src="/images/ev/goverment-logo.png" /></td>';
				        	resultHTML += '<td colspan="2">' + item.evc_name + '</td>';
				            resultHTML += '</tr>';
				            resultHTML += '<tr>';
				            resultHTML += '<td><span style="font-size: 12px">' + item.evc_address + '</span></td>';
				            resultHTML += '</tr>';
				            resultHTML += '</table>';
				            resultHTML += '<br>';
				            resultHTML += '</dd>';
							$('#userFavoriteList').append(resultHTML);
				    	});

						// 페이지네이션 HTML 추가
					    var paginationHTML = `
					    	<div class="favorite-list-pagination" style="text-align: center; margin-top: 20px;">
					        <button class="btn btn-secondary" id="favorite-prevPage" disabled>이전</button>
							<span id="favorite-pageInfo">1 / 1</span>
					        <button class="btn btn-secondary" id="favorite-nextPage">다음</button>
					        </div>`;
						$('#userFavoriteList').append(paginationHTML);

				    	initializeFavoritePagination();
					}
					$('#userFavoriteList').show(); // 결과를 표시
				},
				error: function(xhr, status, error) {
					$('#userFavoriteList').empty();
				    $('#userFavoriteList').append('<p>검색 결과를 가져오는 데 실패했습니다.</p>');
				    $('#userFavoriteList').show(); // 결과 영역 표시
				    console.error('AJAX 요청 실패:', status, error);
				}
			});
		} else {
			alert("이 기능은 회원가입 후 가능합니다.");
		}
	});

		// 페이지네이션 초기화 및 처리 함수
		function initializeFavoritePagination() {
			var itemsPerPage = 5; // 페이지당 보여줄 항목 수
			var currentPage = 1; // 현재 페이지
			var $favoriteItems = $('#userFavoriteList dd'); // 즐겨찾기 항목들
			var totalItems = $favoriteItems.length; // 전체 항목 수
			var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수

			function showPage(page) {
				$favoriteItems.hide(); // 모든 항목 숨기기
				$favoriteItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show(); // 현재 페이지 항목만 표시
				$('#favorite-pageInfo').text(page + ' / ' + totalPages); // 페이지 정보 업데이트
				$('#favorite-prevPage').prop('disabled', page === 1); // 이전 페이지 버튼 상태 업데이트
				$('#favorite-nextPage').prop('disabled', page === totalPages); // 다음 페이지 버튼 상태 업데이트
			}

			// 페이지 버튼 클릭 이벤트
			$('#favorite-prevPage').click(function() {
				if (currentPage > 1) {
					currentPage--;
					showPage(currentPage);
				}
			});

			$('#favorite-nextPage').click(function() {
				if (currentPage < totalPages) {
					currentPage++;
				    showPage(currentPage);
				}
			});

			// 닫기 버튼 클릭 이벤트
			$('.btn-close').click(function() {
				$("#userFavoriteList").hide(); // 즐겨찾기 목록 숨기기
			});

			// 초기 페이지 로드
			showPage(currentPage);
		}
		
		
	// ---- 즐겨 찾기 상세정보
	$(document).on('click', '.favorite-list', function() {
		var lat   = $(this).data('lat');
		var lng   = $(this).data('lng');
		var title = $(this).data('title');
		var evcId = $(this).data('id');
		
		$('.charger_Information').css({'display':'inherit', 'z-index':'1100'});
		$('.overlay').show();
		$('.overlay').css({'display':'inherit', 'z-index':'1090'});

		// AJAX 요청 보내기
		$.ajax({
			url: 'ev_info',
			type: 'GET',
			data: { evc_id: evcId },
			success: function(data) {
				console.log('data: ' + data);
				if (data.length > 0) {
					var chargerDetailsBody = $('#chargerDetailsBody');
					chargerDetailsBody.empty();
					data.forEach(function(charger) {
						var row = '<tr>';
							row += '<td><b id="charger_no" style="font-size:23px;">' + charger.charger_no + '</b></td>';
							row += '<td id="charger_mechine">' + charger.charger_mechine + '</td>';
							row += '<td class="charger_type">' + charger.charger_type + '</td>';
							row += '<td><span style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"><b id="charger_state">' + charger.charger_state + '</b></span><br><span>{(갱신한 시간)}</span></td>';
							row += '</tr>';
						chargerDetailsBody.append(row);
					});
					
				$('#evc_address').text(data[0].evc_address);
				$('.ev_name').text(data[0].evc_name);
				$('.evc_id').text(data[0].evc_id);
				$('#charger_facsmall').text(data[0].charger_facsmall);
				$('#charger_opsmall').text(data[0].charger_opsmall);
				$('#charger_userlimit').text(data[0].charger_userlimit);
																			
				var img = $('#favoriteImage');
				var newImageUrl = '/images/ev/like_on.png';
				img.attr('src', newImageUrl);
				
					// 사용자 즐겨찾기 데이터와 비교하기
					if (sessionResult !== '') {
					var clickedEVID = evcId;
						$.ajax({
							url: 'ev_Favorite',
							type: 'GET',
							data: { member_id: sessionResult },
							success: function(favoriteData) {
								// favoriteData가 배열일 경우 처리
								favoriteData.forEach(function(fav) {
									if (fav.evc_id === clickedEVID) {
										var img = $('#favoriteImage');
										var newImageUrl = '/images/ev/like_on.png';
										img.attr('src', newImageUrl);
									}
								});
												                                    },
							error: function(err) {
								$('#favoriteList').html('');
								$('#favoriteList').show(); // 결과 영역 표시
								console.error(err);
							}
						});
					}
				}else {
					var chargerDetailsBody = $('#chargerDetailsBody');
						chargerDetailsBody.empty();
					alert("no data found");
					$('.overlay').hide();
					$('.charger_Information').css({'display':'none','z-index':'-1'});
					
					var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					marker.setImage(originalImage);
					marker.isClicked = false;
				}
			},
			error: function(err) {
				console.error("Error fetching charger info: ", err);
			}
		}); // end of AJAX
		panTo(lat, lng, 1, title);
	});
									
		// 즐겨찾기 버튼 클릭
		$('.setFavorite').click(function(event) {
			var evcId = $('.evc_id').text();
			if(sessionResult === ''){
				alert("이 기능은 회원가입 후 가능합니다.");
			} else if($('#favoriteImage').attr('src') === '/images/ev/like_off.png'){
				// 빈 하트 이미지일 경우
				$.ajax({
					url: 'ev_FavoriteInsert',
					type: 'GET',
					data: {
						evc_id: evcId,
						member_id: sessionResult
					},
					success: function(){
						alert(sessionResult+"님의 즐겨찾기에 추가했습니다.");
						var img = $('#favoriteImage');
						var currentSrc = img.attr('src');
						var newImageUrl = (currentSrc === '/images/ev/like_off.png') ? '/images/ev/like_on.png' : '/images/ev/like_off.png';
						img.attr('src', newImageUrl);
					},
					error: function(err){
						console.error(err);
					}
				});
			}else if($('#favoriteImage').attr('src') === '/images/ev/like_on.png'){
				// 하트 이미지일 경우,
				$.ajax({			
					url: 'ev_FavoriteDelete',
					type: 'GET',
					data: {
						evc_id: evcId,
						member_id: sessionResult
					},
					success: function(){
						alert(sessionResult+"님의 즐겨찾기에서 삭제되었습니다.");
						var img = $('#favoriteImage');
						var currentSrc = img.attr('src');
						var newImageUrl = (currentSrc === '/images/ev/like_off.png') ? '/images/ev/like_on.png' : '/images/ev/like_off.png'; 
							img.attr('src', newImageUrl);
					},
					error: function(err){
						console.error(err);
					}
				});
			}
		});

		// map moving smooth
		function panTo(lat, lng, level, title) {
			var moveLatLon = new kakao.maps.LatLng(lat, lng);
				map.panTo(moveLatLon);
				map.setLevel(level);

			var markerImage = new kakao.maps.MarkerImage('/images/ev/ev_normal.png', new kakao.maps.Size(24, 24));
			var marker = new kakao.maps.Marker({
				position: moveLatLon,
				image: markerImage,
				title: title
			});
		}									
	</script>
	<!-- end of kakao map Script -->
	<script src="/js/webflow.js" type="text/javascript"></script>
	<script src="/js/evPage.js" type="text/javascript"></script>
</body>
</html>