$(function(){
    // serviceCate 요소의 위치를 Kakao 지도 위에 고정
    var serviceCateElement = document.querySelector('.serviceCate');
    var mapElement = document.getElementById('map');
    var mapParentElement = mapElement.parentElement;

    mapParentElement.style.position = 'relative'; // Kakao 지도를 감싸고 있는 부모 요소의 position을 relative로 설정

    // serviceCate 요소를 mapElement의 자식 요소로 추가
    mapElement.appendChild(serviceCateElement);

    // 각 버튼 별 아이템 띄우기
	// 길찾기
    $('#filterBtn1').click(function () {
        $(".search_map").css({"display":"inherit",'z-index':'110'});
        $(".search_favorite").css({"display":"none"});
        $(".search_navigation").css({"display":"none"});
    });
	// 충전소 검색
    $('#filterBtn2').click(function () {
        $(".search_navigation").css({"display":"inherit",'z-index':'110'});
        $(".search_map").css({"display":"none"});
        $(".search_favorite").css({"display":"none"});

        $('#charger_type').prop('selectedIndex', 0);
        $('#evc_area').prop('selectedIndex', 0);
        $('#charger_opbig').prop('selectedIndex', 0);
        $('#name').prop('selectedIndex', 0);
        $('#searchText').val('');
    });
	
    // 즐겨찾기
    $('#filterBtn3').click(function () {
        $(".search_favorite").css({"display":"inherit",'z-index':'110'});
        $(".search_map").css({"display":"none"});
        $(".search_navigation").css({"display":"none"});

        if(sessionResult !== ''){
			$.ajax({
            	url: 'ev_Favorite',
                type: 'GET',
                data: { member_id : sessionResult },
                success: function(data) {
                	$('#favoriteList').html(''); // 결과 영역 초기화
                    if (data && data.length > 0) {
                    	data.forEach(function(item) {
                            	var resultHTML = '<dd>';
                            	resultHTML += '<table class="favorite-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
                                resultHTML += '<tr>';
                                resultHTML += '<td rowspan="2"><img src="/images/ev/goverment-logo.png" /></td>';
                                resultHTML += '<td colspan="2">' + item.evc_name + '</td>';
                                resultHTML += '</tr>';
                                resultHTML += '<tr>';
                                resultHTML += '<td><span style="font-size: 12px">' + item.evc_area + '</span></td>';
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
				error: function(err) {
                	$('#favoriteList').html('');
                    $('#favoriteList').show(); // 결과 영역 표시
                    console.error(err);
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
                if (data.length > 0) {
                    var charger = data[0]; // 첫 번째 충전소 정보 가져오기 (필요에 따라 수정)
                    $('.ev_name'			).text(charger.evc_name);
					$('.evc_id'				).text(charger.evc_id);
                    $('#evc_address'		).text(charger.evc_address);
                    $('#charger_no'			).text(charger.charger_no);
                    $('#charger_mechine'	).text(charger.charger_mechine);
                    $('.charger_type'		).text(charger.charger_type);
                    $('#charger_state'		).text(charger.charger_state);
                    $('#charger_facsmall'	).text(charger.charger_facsmall);
                    $('#charger_opsmall'	).text(charger.charger_opsmall);
                    $('#charger_userlimit'	).text(charger.charger_userlimit);
					var img = $('#favoriteImage');
					var currentSrc = img.attr('src');
					var newImageUrl = '/images/ev/like_on.png';
					img.attr('src', newImageUrl);
					
                    $('.charger_Information').show();
                } else {
                    alert('No data found');
                    $('.charger_Information').hide();
                    $('.overlay').hide();
                }
            },
            error: function(err) {
                console.error("Error fetching charger info: ", err);
            }
        });
        panTo(lat, lng, 1, title);
    });

    // 즐겨찾기 버튼 클릭
    $('.setFavorite').click(function(event) {
		var evcId = $('.evc_id').text();
		alert(evcId);
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
                    alert("즐겨찾기에 추가했습니다."+evcId+","+sessionResult);
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
			    	alert("삭제되었습니다."+evcId+","+sessionResult);
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
});
