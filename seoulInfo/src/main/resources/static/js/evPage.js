$(function(){
	
	// serviceCate 요소의 위치를 Kakao 지도 위에 고정
	var serviceCateElement = document.querySelector('.serviceCate');
	var mapElement = document.getElementById('map');
	var mapParentElement = mapElement.parentElement;
	
	mapParentElement.style.position = 'relative'; // Kakao 지도를 감싸고 있는 부모 요소의 position을 relative로 설정

	// serviceCate 요소를 mapElement의 자식 요소로 추가
	mapElement.appendChild(serviceCateElement);
	
	// 각 버튼 별 아이템 띄우기
	$('#filterBtn1').click(function () {
	    // alert("search1");
		$(".overlay").show();
		$('.overlay').css({'z-index':'1099'});
		$(".search_map").css({"display":"inherit",'z-index':'1100'});
		$(".search_favorite").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});
	});
	
	$('#filterBtn2').click(function () {
	    // alert("search2");
		// 화면을 검은색으로 레이아웃 변경 및 정보 표시
		$(".overlay").show();
		$('.overlay').css({'z-index':'1099'});
		$(".search_navigation").css({"display":"inherit",'z-index':'1100'});
		$(".search_map").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});   
	});
	
	$('#filterBtn3').click(function () {
	    //alert("search3");
		$(".overlay").show();
		$('.overlay').css({'z-index':'1099'});
		$(".search_favorite").css({"display":"inherit",'z-index':'1100'});
		$(".search_map").css({"display":"none"});
		$(".search_navigation").css({"display":"none"});
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
	});
	
	// 상세정보 - 검색결과
	$('.result-list-table').click(function(){
		$('.charger_Information').css({'display':'inherit','z-index':'110'});
		
	});
	
	// 상세정보 - 즐겨찾기
	$('.favorite-list').click(function(){
		$('.charger_Information').css({'display':'inherit','z-index':'110'});
	});
	
	// 검색
	$('.btn-search').click(function(){
		
		$('.search-filter').css({'display':'none'})
		$('.result-list').css({'display':'inherit'})
		// Make an AJAX call to fetch data
		                $.ajax({
		                    url: '/fetchCoordinates',
		                    method: 'GET',
		                    dataType: 'json',
		                    success: function(data) {
		                        var $resultList = $('#resultList');
		                        $resultList.empty(); // Clear previous results

		                        data.forEach(function(item) {
		                            var $listItem = $('<li></li>').text(item.name + ' - ' + item.address);
		                            $resultList.append($listItem);
		                        });
		                    },
		                    error: function(err) {
		                        console.error('Error fetching coordinates:', err);
		                    }
		                });
	});
	
	// 재검색
	$('.btn-back').click(function(event){
		event.stopPropagation();
		event.preventDefault();
			
		$('.search-filter').css({'display':'inherit'})
		$('.result-list').css({'display':'none'})
	});
	
	// 검색 초기화
	$('.btn-reset').click(function(event){
	    event.stopPropagation();
	    event.preventDefault();
	    
	    $('#type').val('all');
	    $('#area').val('all');
	    $('#loc').val('all');
	    $('#name').val('all');
	    $('#name_detail').val('');
	});
	
	//상세정보
	$('.closeInfo').click(function(event){
		event.stopPropagation();
		event.preventDefault();
		
		var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		currentClickedMarker.setImage(originalImage);
		currentClickedMarker.isClicked = false;
		
		// 화면을 원래대로 복귀
		$('.overlay').hide();
		$('.charger_Information').css({'display':'none','z-index':'-1'});
	});
	
	// 즐겨찾기
	$('.setFavorite').click(function(event) {
	    event.stopPropagation();
		event.preventDefault();
	               
		var img = $('#favoriteImage');
		var currentSrc = img.attr('src');
	    var newImageUrl = (currentSrc === '/images/ev/like_off.png') ? '/images/ev/like_on.png' : '/images/ev/like_off.png';
	    img.attr('src', newImageUrl);
	});
	
	

});