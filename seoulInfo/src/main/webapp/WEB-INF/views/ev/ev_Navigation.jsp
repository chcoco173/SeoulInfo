<%@ page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		   <!-- 모바일 화면 확대 방지-->
		   <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
		 <meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
		 <meta content="width=device-width, initial-scale=1" name="viewport">
		 <meta content="Webflow" name="generator">
		 
		 <link href="/css/normalize.css" rel="stylesheet" type="text/css">
		 <link href="/css/webflow.css" rel="stylesheet" type="text/css">
		 <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">

		 <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
		 <link href="/images/webclip.png" rel="apple-touch-icon">
		 
		 <!-- EV setting -->
		 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		 <link href="/css/ev/evMain.css" rel="stylesheet" type="text/css">
		 
		 <!-- Bootstrap core CSS -->
		 <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	</head>

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
						<a href="/gu" class="nav-link w-nav-link">문화행사/뉴스</a>
						<a href="/member/login" class="nav-link w-nav-link">로그인/회원가입</a>
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
	</div><br/><hr/>

<table class="backToMain" style="width: 100%; text-align:center;">
    <tr>
        <td>
            <a href="/ev/evMain"><button class="filter btn btn-success" id="btnBackToMain" style="width:100%">돌아가기</button></a>
        </td>
    </tr>
</table>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>티맵 OpenAPI</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=B6cVULpkYQ5bwF3CIw3lF1YfFgRjCgYs9E0aFLuP"></script>
</head>
<body>
    <div id="map_div" style="width: 100%; height: 83%;"></div>
    <div>
        <input type="hidden" id="startx" />
        <input type="hidden" id="starty" />
        <input type="hidden" id="endx" />
        <input type="hidden" id="endy" />
		<div style="position:fixed; left:10px; top:50%; border: 1px solid black; border-radius : 10px; background-color:white;">
			<table style="margin:5px;">
				<tr>
					<td rowspan="2"><img src="/images/ev/nav_route.png" alt="경로 이미지" style="width:55px; height:auto; border-radius:0px; margin:5px;"></td>
		    		<td><input type="text" id="searchStartAddress" placeholder="출발지를 입력하세요." onchange="clickSearchPois('start');" style="padding-top:1%; padding-bottom:3%; margin-top:5px; width:70%;">
						<img src="/images/ev/etc_cafe.png" alt="getMyLocation">
					</td>
		    	</tr>
				<tr>
		    		<td style="padding-top:5px;"><input type="text" id="searchEndAddress" placeholder="목적지를 입력하세요." onchange="clickSearchPois('end');" style="padding-top:1%; padding-bottom:3%; width:70%"></td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top:5px;"><p style="font-size : 12px; text-align:center;"> ※ 충전소는 서울시 내의 정보만 표시됩니다.</p></td>
				</tr>	
			</table>
			<div id="result" style="margin-left:10px"></div>
			<button class="btn btn-primary" style="width:100%; border-radius: 0px 0px 10px 10px; border-top: 1px double black;" onclick="searchRoute();">경로 검색</button>
		</div>
    </div>
	<script>
	var map = new Tmapv2.Map("map_div", {
	    center: new Tmapv2.LatLng(37.54723135585498, 126.99680328369186),
	    zoom: 14,
	    httpsMode: true,
		maxZoom: 18 // 최대 줌 레벨
	});

	// 전역 변수로 폴리라인 배열 및 마커 변수들을 정의
	var routePolylines = [];
	var startMarker = null;
	var endMarker = null;
	var chargingStationMarkers = [];
	var infoWindow = null; // 인포윈도우 전역 변수

	function onKeyupSearchPoi(input) {
	    if (event.keyCode === 13) {
	        if (input.id === "searchStartAddress") {
	            clickSearchPois('start');
	        } else if (input.id === "searchEndAddress") {
	            clickSearchPois('end');
	        }
	    }
	}

	function clickSearchPois(type) {
	    var searchKeyword = type === 'start' ? $("#searchStartAddress").val() : $("#searchEndAddress").val();
	    var optionObj = {
	        resCoordType: "WGS84GEO",
	        reqCoordType: "WGS84GEO",
	        count: 10
	    };
	    var params = {
	        onComplete: function(result) {
	            var pois = result._responseData.searchPoiInfo.pois.poi;
	            if (pois.length > 0) {
	                var firstPoi = pois[0];
	                if (type === 'start') {
	                    $("#startx").val(firstPoi.frontLon);
	                    $("#starty").val(firstPoi.frontLat);
	                } else if (type === 'end') {
	                    $("#endx").val(firstPoi.frontLon);
	                    $("#endy").val(firstPoi.frontLat);
	                }
	            }
	        },
	        onProgress: function() {},
	        onError: function() {}
	    };
	    new Tmapv2.extension.TData().getPOIDataFromSearchJson(searchKeyword, optionObj, params);
	}

	function searchRoute() {
		sessionStorage.clear();
	    var startx = $("#startx").val();
	    var starty = $("#starty").val();
	    var endx = $("#endx").val();
	    var endy = $("#endy").val();
	    var startLatLng = new Tmapv2.LatLng(starty, startx);
	    var endLatLng = new Tmapv2.LatLng(endy, endx);
	    var optionObj = {
	        reqCoordType: "WGS84GEO",
	        resCoordType: "WGS84GEO",
	        trafficInfo: "Y"
	    };
	    var params = {
	        onComplete: function(result) {
	            var resultData = result._responseData.features;
	            var totalTime = (resultData[0].properties.totalTime / 60).toFixed(0) + "분";
	            var totalDistance = (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km";
	            $("#result").html("총 거리: " + totalDistance + ", 총 시간: " + totalTime);

	            // 기존 폴리라인 및 마커 제거
	            for (var i = 0; i < routePolylines.length; i++) {
	                routePolylines[i].setMap(null);
	            }
	            routePolylines = [];

	            if (startMarker) {
	                startMarker.setMap(null);
	            }
	            if (endMarker) {
	                endMarker.setMap(null);
	            }

	            for (var i = 0; i < chargingStationMarkers.length; i++) {
	                chargingStationMarkers[i].setMap(null);
	            }
	            chargingStationMarkers = [];

	            // 시작점 마커 추가
	            startMarker = new Tmapv2.Marker({
	                position: startLatLng,
	                map: map,
	                title: "Start Point",
	                icon: "/images/ev/nav_start.png" // 시작점 마커 아이콘 URL
	            });

	            // 도착점 마커 추가
	            endMarker = new Tmapv2.Marker({
	                position: endLatLng,
	                map: map,
	                title: "End Point",
	                icon: "/images/ev/nav_end.png" // 도착점 마커 아이콘 URL
	            });

	            var positionBounds = new Tmapv2.LatLngBounds();
	            var linePoints = [];
	            for (var i in resultData) {
	                var geometry = resultData[i].geometry;
	                if (geometry.type === "LineString") {
	                    for (var j in geometry.coordinates) {
	                        var latlng = new Tmapv2.LatLng(geometry.coordinates[j][1], geometry.coordinates[j][0]);
	                        linePoints.push(latlng);
	                        positionBounds.extend(latlng);
	                    }
	                    var polyline = new Tmapv2.Polyline({
	                        path: linePoints,
	                        strokeColor: "#FF0000",
	                        strokeWeight: 6,
	                        map: map
	                    });
	                    routePolylines.push(polyline);
	                }
	            }
	            map.panToBounds(positionBounds);

	            // 충전소 데이터 가져오기
	            getChargingStations(linePoints);
	        },
	        onProgress: function() {},
	        onError: function() {}
	    };
	    new Tmapv2.extension.TData().getRoutePlanJson(startLatLng, endLatLng, optionObj, params);
	}

	function getChargingStations(linePoints) {
	    var apiUrl = 'getNavMarker'; // 충전소 데이터를 가져오는 API URL
	    for (var i = 0; i < linePoints.length; i++) {
	        var point = linePoints[i];
	        var data = {
	            lat: point.lat(),
	            lon: point.lng(),
	            radius: 100 // 100m 반경
	        };

	        $.ajax({
	            url: apiUrl,
	            type: 'POST',
	            data: data,
	            success: function(response) {
	                console.log("충전소 데이터 응답:", response); // 응답 데이터 확인
	                for (var j in response) {
	                    var station = response[j];
	                    var markerPosition = new Tmapv2.LatLng(station.evc_lat, station.evc_long);
	                    var marker = new Tmapv2.Marker({
	                        position: markerPosition,
	                        map: map,
	                        title: station.evc_name,
							icon: "/images/ev/nav_ev.png"
	                    });

	                    // 마커 hover 이벤트 추가
	                    (function(marker, station) {
	                        marker.addListener("mouseover", function() {
	                            var content = '<div><strong>' + station.evc_name + '</strong><br>' +
	                                          'Address: ' + station.evc_address + '</div>';
	                            if (infoWindow) {
	                                infoWindow.setMap(null);
	                            }
	                            infoWindow = new Tmapv2.InfoWindow({
	                                position: marker.getPosition(),
	                                content: content,
	                                type: 2, // 2 - HTML content
	                                map: map
	                            });
	                        });
	                        marker.addListener("mouseout", function() {
	                            if (infoWindow) {
	                                infoWindow.setMap(null);
	                            }
	                        });
	                    })(marker, station);

	                    chargingStationMarkers.push(marker);
	                    console.log("충전소 마커 추가:", markerPosition); // 마커 추가 확인
	                }
	            },
	            error: function() {
	                console.error("충전소 데이터를 가져오는 데 실패했습니다.");
	            }
	        });
	    }
	}
	</script>
	<script>
		$(document).ready(function() {
		    // 세션 스토리지에서 값 가져오기
		    var festivalName = sessionStorage.getItem('festivalName');
		    var endx = sessionStorage.getItem('endx');
		    var endy = sessionStorage.getItem('endy');

		    // 폼에 값 설정하기
		    if (festivalName && endx && endy) {
		        $("#searchEndAddress").val(festivalName);
		        $("#endx").val(endx);
		        $("#endy").val(endy);
		    } else {
		        console.error('세션 스토리지에서 값을 가져오지 못했습니다.');
		    }

		    // Geolocation API를 사용하여 현재 위치 가져오기
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(function(position) {
		            var startx = position.coords.longitude; // 현재 위치의 경도
		            var starty = position.coords.latitude;  // 현재 위치의 위도

		            // 폼에 내 위치 정보 설정하기
		            $("#searchStartAddress").val("내 위치");
		            $("#startx").val(startx);
		            $("#starty").val(starty);
		        }, function(error) {
		            console.error("현재 위치를 가져오는데 실패했습니다: ", error);
		            alert('현재 위치를 가져오는 데 실패했습니다.');
		        });
		    } else {
		        alert('이 브라우저는 Geolocation을 지원하지 않습니다.');
		    }
		});
	</script>

</body>
</html>

