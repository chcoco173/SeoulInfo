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
	});
	
	// 닫기 버튼
	$('.btn-close').click(function(event){
		event.stopPropagation();
		event.preventDefault();
		
		$(".search_map").css({"display":"none"});
		$(".search_navigation").css({"display":"none"});
		$(".search_favorite").css({"display":"none"});
	});
	
	$('.result-list').click(function(){
		
	});

});