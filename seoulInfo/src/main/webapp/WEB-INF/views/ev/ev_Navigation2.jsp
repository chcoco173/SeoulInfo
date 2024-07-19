<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>티맵 OpenAPI</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=B6cVULpkYQ5bwF3CIw3lF1YfFgRjCgYs9E0aFLuP"></script>
</head>
<body>
    <div id="map_div">
		<input type="hidden" id="searchAddress" />
		        <input type="hidden" id="startx" />
		        <input type="hidden" id="starty" />
		        <input type="hidden" id="endx" />
		        <input type="hidden" id="endy" />

		        <div class="_map_layer_overlay">
		            <div class="__space_15_h"></div>
		            <div class="_map_overlay_row">
		                <input type="text" id="searchStartAddress" class="_search_entry _search_entry_short" placeholder="출발지를 입력하세요" onkeyup="onKeyupSearchPoi(this);">
		                <button onclick="clickSearchPois(this);" class="_search_address_btn" style="margin-top: 14px; margin-bottom: 14px; pointer-events: all; cursor: pointer;">
		                </button>
		                <div class="__space_13_w"></div>
		                <input type="text" id="searchEndAddress" class="_search_entry _search_entry_short" placeholder="목적지를 입력하세요" onkeyup="onKeyupSearchPoi(this);">
		                <button onclick="clickSearchPois(this);" class="_search_address_btn" style="margin-top: 14px; margin-bottom: 14px; pointer-events: all; cursor: pointer;">
		                </button>
		                <div class="__space_10_w"></div>
		                <div class="_btn_action _btn_action-search __color_grey" onclick="apiSearchRoutes();">검색</div>
		            </div>
		            <div id="wpList">
		                <div class="__space_10_h"></div>
		                <div class="waypoint_input _map_overlay_row" data-idx="0">
		                    <input type="hidden" name="multipos" />
		                    <input type="text" class="_search_entry _search_entry_short" onkeyup="onKeyupSearchPoi(this);" placeholder="경유지를 입력하세요.">
		                    <button onclick="clickSearchPois(this);" class="_search_address_btn" style="margin-top: 14px; margin-bottom: 14px; pointer-events: all; cursor: pointer;"></button>
		                    <div style="width: 90px;"></div>
		                    <!-- <button onclick="onMultiButton(this);" class="_search_address_btn" style="margin-top: 14px; margin-bottom: 14px; pointer-events: all; cursor: pointer;"></button> -->
		                </div>
		            </div>
		            <div class="__flex_expand"></div>
		            <div id="apiResult" class="_map_overlay_row">
		                <div class="_result_panel_bg ">
		                    <div class="_result_panel">
		                            
		                        <div class="__disable_text"> 경로 API 선택 시, 장소 API의 기본 항목이 자동으로 활성화 됩니다. </div>
		                        <div class="__disable_text"> API를 선택해 주세요. </div>
		                                            </div>
		                </div>
		            </div>
		        </div>
	</div>
	
    <script>
         var map = new Tmapv2.Map("map_div", { // 지도가 생성될 div
            center: new Tmapv2.LatLng(37.54723135585498, 126.99680328369186),    // 지도의 중심좌표
            width : "750px", // 지도의 넓이
            height : "750px", // 지도의 높이
            zoom : 14, // 지도의 줌레벨
            httpsMode: true,    // https모드 설정
        });

        //지도 타입 변경.
        function MapType(type){
            if("ROAD" == type){
                // 기본 지도
                map.setMapType(Tmapv2.Map.MapType.ROAD);
            } else if("SATELLITE" == type){
                // 위성 지도
                map.setMapType(Tmapv2.Map.MapType.SATELLITE);
            } else if("HYBRID" == type){
                // 통합 지도
                map.setMapType(Tmapv2.Map.MapType.HYBRID);
            }
        }
        
        // (장소API) 주소 찾기
        map.addListener("click", function onClick(evt) {
            var mapLatLng = evt.latLng;

            var markerPosition = new Tmapv2.LatLng(
                    mapLatLng._lat, mapLatLng._lng);
            //마커 올리기
            marker1 = new Tmapv2.Marker({
                position : markerPosition,
                icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png",
                iconSize : new Tmapv2.Size(24, 38),
                map : map
            });

            var lon = mapLatLng._lng;
            var lat = mapLatLng._lat;
           
            var optionObj = {
                coordType: "WGS84GEO",       //응답좌표 타입 옵션 설정 입니다.
                addressType: "A10"           //주소타입 옵션 설정 입니다.
            };
            var params = {
                onComplete:function(result) { //데이터 로드가 성공적으로 완료 되었을때 실행하는 함수 입니다.
                    var arrResult = result._responseData.addressInfo;

                    var fullAddress = arrResult.fullAddress.split(",");
                    var newRoadAddr = fullAddress[2];
                    var jibunAddr = fullAddress[1];
                    if (arrResult.buildingName != '') {//빌딩명만 존재하는 경우
                        jibunAddr += (' ' + arrResult.buildingName);
                    }

                    result = "새주소 : " + newRoadAddr;
                    result += "지번주소 : " + jibunAddr;
                    result += "좌표(WSG84) : " + lat + ", " + lon;
                    console.log(result);
                },      
                onProgress:function() {},   //데이터 로드 중에 실행하는 함수 입니다.
                onError:function() {        //데이터 로드가 실패했을때 실행하는 함수 입니다.
                    alert("onError");
                }             
            };
            tData.getAddressFromGeoJson(lat, lon, optionObj, params);
        });

        // (장소API) 통합 검색 함수
        function searchPois() {
            var searchKeyword = $("#searchAddress").val();

            var optionObj = {
                resCoordType : "WGS84GEO",
                reqCoordType : "WGS84GEO",
                count: 10
            };

            var params = {
                onComplete: function(result) {
                    // 데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트입니다.
                    var resultpoisData = result._responseData.searchPoiInfo.pois.poi;

                    var innerHtml ="";    // Search Reulsts 결과값 노출 위한 변수
                    var positionBounds = new Tmapv2.LatLngBounds();        //맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
                    
                    for(var k in resultpoisData){
                        // POI 정보의 ID
                        var id = resultpoisData[k].id;
                        
                        var name = resultpoisData[k].name;
                        
                        var lat = Number(resultpoisData[k].noorLat);
                        var lon = Number(resultpoisData[k].noorLon);
                        
                        var frontLat = Number(resultpoisData[k].frontLat);
                        var frontLon = Number(resultpoisData[k].frontLon);

                        var markerPosition = new Tmapv2.LatLng(lat, lon);
                        
                        var fullAddressRoad = resultpoisData[k].newAddressList.newAddress[0].fullAddressRoad;
                        
                        var marker2 = new Tmapv2.Marker({
                            position : markerPosition,
                            icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png",
                            iconSize : new Tmapv2.Size(24, 38),
                            title : name,
                            map:map
                        });
                        
                        innerHtml += "<li><img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png' style='vertical-align:middle;'/><span>"+name+
                            "</span><br><span>"+fullAddressRoad+
                            "</span><br><span>중심점: "+lat+","+lon+
                            "</span><br><span>입구점: "+frontLat+","+frontLon+
                            "</span></li>"+
                        
                        markerArr.push(marker2);
                        positionBounds.extend(markerPosition);    // LatLngBounds의 객체 확장
                    }
                    innerHtml = "<ul>"+innerHtml+"</ul>";
                    $("#apiResult").html(innerHtml);    //searchResult 결과값 노출
                    map.panToBounds(positionBounds);    // 확장된 bounds의 중심으로 이동시키기
                    map.zoomOut();
                },
                onProgress: function() {},
                onError: function(){}
            }
            tData.getPOIDataFromSearchJson(searchKeyword, optionObj, params);
        }    

        // POI 상세검색 함수
        function poiDetail(poiId) {
            var optionObj = {
                resCoordType: "WGS84GEO"
            }
            var params = {
                onComplete: function(result) {
                    // 응답받은 POI 정보
                    var detailInfo = result._responseData.poiDetailInfo;

                    var name = detailInfo.name;
                    var bldAddr = detailInfo.bldAddr;
                    var tel = detailInfo.tel;
                    var bizCatName = detailInfo.bizCatName;
                    var parkingString = (detailInfo.parkFlag === "0"? "주차 불가능": (detailInfo.parkFlag === "1" ? "주차 가능": ""));
                    var zipCode = detailInfo.zipCode;
                    var lat = Number(detailInfo.frontLat);
                    var lon = Number(detailInfo.frontLon);

                    var bldNo1 = detailInfo.bldNo1;
                    var bldNo2 = detailInfo.bldNo2;
        
                    var labelPosition = new Tmapv2.LatLng(lat, lon);
                    
                    if(bldNo1 !== "") {
                        bldAddr += ` ${bldNo1}`;
                    }
                    if(bldNo2 !== "") {
                        bldAddr += `-${bldNo2}`;
                    }
        
                    // 상세보기 클릭 시 지도에 표출할 popup창
                    var content = "<div style=' border-radius:10px 10px 10px 10px;background-color:#2f4f4f; position: relative;"
                            + "line-height: 15px; padding: 5 5px 2px 4; right:65px; width:150px; padding: 5px;'>"
                            + "<div style='font-size: 11px; font-weight: bold ; line-height: 15px; color : white'>"
                            + name
                            + "</br>"
                            + bldAddr 
                            + "</br>"
                            + zipCode
                            + "</br>"
                            + bizCatName;
                            
                    if(tel !== "") {
                        content += "</br>"+ tel;
                    }
                    if(parkingString !== "") {
                        content += "</br>"+ parkingString;
                    }
                    
                    content += "</div></div>";
                
                    var labelInfo2 = new Tmapv2.Label({
                        position : labelPosition,
                        content : content,
                        map : map
                    });
                    //popup 생성
        
                    // popup들을 담을 배열에 팝업 저장
                    labelArr.push(labelInfo2);
                    
                    map.setCenter(labelPosition);
                },
                onProgress: function() {},
                onError: function() {}
            }
            tData.getPOIDataFromIdJson(poiId,optionObj, params);
        }

        // (경로API) 보행자 경로 안내 API
        function routesPedestrian() {
            return new Promise(function(resolve, reject) {
                // 출발지, 목적지의 좌표를 조회
                var startx = $("#startx").val();
                var starty = $("#starty").val();
                var endx = $("#endx").val();
                var endy = $("#endy").val();

                var startLatLng = new Tmapv2.LatLng(starty, startx);
                var endLatLng = new Tmapv2.LatLng(endy, endx);

                var optionObj = {
                    reqCoordType: "WGS84GEO",
                    resCoordType: "WGS84GEO"
                };

                var params = {
                    onComplete: function (result) {
                        var resultData = result._responseData.features;

                        //결과 출력
                        var appendHtml = "보행자 경로안내: 총 거리 : " + ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km,";
                        appendHtml += " 총 시간 : " + ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";

                        console.log(appendHtml);

                        if (drawMode === "apiRoutesPedestrian") {
                            // 시작마커설정
                            var marker_s = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(starty, startx),
                                icon: "http://topopen.tmap.co.kr/imgs/start.png",
                                iconSize: new Tmapv2.Size(24, 38),
                                map: map
                            });

                            // 도착마커설정
                            var marker_e = new Tmapv2.Marker({
                                position: new Tmapv2.LatLng(endy, endx),
                                icon: "http://topopen.tmap.co.kr/imgs/arrival.png",
                                iconSize: new Tmapv2.Size(24, 38),
                                map: map
                            });
                            markerArr.push(marker_s);
                            markerArr.push(marker_e);

                            // GeoJSON함수를 이용하여 데이터 파싱 및 지도에 그린다.
                            var jsonObject = new Tmapv2.extension.GeoJSON();
                            var jsonForm = jsonObject.read(result._responseData);

                            jsonObject.drawRoute(map, jsonForm, {}, function (e) {
                                // 경로가 표출된 이후 실행되는 콜백 함수.

                                for (var m of e.markers) {
                                    markerArr.push(m);
                                }
                                for (var l of e.polylines) {
                                    lineArr.push(l);
                                }

                                var positionBounds = new Tmapv2.LatLngBounds(); //맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
                                for (var polyline of e.polylines) {
                                    for (var latlng of polyline.getPath().path) {
                                        positionBounds.extend(latlng);  // LatLngBounds의 객체 확장
                                    }
                                }

                                map.panToBounds(positionBounds);
                                map.zoomOut();
                            });

                        }
                        resolve();
                    },
                    onProgress: function () {
                    },
                    onError: function () {
                    }
                };

                tData.getRoutePlanForPeopleJson(startLatLng, endLatLng, "출발지", "도착지", optionObj, params);
            });
        }
        
        // (경로API) 자동차 경로(경유지) 안내 API
        /* 
        mode: 
        - 0: 교통최적+추천(기본값)
        - 1: 교통최적+무료우선
        - 2: 교통최적+최소시간
        - 3: 교통최적+초보
        - 4: 교통최적+고속도로우선
        - 10: 최단거리+유/무료
        - 12: 이륜차도로우선
        - 19: 교통최적+어린이보호구역 회피
        */
        function routesCar(mode) {
            // 출발지, 목적지의 좌표를 조회
            var startx = $("#startx").val();
            var starty = $("#starty").val();
            var endx = $("#endx").val();
            var endy = $("#endy").val();

            var modes = {
                0: "교통최적+추천(기본값)",
                1: "교통최적+무료우선",
                2: "교통최적+최소시간",
                3: "교통최적+초보",
                4: "교통최적+고속도로우선",
                10: "최단거리+유/무료",
                12: "이륜차도로우선",
                19: "교통최적+어린이보호구역 회피"
            }

            // 경유지 좌표 파라미터 생성
            var viaPoints = [];
            $("ul#multiInput li").each(function(idx) {
                var pos = $(this).find("input[name='multipos']").val();
                if(pos === "") {
                    return true;
                }
                var viaX = pos.split(',')[0];
                var viaY = pos.split(',')[1];
                viaPoints.push(viaX + "," + viaY);
            });
            var passList = viaPoints.join("_");

            var s_latlng = new Tmapv2.LatLng (starty, startx);
            var e_latlng = new Tmapv2.LatLng (endy, endx);

            var optionObj = {
                reqCoordType:"WGS84GEO", //요청 좌표계 옵셥 설정입니다.
                resCoordType:"WGS84GEO",  //응답 좌표계 옵셥 설정입니다.
                trafficInfo:"Y",
                passList: passList,
                searchOption: mode
            };

            var params = {
                onComplete: function(result) {
                    var resultData = result._responseData.features;
                    var appendHtml = "<span>"+modes[mode]+"</span>: ";
                    appendHtml += (resultData[0].properties.totalTime / 60).toFixed(0) + "분 | ";
                    appendHtml += (resultData[0].properties.totalDistance / 1000).toFixed(1) + "km | ";
                    appendHtml += resultData[0].properties.totalFare + "원 | ";
                    appendHtml += "택시 "+ resultData[0].properties.taxiFare + "원";
                    console.log(appendHtml);

                    if(drawMode === "apiRoutesCar_" + mode || drawMode === "apiRoutesMulti_" + mode) {
                        var positionBounds = new Tmapv2.LatLngBounds(); //맵에 결과물 확인 하기 위한 LatLngBounds객체 생성

                        for ( var i in resultData) { //for문 [S]
                            var geometry = resultData[i].geometry;
                            var properties = resultData[i].properties;

                            if (geometry.type == "LineString") {
                                //교통 정보도 담음
                                // chktraffic.push(geometry.traffic);
                                var sectionInfos = [];
                                var trafficArr = geometry.traffic || [];

                                for ( var j in geometry.coordinates) {
                                    var latlng = new Tmapv2.LatLng(geometry.coordinates[j][1], geometry.coordinates[j][0]);
                                    positionBounds.extend(latlng);  // LatLngBounds의 객체 확장
                                    sectionInfos.push(latlng);
                                }

                                drawLine(sectionInfos, trafficArr);
                            } else {

                                var markerImg = "";
                                var pType = "";

                                if (properties.pointType == "S") { //출발지 마커
                                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                                    pType = "S";
                                } else if (properties.pointType == "E") { //도착지 마커
                                    markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                                    pType = "E";
                                } else { //각 포인트 마커
                                    markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                                    pType = "P"
                                }

                                var latlon = new Tmapv2.LatLng(
                                        geometry.coordinates[1],
                                        geometry.coordinates[0]);

                                var routeInfoObj = {
                                    markerImage : markerImg,
                                    lng : latlon._lng,
                                    lat : latlon._lat,
                                    pointType : pType
                                };
                                // 마커 추가
                                addMarkers(routeInfoObj);
                            }
                        }//for문 [E]

                        map.panToBounds(positionBounds);
                        map.zoomOut();
                    }
                },
                onProgress: function() {},
                onError: function() {}
            };
            tData.getRoutePlanJson(s_latlng, e_latlng, optionObj, params);
        }

        //마커 생성하기
        function addMarkers(infoObj) {
            var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.
    
            if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
                size = new Tmapv2.Size(8, 8);
            }
    
            marker_p = new Tmapv2.Marker({
                position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
                icon : infoObj.markerImage,
                iconSize : size,
                map : map
            });
    
            markerArr.push(marker_p);
        }

        //라인그리기
        function drawLine(arrPoint, traffic) {
            var polyline_;
    
            // 교통정보 혼잡도를 체크
            // strokeColor는 교통 정보상황에 다라서 변화
            // traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

            var lineColor = "";

            if (traffic != "0") {
                if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시

                    lineColor = "#06050D";
                    //라인그리기[S]
                    polyline_ = new Tmapv2.Polyline({
                        path : arrPoint,
                        strokeColor : lineColor,
                        strokeWeight : 6,
                        map : map
                    });
                    lineArr.push(polyline_);
                    //라인그리기[E]
                } else { //교통정보가 있음

                    if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
                        var trafficObject = "";
                        var tInfo = [];

                        for (var z = 0; z < traffic.length; z++) {
                            trafficObject = {
                                "startIndex" : traffic[z][0],
                                "endIndex" : traffic[z][1],
                                "trafficIndex" : traffic[z][2],
                            };
                            tInfo.push(trafficObject)
                        }

                        var noInfomationPoint = [];

                        for (var p = 0; p < tInfo[0].startIndex; p++) {
                            noInfomationPoint.push(arrPoint[p]);
                        }

                        //라인그리기[S]
                        polyline_ = new Tmapv2.Polyline({
                            path : noInfomationPoint,
                            strokeColor : "#06050D",
                            strokeWeight : 6,
                            map : map
                        });
                        //라인그리기[E]
                        lineArr.push(polyline_);

                        for (var x = 0; x < tInfo.length; x++) {
                            var sectionPoint = []; //구간선언

                            for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                                sectionPoint.push(arrPoint[y]);
                            }

                            if (tInfo[x].trafficIndex == 0) {
                                lineColor = "#06050D";
                            } else if (tInfo[x].trafficIndex == 1) {
                                lineColor = "#61AB25";
                            } else if (tInfo[x].trafficIndex == 2) {
                                lineColor = "#FFFF00";
                            } else if (tInfo[x].trafficIndex == 3) {
                                lineColor = "#E87506";
                            } else if (tInfo[x].trafficIndex == 4) {
                                lineColor = "#D61125";
                            }

                            //라인그리기[S]
                            polyline_ = new Tmapv2.Polyline({
                                path : sectionPoint,
                                strokeColor : lineColor,
                                strokeWeight : 6,
                                map : map
                            });
                            //라인그리기[E]
                            lineArr.push(polyline_);
                        }
                    } else { //0부터 시작하는 경우

                        var trafficObject = "";
                        var tInfo = [];

                        for (var z = 0; z < traffic.length; z++) {
                            trafficObject = {
                                "startIndex" : traffic[z][0],
                                "endIndex" : traffic[z][1],
                                "trafficIndex" : traffic[z][2],
                            };
                            tInfo.push(trafficObject)
                        }

                        for (var x = 0; x < tInfo.length; x++) {
                            var sectionPoint = []; //구간선언

                            for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                                sectionPoint.push(arrPoint[y]);
                            }

                            if (tInfo[x].trafficIndex == 0) {
                                lineColor = "#06050D";
                            } else if (tInfo[x].trafficIndex == 1) {
                                lineColor = "#61AB25";
                            } else if (tInfo[x].trafficIndex == 2) {
                                lineColor = "#FFFF00";
                            } else if (tInfo[x].trafficIndex == 3) {
                                lineColor = "#E87506";
                            } else if (tInfo[x].trafficIndex == 4) {
                                lineColor = "#D61125";
                            }

                            //라인그리기[S]
                            polyline_ = new Tmapv2.Polyline({
                                path : sectionPoint,
                                strokeColor : lineColor,
                                strokeWeight : 6,
                                map : map
                            });
                            //라인그리기[E]
                            lineArr.push(polyline_);
                        }
                    }
                }
            } 
        }
    </script>
</body>
</html>