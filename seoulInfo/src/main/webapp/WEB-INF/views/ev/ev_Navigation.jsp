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
<!-- Header navigation -->
<div class="navigation-wrapper">
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
            <a href="/" aria-current="page" class="brand w-nav-brand w--current">
                <img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt="">
            </a>
            <div class="links-and-search-wrapper">
                <nav role="navigation" class="nav-links-wrapper w-nav-menu">
                    <a href="/about" class="nav-link w-nav-link">About</a> 
                    <a href="/contact" class="nav-link w-nav-link">Contact</a>
                </nav>
                <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
                    <div class="search-div">
                        <img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
                    </div>
                    <div class="nav-search-outer-wrapper">
                        <div class="nav-search-internal-wrapper">
                            <input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                            <div class="search-button-wrapper">
                                <input type="submit" class="button-primary-small w-button" value="Search">
                                <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block">
                                    <img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>			
            <div class="menu-button w-nav-button">
                <img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
            </div>
        </div>
    </div>
</div><br/><hr/>
<!-- End of header navigation -->

<table class="backToMain" style="width: 100%; text-align:center;">
    <tr>
        <td style="width:100%">
            <a href="/ev/evMain"><button class="filter btn btn-success" id="btnBackToMain">돌아가기</button></a>
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
        <div style="position:fixed; left:10px; top:50%; border: 2px solid blue; border-radius : 10px;">
            <input type="text" id="searchStartAddress" placeholder="출발지를 입력하세요" onkeyup="onKeyupSearchPoi(this);" style="padding-top:1%; padding-bottom:3%;">
            <button class="btn btn-primary" onclick="clickSearchPois('start');">검색</button><br><br>
            <input type="text" id="searchEndAddress" placeholder="목적지를 입력하세요" onkeyup="onKeyupSearchPoi(this);" style="padding-top:1%; padding-bottom:3%;">
            <button class="btn btn-primary" onclick="clickSearchPois('end');">검색</button><hr>
            <button class="btn btn-warning" style="width:100%; border-radius:10px;" onclick="searchRoute();">경로 검색</button>
        </div>
        <div id="result"></div>
    </div>
    <script>
		
        var map = new Tmapv2.Map("map_div", {
            center: new Tmapv2.LatLng(37.54723135585498, 126.99680328369186),
            zoom: 14,
            httpsMode: true
        });

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

                    var positionBounds = new Tmapv2.LatLngBounds();
                    for (var i in resultData) {
                        var geometry = resultData[i].geometry;
                        if (geometry.type === "LineString") {
                            var linePoints = [];
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
                        }
                    }
                    map.panToBounds(positionBounds);
                },
                onProgress: function() {},
                onError: function() {}
            };
            new Tmapv2.extension.TData().getRoutePlanJson(startLatLng, endLatLng, optionObj, params);
        }
    </script>
</body>
</html>
