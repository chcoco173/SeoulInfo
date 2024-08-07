$(function(){
    // 즐겨찾기
    $('.btnShowFavorite').click(function () {
        $(".search_favorite").css({"display":"inherit",'z-index':'110'});
        $(".search_map").css({"display":"none"});
        $(".search_navigation").css({"display":"none"});
		if (sessionResult !== '') {
		    $.ajax({
		        url: 'ev_Favorite',
		        type: 'GET',
		        data: { member_id: sessionResult },
		        success: function(data) {
					//alert("success");
		            //$('#userFavoriteList').html(''); // 결과 영역 초기화
		            if (data && data.length > 0) {
		                data.forEach(function(item) {
		                    var resultHTML  = '<dd>';
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
			                    $('#favoriteList').append(resultHTML);
		                });
		                $('#favoriteList').show();
		            } else {
		                $('#favoriteList').html('<p>검색 결과가 없습니다.</p>');
		                $('#favoriteList').show(); 
		            }
		        },
		        error: function(xhr, status, error) {
		            $('#favoriteList').html('');
		            $('#favoriteList').show(); // 결과 영역 표시
		            console.error('AJAX 요청 실패:', status, error);
		        }
		    });
		} else {
		    alert(" 이 기능은 회원가입 후 가능합니다.");
		}


    });

    // 닫기 버튼
    $('.btn-close').click(function(event){
        event.stopPropagation();
        event.preventDefault();

        $(".search_map").css({"display":"none"});
        $(".search_navigation").css({"display":"none"});
        $(".search_favorite").css({"display":"none"});
        // 화면을 원래대로 복귀
        $('.overlay').hide();
        $('.charger_Information').css({'display':'none','z-index':'-1'});
		
		var imageSrc = "/images/ev/ev_normal.png"; 
		var imageSize = new kakao.maps.Size(30, 30);
		var currentClickedMarker = null;

		var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		currentClickedMarker.setImage(originalImage);
		currentClickedMarker.isClicked = false;
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
		//alert(evcId);
        if(sessionResult === ''){
            alert("이 기능은 회원가입 후 가능합니다.");
        } else if($('#favoriteImage').attr('src') === '/images/ev/like_off.png'){
			// 빈 하트 이미지일 경우,
			// alert("insert");
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
			// alert("delete");
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
	

	    function openOffcanvas() {
	        document.getElementById('offcanvasMenu').classList.add('show');
	    }

	    function closeOffcanvas() {
	        document.getElementById('offcanvasMenu').classList.remove('show');
	    }

	    // Example button click handler to open offcanvas
	    document.querySelector('.menu-button').addEventListener('click', openOffcanvas);

// -------------------------------------------------------------------------------------

async function getCarDirection() {
   const REST_API_KEY = 'REST_API_KEY';
   // 호출방식의 URL을 입력합니다.
   const url = 'https://apis-navi.kakaomobility.com/v1/directions';

  // 출발지(origin), 목적지(destination)의 좌표를 문자열로 변환합니다.
   const origin = `${pointObj.startPoint.lng},${pointObj.startPoint.lat}`; 
   const destination = `${pointObj.endPoint.lng},${pointObj.endPoint.lat}`;
   
   // 요청 헤더를 추가합니다.
   const headers = {
     Authorization: `KakaoAK ${REST_API_KEY}`,
     'Content-Type': 'application/json'
   };
 
   // 표3의 요청 파라미터에 필수값을 적어줍니다.
   const queryParams = new URLSearchParams({
     origin: origin,
     destination: destination
   });
   
   const requestUrl = `${url}?${queryParams}`; // 파라미터까지 포함된 전체 URL

   try {
     const response = await fetch(requestUrl, {
       method: 'GET',
       headers: headers
     });

     if (!response.ok) {
       throw new Error(`HTTP error! Status: ${response.status}`);
     }

     const data = await response.json();
     
     console.log(data)
   } catch (error) {
     console.error('Error:', error);
   }
 }
		
});
