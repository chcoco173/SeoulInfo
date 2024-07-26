<%@ page contentType="text/html; charset=UTF-8"%>
hello

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>티맵 OpenAPI</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=B6cVULpkYQ5bwF3CIw3lF1YfFgRjCgYs9E0aFLuP"></script>
</head>
<body>
    <div id="map_div" style="width: 750px; height: 750px;"></div>
    <div>
        <input type="hidden" id="startx" />
        <input type="hidden" id="starty" />
        <input type="hidden" id="endx" />
        <input type="hidden" id="endy" />
        <div>
            <input type="text" id="searchStartAddress" placeholder="출발지를 입력하세요" onkeyup="onKeyupSearchPoi(this);">
            <button onclick="clickSearchPois('start');">검색</button>
            <input type="text" id="searchEndAddress" placeholder="목적지를 입력하세요" onkeyup="onKeyupSearchPoi(this);">
            <button onclick="clickSearchPois('end');">검색</button>
            <button onclick="searchRoute();">경로 검색</button>
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
