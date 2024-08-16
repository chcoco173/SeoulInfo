$(function(){
	// charger_type에 따른 이미지 URL 배열 정의
		var chargerTypeImages = {
		    "AC완속": ["/images/ev/ACsingle.png"],
		    "AC3상": ["/images/ev/AC3.png"],
			"DC차데모": ["/images/ev/DCdemo.png"],
			"DC차데모+AC3상": [
				"/images/ev/DCdemo.png",
				"/images/ev/AC3.png"
			],
			"DC차데모+AC3상+DC콤보": [
				"/images/ev/DCdemo.png",
				"/images/ev/AC3.png",
				"/images/ev/DCcombo.png"
			],
		    "DC차데모+DC콤보": [
		        "/images/ev/DCdemo.png",
		        "/images/ev/DCcombo.png"
		    ],
			"DC콤보": ["/images/ev/DCcombo.png"],
			"DC콤보(완속)": ["/images/ev/DCcombo.png"]
		};
		
		// charger_machine에 따른 이미지 URL 배열 정의
		var machineImages = {
			"완속": ["/images/ev/normal_charge.png"],
			"급속": ["/images/ev/speed_charge.png"]
		};
		
		// session 값 받아오기
		
		
		// ########### 지도 생성 ############## 
		showLoading();	// ## delay 1 - 로딩 바 표시
			
	    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	    var mapOption = {
	    	center: new kakao.maps.LatLng(37.566826, 126.9786567),
	        level: 5,
	        maxLevel: 7 // 확대 최대 레벨
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
		                "중구": 	{lat: 37.563797, lng: 126.997314},
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
		

	    var imageSrc = "/images/ev/ev_normal.png"; 
	    var clickedImageSrc = "/images/ev/ev_click.png"; 

		var markers = [];							 // 충전소 마커를 담을 리스트
		var imageSize = new kakao.maps.Size(30, 30); // 충전소 마커 사이즈 
		var currentClickedMarker = null;			 // 마커클릭 확인 정보
		var circle = null;							 // 마커 반경 1km 확인 정보
		var locationMarkers = [];					 // 편의시설 마커를 담을 리스트

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
						// 마커 클릭 후, 다른 마커 클릭 시
		                var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		                currentClickedMarker.setImage(originalImage);
		                currentClickedMarker.isClicked = false;
		            }
		            if (marker.isClicked) {
						// 동일 마커 클릭 시
		                var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		                marker.setImage(originalImage);
		                marker.isClicked = false;		                
		            } else {
		                var clickedImage = new kakao.maps.MarkerImage(clickedImageSrc, imageSize);
		                marker.setImage(clickedImage);
		                marker.isClicked = true;
		                currentClickedMarker = marker;
						lastClickedMarkerPosition = marker.getPosition(); // 필터링을 위한 최근 마커 설정
						
		                $('.charger_Information').show();
		                $(".charger_Information").css({"display":"inherit",'z-index':'1111'});
						
						// 마커의 위치에서 위도와 경도 가져오기 및 반올림 처리
				        var lat = marker.getPosition().getLat();
				        var lng = marker.getPosition().getLng();

				        // 소수점 이하 10자리에서 반올림
				        lat = parseFloat(lat.toFixed(10));
				        lng = parseFloat(lng.toFixed(10));
						
						// AJAX 요청 보내기 - 마커에 해당하는 상세정보 불러오기
						$.ajax({
						    url: 'ev_info',
						    type: 'GET',
						    data: {
						        lat: lat, // 위도
						        lng: lng  // 경도
						    },
						    success: function(data) {
						        console.log('data - ev_info: ' + data);
						        if (data.length > 0) {
						            $('.ev_name').text(data[0].evc_name);
						            $('.evc_id').text(data[0].evc_id);
						            $('#evc_address').text(data[0].evc_address);
						            $('#charger_facsmall').text(data[0].charger_facsmall);
						            $('#charger_opsmall').text(data[0].charger_opsmall);
						            
						            var chargerDetailsBody = $('#chargerDetailsBody');
						            chargerDetailsBody.empty();

						            // getTest 호출을 한번만 수행하여 모든 충전기 상태 정보 가져오기
						            $.ajax({
						                url: "getTest",
						                type: "GET",
						                data: { evc_id: data[0].evc_id }, // 필요한 데이터만 전송
						                success: function(realTimeData) {
						                    console.log('data: ', realTimeData);
						                    var parser = new DOMParser();
						                    var xmlDoc = parser.parseFromString(realTimeData, "text/xml");

						                    // 모든 item 요소 가져오기
						                    var items = xmlDoc.getElementsByTagName("item");

						                    // 모든 충전기에 대한 정보를 표시하는 작업을 먼저 수행
						                    data.forEach(function(charger) {
						                        // 각 충전기별 로드뷰 설정
						                        var latitude = charger.evc_lat;
						                        var longitude = charger.evc_long;
						                        var roadviewContainer = document.getElementById('roadview');
						                        var roadview = new kakao.maps.Roadview(roadviewContainer);
						                        var roadviewClient = new kakao.maps.RoadviewClient();
						                        var position = new kakao.maps.LatLng(latitude, longitude);

						                        roadviewClient.getNearestPanoId(position, 100, function(panoId) {
						                            roadview.setPanoId(panoId, position);
						                        });

						                        // 충전기 정보 표시
						                        var row = '<tr>';
						                        var machineImagesList = machineImages[charger.charger_mechine] || [];
						                        var machineImagesHtml = machineImagesList.map(function(imageUrl) {
						                            return '<img src="' + imageUrl + '" alt="' + charger.charger_mechine + '" class="charger-image" style="border-radius:0px; margin-top:4px;"/>';
						                        }).join('');
						                        row += '<td id="charger_mechine">' + machineImagesHtml + '<br><span style="font-size:12px;">' + charger.charger_mechine + '</span></td>';

						                        var chargerTypeImagesList = chargerTypeImages[charger.charger_type] || [];
						                        var imagesHtml = chargerTypeImagesList.map(function(imageUrl) {
						                            return '<img src="' + imageUrl + '" alt="' + charger.charger_type + '" class="charger-image" style="border-radius:0px; margin-top:4px; margin-right:5px;margin-left:5px;"/>';
						                        }).join('');
						                        row += '<td class="charger_type">' + imagesHtml + '<br><span style="font-size:12px;">' + charger.charger_type + '</span></td>';

						                        // 상태 정보를 업데이트
						                        var stat, statUpdDt, found = false;

						                        for (var i = 0; i < items.length; i++) {
						                            var chgerId = items[i].getElementsByTagName("chgerId")[0]?.textContent;
						                            if (chgerId == charger.charger_no) {
						                                stat = items[i].getElementsByTagName("stat")[0]?.textContent;
						                                statUpdDt = items[i].getElementsByTagName("statUpdDt")[0]?.textContent;
						                                found = true;
						                                break;
						                            }
						                        }

						                        // 통신 상태에 따른 처리
						                        var statusText = "통신상태불량";
						                        var formattedDate = new Date().toLocaleString('ko-KR', {
						                            month: '2-digit',
						                            day: '2-digit',
						                            hour: '2-digit',
						                            minute: '2-digit'
						                        });

						                        if (found && statUpdDt) {
						                            var year = statUpdDt.substring(0, 4);
						                            var month = statUpdDt.substring(4, 6);
						                            var day = statUpdDt.substring(6, 8);
						                            var hour = statUpdDt.substring(8, 10);
						                            var minute = statUpdDt.substring(10, 12);

						                            var period = '오전';
						                            var hourInt = parseInt(hour, 10);
						                            if (hourInt >= 12) {
						                                period = '오후';
						                                if (hourInt > 12) {
						                                    hourInt -= 12;
						                                }
						                            } else if (hourInt === 0) {
						                                hourInt = 12;
						                            }
						                            formattedDate = month + '. ' + day + '. ' + period + ' ' + hourInt + ':' + minute;

						                            switch (stat) {
						                                case "1":
						                                    statusText = "통신이상";
						                                    break;
						                                case "2":
						                                    statusText = "사용가능";
						                                    break;
						                                case "3":
						                                    statusText = "충전중";
						                                    break;
						                                case "4":
						                                    statusText = "고장";
						                                    break;
						                                case "5":
						                                    statusText = "점검중";
						                                    break;
						                                case "9":
						                                    statusText = "상태미확인";
						                                    break;
						                                default:
						                                    statusText = "통신오류";
						                                    break;
						                            }
						                        }

						                        row += '<td><span><b id="charger_state">' + statusText + '</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
						                        row += '<td class="charger_userlimit">' + charger.charger_userlimit + '</td>';
						                        row += '</tr>';
						                        chargerDetailsBody.append(row);
						                    });
						                },
						                error: function(err) {
						                    console.error("Error fetching real-time data: ", err);
						                }
						            });

						            // 사용자 즐겨찾기 데이터와 비교하기
						            var img = $('#favoriteImage');
						            var newImageUrl = '/images/ev/like_off.png';
						            img.attr('src', newImageUrl);
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
						        }
						    },
						    error: function(err) {
						        console.error("Error fetching charger info: ", err);
						    }
						});
						
						// 클릭한 마커를 중심으로 반경 1km 원 그리기
						if (circle) {
						    circle.setMap(null);
						}
						circle = new kakao.maps.Circle({
						    center: marker.getPosition(),
						    radius: 1000,
						    strokeWeight: 0.5,
						    strokeColor: '#000000',
						    strokeOpacity: 0.7,
						    strokeStyle: 'solid',
						    fillColor: '#41A317',
						    fillOpacity: 0.1
						});
						circle.setMap(map);

						var circlePositions = [];

						// AJAX 호출로 위치 정보를 가져옵니다
						$.ajax({
						    url: 'getCircleLocation',
						    type: 'GET',
						    data: {
						        centerLat: marker.getPosition().getLat(),
						        centerLng: marker.getPosition().getLng(),
						        radius: 1000
						    },
						    success: function(data) {
						        clearMarkers();
						        data.forEach(function(item) {
						            circlePositions.push({
						                latlng: new kakao.maps.LatLng(item.etc_lat, item.etc_long),
						                title: item.etc_category,
						                name: item.etc_name, // InfoWindow에 표시할 이름 저장
						                address: item.etc_address // InfoWindow에 표시할 주소 저장
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
						                    map: map, // 마커를 표시할 지도
						                    position: position.latlng, // 마커를 표시할 위치
						                    title: position.title, // 마커의 타이틀
						                    image: markerImage, // 마커 이미지
						                    name: position.name,
						                    address: position.address
						                });

						                // InfoWindow의 내용과 위치를 정의합니다
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

						                var InfoWindowRemovable = false;
						                // InfoWindow 인스턴스를 생성합니다
						                var infoWindow = new kakao.maps.InfoWindow({
						                    content: iwContent,
						                    removable: InfoWindowRemovable
						                });

						                // 마커 hover 이벤트 리스너 추가
						                var closeTimeout;
						                kakao.maps.event.addListener(locationMarker, 'mouseover', function() {
						                    clearTimeout(closeTimeout); // 기존의 타이머가 있다면 제거합니다
						                    infoWindow.open(map, locationMarker); // 마커 위치에 InfoWindow를 엽니다
						                });

						                kakao.maps.event.addListener(locationMarker, 'mouseout', function() {
						                    closeTimeout = setTimeout(function() {
						                        infoWindow.close(); // InfoWindow를 닫습니다
						                    }, 500); // 0.5초 후에 창을 닫습니다
						                });
										// 마커 클릭 시, 정보 화면이동
						                kakao.maps.event.addListener(locationMarker, 'click', function() {
						                    window.open('https://map.kakao.com/?q=' + (position.address || '') + ' ' + (position.name || ''), '_blank');
						                });

						                locationMarkers.push(locationMarker); // 마커를 배열에 추가
						            });
						        } else {
						            alert("원 안에 편의시설 정보가 없습니다.");
						        }
						    },
						    error: function(err) {
						        console.error("위치 정보 가져오기 오류: ", err);
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
				minLevel: 4
			});
								
			clusterer.addMarkers(markers);
		// ############ 지도 확대/축소 시, 로딩 화면 출력 이벤트 ################
			kakao.maps.event.addListener(map, 'tilesloaded', function() {
				hideLoading();
			});
		// 지도 확대/축소 시 로딩 바 표시
			kakao.maps.event.addListener(map, 'zoom_start', function() {
				showLoading();
			});
			
			kakao.maps.event.addListener(map, 'zoom_end', function() {
				setTimeout(hideLoading, 1000);
			});
		// 지도 이동 시 로딩 바 표시 (확대/축소 외에도 이동 시 로딩 바를 표시하려면 다음과 같이 추가 가능)
			kakao.maps.event.addListener(map, 'idle', function() {
				setTimeout(hideLoading, 1000); 
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
		        }
			});
			
		// ######## 지도 이미지 타입 변경 이벤트 ##############
	        var mapTypes = { terrain: kakao.maps.MapTypeId.TERRAIN };

	        function setOverlayMapTypeId() {
	            var btnTerrain = document.getElementById('btnTerrain');
	            var isTerrainEnabled = btnTerrain.getAttribute('data-enabled') === 'true';

	            if (isTerrainEnabled) {
	                map.removeOverlayMapTypeId(mapTypes.terrain);
	                btnTerrain.setAttribute('data-enabled', 'false');
	                btnTerrain.innerText = "지형도";
	                btnTerrain.classList.remove('btn-info');
	                btnTerrain.classList.add('btn-warning');
	            } else {
	                map.addOverlayMapTypeId(mapTypes.terrain);
	                btnTerrain.setAttribute('data-enabled', 'true');
	                btnTerrain.innerText = "이미지";
	                btnTerrain.classList.remove('btn-warning');
	                btnTerrain.classList.add('btn-info');
	            }
	        }
			
		// ###################### 충전소 검색 ##########################
			$('#searchForm').on('submit', function(e) {
				e.preventDefault();
				$.ajax({
					url: 'ev_MapFilter',
					type: 'POST',
					data: $(this).serialize(),
					success: function(data) {
						$('#resultContainer').html(''); // 결과 영역 초기화
						if (data && data.length > 0) {
					    	data.forEach(function(item) {
					        var resultHTML  = '<dl id="filteredList" class="high-z-index">';
					        	resultHTML += '<dd>';
					            resultHTML +=     '<table class="filtered-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
					            resultHTML +=         '<tr>';
					            resultHTML +=             '<td rowspan="2"><img src="'+getImageUrl(item.charger_opsmall)+'" /></td>';
					            resultHTML +=             '<td colspan="2">' + item.evc_name + '</td>';
					            resultHTML +=         '</tr>';
					            resultHTML +=         '<tr>';
					            resultHTML +=             '<td><span style="font-size: 12px">' + item.charger_opsmall + '</span></td>';
					            resultHTML +=             '<td><span style="font-size: 12px">' + item.evc_area + '</span></td>';
					            resultHTML +=         '</tr>';
					            resultHTML +=     '</table>';
					            resultHTML +=     '<br>';
					            resultHTML += '</dd>';
					            resultHTML += '</dl>';
					        $('#resultContainer').append(resultHTML);
							});
							
						    var paginationHTML = `
						    	<div class="filtered-list result-list-pagination" style="text-align: center; margin-top: 20px;">
						        <button type="button" class="btn btn-secondary" id="filtered-prevPage" disabled>이전</button>
						        <span id="filtered-pageInfo">1 / 1</span>
						            <button type="button" class="btn btn-secondary" id="filtered-nextPage">다음</button><hr>
						            </div>`;
						        $('#resultContainer').append(paginationHTML);
						        $('#resultContainer').show(); // 결과 영역 표시
						        // 페이징 기능
						        initializePagination();             
							} else {
								// 결과 없을 경우
					            $('#resultContainer').html('<p>검색 결과가 없습니다.</p>');
					            $('#resultContainer').show(); // 결과 영역 표시
							}
						},
					    error: function(err) {
					    	$('#resultContainer').html('');
					        $('#resultContainer').show(); // 결과 영역 표시
							console.log(err);
					    }
					});
				});
			
				$(document).on('click', '.result-list-table', function() {
				    var lat   = $(this).data('lat');
				    var lng   = $(this).data('lng');
				    var title = $(this).data('title');
				    var evcId = $(this).data('id');
				    $('.btn-close').click(); // 클러스터러 닫기
				    $('.charger_Information').css({'display':'inherit', 'z-index':'1100'});
				    lastClickedMarkerPosition = new kakao.maps.LatLng(lat, lng);

					$.ajax({
					    url: 'ev_info',
					    type: 'GET',
					    data: {
					        evc_id: evcId,
					        lat: lat,
					        lng: lng
					    },
					    success: function(data) {
					        console.log('data: ', data);
					        if (data.length > 0) {
					            $('.ev_name').text(data[0].evc_name);
					            $('.evc_id').text(data[0].evc_id);
					            $('#evc_address').text(data[0].evc_address);
					            $('#charger_facsmall').text(data[0].charger_facsmall);
					            $('#charger_opsmall').text(data[0].charger_opsmall);

					            var chargerDetailsBody = $('#chargerDetailsBody');
					            chargerDetailsBody.empty();

					            // getTest 호출을 한번만 수행하여 모든 충전기 상태 정보 가져오기
					            $.ajax({
					                url: "getTest",
					                type: "GET",
					                data: { evc_id: evcId }, // 필요한 데이터만 전송
					                success: function(realTimeData) {
					                    console.log('data: ', realTimeData);
					                    var parser = new DOMParser();
					                    var xmlDoc = parser.parseFromString(realTimeData, "text/xml");

					                    // 모든 item 요소 가져오기
					                    var items = xmlDoc.getElementsByTagName("item");

					                    // 모든 충전기에 대한 정보를 표시하는 작업을 먼저 수행
					                    data.forEach(function(charger) {
					                        // 각 충전기별 로드뷰 설정
					                        var roadviewContainer = document.getElementById('roadview');
					                        var roadview = new kakao.maps.Roadview(roadviewContainer);
					                        var roadviewClient = new kakao.maps.RoadviewClient();
					                        var position = new kakao.maps.LatLng(lat, lng);

					                        roadviewClient.getNearestPanoId(position, 150, function(panoId) {
					                            roadview.setPanoId(panoId, position);
					                        });

					                        // 충전기 정보 표시
					                        var row = '<tr>';
					                        var machineImagesList = machineImages[charger.charger_mechine] || [];
					                        var machineImagesHtml = machineImagesList.map(function(imageUrl) {
					                            return '<img src="' + imageUrl + '" alt="' + charger.charger_mechine + '" class="charger-image" style="border-radius:0px; margin-top:4px;"/>';
					                        }).join('');
					                        row += '<td id="charger_mechine">' + machineImagesHtml + '<br><span style="font-size:12px;">' + charger.charger_mechine + '</span></td>';

					                        var chargerTypeImagesList = chargerTypeImages[charger.charger_type] || [];
					                        var imagesHtml = chargerTypeImagesList.map(function(imageUrl) {
					                            return '<img src="' + imageUrl + '" alt="' + charger.charger_type + '" class="charger-image" style="border-radius:0px; margin-top:4px; margin-right:5px;margin-left:5px;"/>';
					                        }).join('');
					                        row += '<td class="charger_type">' + imagesHtml + '<br><span style="font-size:12px;">' + charger.charger_type + '</span></td>';

					                        var stat, statUpdDt, found = false;

					                        for (var i = 0; i < items.length; i++) {
					                            var chgerId = items[i].getElementsByTagName("chgerId")[0]?.textContent;
					                            if (chgerId == charger.charger_no) {
					                                stat = items[i].getElementsByTagName("stat")[0]?.textContent;
					                                statUpdDt = items[i].getElementsByTagName("statUpdDt")[0]?.textContent;
					                                found = true;
					                                break;
					                            }
					                        }
					                        // 통신 상태에 따른 처리
					                        var statusText = "통신상태불량";
					                        var formattedDate = new Date().toLocaleString('ko-KR', {
					                            month: '2-digit',
					                            day: '2-digit',
					                            hour: '2-digit',
					                            minute: '2-digit'
					                        });

					                        if (found && statUpdDt) {
					                            var year = statUpdDt.substring(0, 4);
					                            var month = statUpdDt.substring(4, 6);
					                            var day = statUpdDt.substring(6, 8);
					                            var hour = statUpdDt.substring(8, 10);
					                            var minute = statUpdDt.substring(10, 12);

					                            var period = '오전';
					                            var hourInt = parseInt(hour, 10);
					                            if (hourInt >= 12) {
					                                period = '오후';
					                                if (hourInt > 12) {
					                                    hourInt -= 12;
					                                }
					                            } else if (hourInt === 0) {
					                                hourInt = 12;
					                            }
					                            formattedDate = month + '. ' + day + '. ' + period + ' ' + hourInt + ':' + minute;

					                            switch (stat) {
					                                case "1":
					                                    statusText = "통신이상";
					                                    break;
					                                case "2":
					                                    statusText = "사용가능";
					                                    break;
					                                case "3":
					                                    statusText = "충전중";
					                                    break;
					                                case "4":
					                                    statusText = "고장";
					                                    break;
					                                case "5":
					                                    statusText = "점검중";
					                                    break;
					                                case "9":
					                                    statusText = "상태미확인";
					                                    break;
					                                default:
					                                    statusText = "통신오류";
					                                    break;
					                            }
					                        }
					                        row += '<td><span><b id="charger_state">' + statusText + '</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
					                        row += '<td class="charger_userlimit">' + charger.charger_userlimit + '</td>';
					                        row += '</tr>';
					                        chargerDetailsBody.append(row);
					                    });
					                },
					                error: function(err) {
					                    console.error("Error fetching real-time data: ", err);
					                }
					            });
					            // 사용자 즐겨찾기 데이터와 비교
					            var img = $('#favoriteImage');
					            var newImageUrl = '/images/ev/like_off.png';
					            img.attr('src', newImageUrl);
					            compareFavImg(evcId); 
					        }
					    },
					    error: function(err) {
					        console.error("Error fetching charger info: ", err);
					    }
					});// end of ev_info ajax
			    panTo(lat, lng, 3, title); // 중심좌표 이동
				// 클릭한 마커를 중심으로 반경 1km 원 그리기
			    if (circle) {
			        circle.setMap(null);
			    }
			    circle = new kakao.maps.Circle({
			        center: new kakao.maps.LatLng(lat, lng),
			        radius: 1000,
			        strokeWeight: 2,
			        strokeColor: '#75B8FA',
			        strokeOpacity: 0.4,
			        strokeStyle: 'solid',
			        fillColor: '#41A317',
			        fillOpacity: 0.4
			    });
			    circle.setMap(map);
		
			    var circlePositions = [];
		
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
			            centerLat: lat,
			            centerLng: lng,
			            radius: 1000
			        },
			        success: function(data) {
			            clearMarkers(); 	// 마커를 클리어
			            // 데이터 배열을 순회하면서 circlePositions 배열에 추가
			            data.forEach(function(item) {
			                circlePositions.push({
			                    latlng: new kakao.maps.LatLng(item.etc_lat, item.etc_long), // LatLng 객체로 생성
			                    title: item.etc_category,
								name : item.etc_name,
								address : item.etc_address
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
			            var infowindow = new kakao.maps.InfoWindow({zIndex: 1}); // 정보창 초기화
			            if (circlePositions.length > 0) {
							circlePositions.forEach(function(position) {
								var imageSrc = imageSrcs[position.title] || "/images/ev/etc_parking.png";
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
								var locationMarker = new kakao.maps.Marker({
									map: map,                              // 마커를 표시할 지도
									position: position.latlng,             // 마커를 표시할 위치
									title: position.title,                 // 마커의 타이틀
									image: markerImage,                    // 마커 이미지
									name : position.name,
									address : position.address
								});
								// InfoWindow의 내용과 위치를 정의합니다
								var iwContent = '';
									iwContent += '<div style="border-radius:10px; border: 1px solid black; background-color: #fff; box-shadow: 0px 0px 5px rgba(0,0,0,0.2);">';
									iwContent += '<div style="font-size:14px; border-radius:10px 10px 0px 0px; font-weight:bold; color:#333; background-color:yellowgreen; text-align:center; ">';
									iwContent += '<a href="https://map.kakao.com/?q=' + (position.address || '') +' '+ (position.name || '') +'" target="blank"><b>'+(position.name || 'Unknown') + '</b></a>';
									iwContent += '</div>';
									iwContent += '<hr style="margin:5px 0;">';
									iwContent += '<div style="font-size:12px; color:#666;"> 분류 : ' + (position.title || 'Unknown') + '</div>';
									iwContent += '<div style="font-size:12px; color:#666;">' + (position.address || 'Unknown') + '</div>';
									iwContent += '</div>';
									
									var InfoWindowRemovable = true;	
									// InfoWindow 인스턴스를 생성합니다
									var infoWindow = new kakao.maps.InfoWindow({
										content: iwContent,
										removable: InfoWindowRemovable
									});
								// 마커 클릭 이벤트 리스너 추가
								kakao.maps.event.addListener(locationMarker, 'click', function() {
									infoWindow.open(map, locationMarker); // 마커 위치에 InfoWindow를 엽니다
								});
								locationMarkers.push(locationMarker); // 마커를 배열에 추가
								console.log("마커 추가됨 위치:", position.latlng.getLat(), position.latlng.getLng());
							});
			            } else {
			                alert("원 안에 위치 정보가 없습니다.");
			            }
			        },
			        error: function(err) {
			            console.error("Error fetching locations: ", err);
			        }
			    });
			});
			
			// 즐겨찾기
			$('.btnShowFavorite').click(function(event) {
				if (sessionResult !== '') {
					$.ajax({
						url: 'ev_Favorite',
						type: 'GET',
						data: { member_id: sessionResult },
						success: function(data) {
							$('#userFavoriteList').empty();
							if (data == null || data.length === 0) {
						    	$('#userFavoriteList').append('<p>검색 결과가 없습니다.</p>');
						    } else {
						        data.forEach(function(item) {
						        var resultHTML =  '<dd>';
						        	resultHTML += '<table class="favorite-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
						        	resultHTML += '<tr>';
						        	resultHTML += '<td rowspan="2"><img src="'+getImageUrl(item.charger_opsmall)+'" /></td>';
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
							$('#userFavoriteList').show();
						},
						error: function(xhr, status, error) {
							$('#userFavoriteList').empty();
						    $('#userFavoriteList').append('<p>검색 결과를 가져오는 데 실패했습니다.</p>');
						    $('#userFavoriteList').show();
						    console.error('AJAX 요청 실패:', status, error);
						}
					});
				}
			});
		
		// ---- 즐겨 찾기 상세정보
		$(document).on('click', '.favorite-list', function() {
			// 사용자 즐겨찾기 데이터와 비교 ======================
	        var img = $('#favoriteImage');
	        var newImageUrl = '/images/ev/like_on.png';
	        img.attr('src', newImageUrl);
		});
										
			// 즐겨찾기 버튼 클릭
			$('.setFavorite').click(function(event) {
				var evcId = $('.evc_id').text();
				if(sessionResult === ''){
					 var userConfirmed = confirm("이 기능은 로그인 후 가능합니다. \n로그인 페이지로 이동하시겠습니까?");
					 if (userConfirmed) {
					    // 로그인 페이지로 리다이렉트
					 	window.location.href = '/member/login';
					 }
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
			
			// 필터 collapse 열어두기----------------
			document.addEventListener("DOMContentLoaded", function() {
			    var filterButton = document.querySelector('.btn-mapFilter');
			    var collapseMenu = document.getElementById('collapseMenu');
				
			    // collapseMenu를 보여줍니다
			    collapseMenu.classList.add('show');
				filterButton.setAttribute('aria-expanded', 'true');
			});
			
			// =========================== 함수 =========================================
			// 로딩바 보이기 함수		
			function showLoading() {
				document.getElementById('loading').style.display = 'flex';
			}

			// 로딩 바 숨기기 함수
			function hideLoading() {
				document.getElementById('loading').style.display = 'none';
			}

			// map moving smooth
			function panTo(lat, lng, level, title) {
				var moveLatLon = new kakao.maps.LatLng(lat, lng);
					map.panTo(moveLatLon);
					map.setLevel(level);
			}
			
			// 즐겨찾기 ==============================================
			// 사용자 즐겨찾기 데이터와 비교하기
			function compareFavImg(evcId){
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
			}
				
			// 페이지네이션 초기화 및 처리 함수
			function initializeFavoritePagination() {
				var itemsPerPage = 7; 									// 페이지당 보여줄 항목 수
				var currentPage = 1; 									// 현재 페이지
				var $favoriteItems = $('#userFavoriteList dd'); 		// 즐겨찾기 항목들
				var totalItems = $favoriteItems.length; 				// 전체 항목 수
				var totalPages = Math.ceil(totalItems / itemsPerPage); 	// 전체 페이지 수
				
				function showPage(page) {
					$favoriteItems.hide(); 														 // 모든 항목 숨기기
					$favoriteItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show(); // 현재 페이지 항목만 표시
					$('#favorite-pageInfo').text(page + ' / ' + totalPages); 					 // 페이지 정보 업데이트
					$('#favorite-prevPage').prop('disabled', page === 1); 						 // 이전 페이지 버튼 상태 업데이트
					$('#favorite-nextPage').prop('disabled', page === totalPages); 				 // 다음 페이지 버튼 상태 업데이트
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
				// 초기 페이지 로드
				showPage(currentPage);
			}
			
			// 상세정보 ============================================= 
			// search list - paging event function
			function initializePagination() {
				var itemsPerPage = 4; // 페이지당 보여줄 항목 수
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
					
		// 공통 ===========================================================			
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
		
		// 필터링----------------------------------------------
		// 편의시설 마커 초기화
		var lastClickedMarkerPosition = null;
		
		function clearMarkers() {
			for (var i = 0; i < locationMarkers.length; i++) {
				locationMarkers[i].setMap(null); // 지도에서 마커 제거
			}
			locationMarkers = []; // 배열 초기화
		}
				
		// 편의시설 필터 - 버튼클릭 이벤트 리스너
		$('#etcCheckAll').click(function() {
		    onButtonClick(); // 카테고리 필터 없이 모든 데이터를 요청
		});

		$('#etcCheck1').click(function() {
		    onButtonClick('주차장');
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
		    if (!lastClickedMarkerPosition) {
		        alert("마커를 먼저 클릭해주세요.");
		        return;
		    }
		    fetchAndDisplayLocations(category);
		}
		
		function fetchAndDisplayLocations(category) {						
			$.ajax({
				url: 'getCircleLocation',
				type: 'GET',
				data: {
					centerLat: lastClickedMarkerPosition.getLat(),
					centerLng: lastClickedMarkerPosition.getLng(),
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
								                var closeTimeout;
								                kakao.maps.event.addListener(locationMarker, 'click', function() {
								                    clearTimeout(closeTimeout);
								                    infoWindow.open(map, locationMarker);
								                });
								                kakao.maps.event.addListener(locationMarker, 'mouseout', function() {
								                    closeTimeout = setTimeout(function() {
								                        infoWindow.close();
								                    }, 1500);
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
		
		// 주소지 구 뒤에 <br> 태그 넣기 (줄나누기)
		function formatAddress(address) {
			if (!address) {
				return 'Unknown';
			}
			var words = address.split(' ');
				for (var i = 0; i < words.length; i++) {
					if (words[i].endsWith('구')) {
						// '구'로 끝나는 단어를 찾았을 때
					    var part1 = words.slice(0, i + 1).join(' ');
					    var part2 = words.slice(i + 1).join(' ');
					    return part1 + '<br>' + part2;
					}
			}

			// '구'로 끝나는 단어가 없으면 원래 주소 반환
			return address;
		}
		
		// 거리 계산 함수 (Haversine Formula)
		function getDistanceFromLatLonInMeters(lat1, lon1, lat2, lon2) {
		    var R = 6371e3; // 지구 반지름 (미터 단위)
		    var dLat = toRad(lat2 - lat1);
		    var dLon = toRad(lon2 - lon1);
		    var a =
		        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
		        Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
		        Math.sin(dLon / 2) * Math.sin(dLon / 2);
		    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		    var distance = R * c;
		    return distance;
		}

		function toRad(Value) {
		    return Value * Math.PI / 180;
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
		
		function appendRow(item){
			var row = ''; // 추가할 row 초기화
	        filteredItems.forEach(function(item) {
	            var chgerId = item.getElementsByTagName("chgerId")[0]?.textContent;
	            var stat = item.getElementsByTagName("stat")[0]?.textContent;
	            var statUpdDt = item.getElementsByTagName("statUpdDt")[0]?.textContent;

	            // 날짜 및 시간 형식 변환
	            var year = statUpdDt.substring(0, 4);
	            var month = statUpdDt.substring(4, 6);
	            var day = statUpdDt.substring(6, 8);
	            var hour = statUpdDt.substring(8, 10);
	            var minute = statUpdDt.substring(10, 12);
	            var period = '오전';
	            var hourInt = parseInt(hour, 10);
	            if (hourInt >= 12) {
	                period = '오후';
	                if (hourInt > 12) {
	                    hourInt -= 12;
	                }
	            } else if (hourInt === 0) {
	                hourInt = 12;
	            }
	            var formattedDate = month + '. ' + day + '. ' + period + ' ' + hourInt + ':' + minute;
	            row += '<tr>'; // stat 값에 따른 row 추가
	            switch (stat) {
	                case "1":
	                    row += '<td><span><b id="charger_state">통신이상</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                case "2":
	                    row += '<td><span><b id="charger_state">사용가능</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                case "3":
	                    row += '<td><span><b id="charger_state">충전중</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                case "4":
	                    row += '<td><span><b id="charger_state">고장</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                case "5":
	                    row += '<td><span><b id="charger_state">점검중</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                case "9":
	                    row += '<td><span><b id="charger_state">상태미확인</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	                default:
	                    row += '<td><span><b id="charger_state">통신오류</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
	                    break;
	            }
	            row += '<td class="charger_userlimit">' + chgerId + '</td>'; // chgerId를 표시
	            row += '</tr>';
	        });
		}
		
		function appendRowDefault(){
			for (var i = 0; i < items.length; i++) {
		        var chgerId = items[i].getElementsByTagName("chgerId")[0]?.textContent;
		        found = true;
		        // 필요한 태그 정보 추출
		        var stat = items[i].getElementsByTagName("stat")[0]?.textContent;
		        var statUpdDt = items[i].getElementsByTagName("statUpdDt")[0]?.textContent;
				
				// statUpdDt의 수동적 날짜 구분 및 객체로 변환
				var year = statUpdDt.substring(0, 4);
				var month = statUpdDt.substring(4, 6);
				var day = statUpdDt.substring(6, 8);
				var hour = statUpdDt.substring(8, 10);
				var minute = statUpdDt.substring(10, 12);
					
				var period = '오전';
				var hourInt = parseInt(hour, 10); // 문자열을 정수로 변환
					if (hourInt >= 12) {
						period = '오후';
					    if (hourInt > 12) {
					    	hourInt -= 12; // 12시간 형식으로 변환
					    }
					} else if (hourInt === 0) {
						hourInt = 12; // 자정 (00:00)을 12:00 AM으로 표시
					}
				var formattedDate = month + '. ' + day + '. ' + period + ' ' + hourInt + ':' + minute;
				
		        row += '<td><span><b id="charger_state">사용가능</b></span><br><span style="font-size:12px;">' + formattedDate + '</span></td>';
		       break; // 일치하는 데이터를 찾으면 루프 종료
			}
		    if (!found) {
		        // 찾지 못한 오류 발생 시,
		        var currentTime = new Date().toLocaleString('ko-KR', {
		            month: '2-digit',
		            day: '2-digit',
		            hour: '2-digit',
		            minute: '2-digit'
		        });
		        row += '<td><span><b id="charger_state">통신상태불량</b></span><br><span style="font-size:12px;">' + currentTime + '</span></td>';
		    }
		
		    row += '<td class="charger_userlimit">' + charger.charger_userlimit + '</td>';
		    row += '</tr>';
		    chargerDetailsBody.append(row);
		}
});
