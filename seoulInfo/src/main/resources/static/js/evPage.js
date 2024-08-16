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

            clearRoute();

            startMarker = new Tmapv2.Marker({
                position: startLatLng,
                map: map,
                title: "Start Point",
                icon: "/images/ev/nav_start.png"
            });

            endMarker = new Tmapv2.Marker({
                position: endLatLng,
                map: map,
                title: "End Point",
                icon: "/images/ev/nav_end.png"
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

            getChargingStations(linePoints);
        },
        onProgress: function() {},
        onError: function() {}
    };
    new Tmapv2.extension.TData().getRoutePlanJson(startLatLng, endLatLng, optionObj, params);
}

function clearRoute() {
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
                for (var j in response) {
                    var station = response[j];
                    var markerPosition = new Tmapv2.LatLng(station.evc_lat, station.evc_long);
                    var marker = new Tmapv2.Marker({
                        position: markerPosition,
                        map: map,
                        title: station.evc_name,
                        icon: "/images/ev/nav_ev.png"
                    });

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
                                type: 2,
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
                }
            },
            error: function() {
                console.error("충전소 데이터를 가져오는 데 실패했습니다.");
            }
        });
    }
}

$(document).ready(function() {
    var festivalName = sessionStorage.getItem('festivalName');
    var endx = sessionStorage.getItem('endx');
    var endy = sessionStorage.getItem('endy');

    if (festivalName && endx && endy) {
        $("#searchEndAddress").val(festivalName);
        $("#endx").val(endx);
        $("#endy").val(endy);
    } else {
        console.error('세션 스토리지에서 값을 가져오지 못했습니다.');
    }

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var startx = position.coords.longitude;
            var starty = position.coords.latitude;

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
 // -----------------------------------
function getCurrentLocation(type) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            
            // startx, starty에 위도와 경도 값 설정
            if (type === 'start') {
                $("#startx").val(lng);
                $("#starty").val(lat);
            }

            // Tmap LatLng 객체 생성
            var startLatLng = new Tmapv2.LatLng(lat, lng);

            // 주소 변환을 위해 Tmap의 reverse geocoding 사용 (Tmap API를 사용한다고 가정)
            var headers = {}; 
            headers["appKey"] = "B6cVULpkYQ5bwF3CIw3lF1YfFgRjCgYs9E0aFLuP"; // Tmap에서 발급받은 appKey를 여기에 입력

            $.ajax({
                method: "GET",
                headers: headers,
                url: "https://apis.openapi.sk.com/tmap/geo/reversegeocoding",
                data: {
                    version: 1,
                    lat: lat,
                    lon: lng,
                    coordType: "WGS84GEO",
                    addressType: "A10"
                },
                success: function(response) {
                    var address = response.addressInfo.fullAddress;
                    if (type === 'start') {
                        $("#searchStartAddress").val(address);
                    }
                },
                error: function(request, status, error) {
                    console.error("Reverse Geocoding API error: " + error);
                }
            });
        }, function(error) {
            console.error('Error occurred. Error code: ' + error.code);
            // 에러 처리 (예: 사용자에게 위치 정보를 가져올 수 없다고 알리기)
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
}

