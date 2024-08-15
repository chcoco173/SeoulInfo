$(function(){
    
    var festivalLat = document.getElementById('festivalLat').value;		// 위도
    var festivalLng = document.getElementById('festivalLng').value;		// 경도
	var festivalName = document.getElementById('festivalName').value; 	// 이름
    var mapContainer = document.getElementById('map');					// 지도

    // 지도 옵션을 설정합니다
    var mapOption = { 
        center: new kakao.maps.LatLng(festivalLat, festivalLng), // 지도의 중심좌표
        level: 4, // 지도의 확대 레벨
		maxLevel:5
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);	 	 // 지도를 생성합니다
		map.setDraggable(false);								 // 지도 드래그 기능 비활성화
    var imageSrc = '/images/festival/festivalMarker.gif',	 	 // 마커이미지의 주소    
        imageSize = new kakao.maps.Size(64, 69), 			 	 // 마커이미지의 크기
        imageOption = {offset: new kakao.maps.Point(27, 69)};	 // 마커 이미지 설정

    // 위 이미지정보를 가지고 있는 이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),	// 마커이미지 설정
        markerPosition = new kakao.maps.LatLng(festivalLat, festivalLng); 			// 마커가 표시 위치

    // 마커를 생성
    var marker = new kakao.maps.Marker({
        position: markerPosition, 
        image: markerImage  
    });
    marker.setMap(map);	// 마커가 지도 위에 표시되도록 설정
	marker.setZIndex(2);// 마커 우선순위 설정
	kakao.maps.event.addListener(marker, 'click', function() {
	    map.setLevel(1);				// 지도 레벨을 1로 설정	    
	    map.setCenter(markerPosition);  // 지도의 중심을 마커의 위치로 설정
	});
	var circlePositions = [];	// 전역변수 설정 : 전체 편의시설 마커
	var locationMarkers = [];	// 전역변수 설정 : 필터링 마커
    // 위치 정보를 가져오는 AJAX 호출
    $.ajax({
        url: 'getCircleLocation',
        type: 'GET',
        data: {
            centerLat: festivalLat,
            centerLng: festivalLng,
            radius: 1000 	// 반경 1000m 내의 정보
        },
        success: function(data) {
            clearMarkers();	// 마커 초기화
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
					
					// 마커 이벤트 리스너 추가
	                var closeTimeout;
	                kakao.maps.event.addListener(locationMarker, 'click', function() {
	                    clearTimeout(closeTimeout);
	                    infoWindow.open(map, locationMarker); // 마커 위치에 InfoWindow를 엽니다
	                });

	                kakao.maps.event.addListener(locationMarker, 'mouseout', function() {
	                    closeTimeout = setTimeout(function() {
	                        infoWindow.close();
	                    }, 1500); // 1.5초 후에 창을 닫습니다
	                });
                    locationMarkers.push(locationMarker);
                });
            } else {
                console.log("원 안에 편의시설 정보가 없습니다.");
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
	
	// 길찾기 버튼 클릭 시, 세션으로 정보 넘겨주기
	$('.nav_wrap').click(function() {
	    // 세션 스토리지에 데이터 저장
	    sessionStorage.setItem('festivalName', festivalName);
	    sessionStorage.setItem('endx', festivalLng);
	    sessionStorage.setItem('endy', festivalLat);

	    // 페이지 이동
	    window.location.href = "/ev/ev_Navigation";
	});
});
