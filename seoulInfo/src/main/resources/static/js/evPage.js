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
		$(".overlay").fadeIn();
		$(".search_map").css({"display":"inherit"});
		$(".search_favorite").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});
	});
	
	$('#filterBtn2').click(function () {
	    // alert("search2");
		$(".overlay").fadeIn();
		$(".search_navigation").css({"display":"inherit"});
		$(".search_map").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});
	});
	
	$('#filterBtn3').click(function () {
	    //alert("search3");
		$(".overlay").fadeIn();
		$(".search_favorite").css({"display":"inherit"});
		$(".search_map").css({"display":"none"});
		$(".search_navigation").css({"display":"none"});
	});
	
	// 즐겨찾기 로그인 
	$('.login').click(function(){
		$('.afterLogin').css({"display":"inherit"});
		$('.beforeLogin').css({"display":"none"});
		
		// 새 창의 크기
		var newWindowWidth = 1500;
		var newWindowHeight = 500;

		// 화면의 크기
		var screenWidth = window.screen.width;
		var screenHeight = window.screen.height;

		// 새 창의 위치 계산
		var leftPosition = (screenWidth / 2) - (newWindowWidth / 2);
		var topPosition = (screenHeight / 2) - (newWindowHeight / 2);

		// 새로운 윈도우 창 띄우기 (중앙에 위치하도록)
		window.open('/member/login', '로그인', 'width=' + newWindowWidth + ',height=' + newWindowHeight + ',top=' + topPosition + ',left=' + leftPosition);
		
	});
	
	
	
	// 닫기 버튼
	$('.btn-close').click(function(event){
		event.stopPropagation();
		event.preventDefault();
		
		$(".search_map").css({"display":"none"});
		$(".search_navigation").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});
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
		
		$('.charger_Information').css({'display':'none'})
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