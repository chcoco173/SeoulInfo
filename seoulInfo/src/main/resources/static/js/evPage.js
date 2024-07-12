$(function(){
	
	// 중개인 버튼 클릭 시, overlay 실행
	$(".open-btn").click(function() {
	    $(".overlay").fadeIn();
		/*
			    $('.searchFilter').css({'display': 'flex'});
				$('.search button').css({'background-color': 'yellowgreen'})
			    $('.navigationFilter').css({'display': 'none'});
				$('.navigation button').css({'background-color': 'orange'})
			    $('.likeFilter').css({'display': 'none'});
				$('.like button').css({'background-color': 'orange'})
				*/
	});
	// 취소 버튼 클릭 시, overlay 종료
	$(".close-btn").click(function() {
	    $(".overlay").fadeOut();
	});
	// 오버레이 내부를 클릭할 때 이벤트 전파를 방지합니다.
	$(".overlay-inner").click(function(event){
	    event.stopPropagation();
	});

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
	
	
	
	$('.login').click(function(){
		$('.afterLogin').css({"display":"inherit"});
		$('.beforeLogin').css({"display":"none"});
	});
	
	
	
	
	$('.navigation').click(function () {
	    //alert("navi");
	    $('.navigationFilter').css({'display': 'flex'});
		$('.navigation button').css({'background-color': 'yellowgreen'})
	    $('.searchFilter').css({'display': 'none'});
		$('.search button').css({'background-color': 'orange'});
	    $('.likeFilter').css({'display': 'none'});
		$('.like button').css({'background-color': 'orange'})
	});
	
	$('.like').click(function () {
	    //alert("like");
	    $('.likeFilter').css({'display': 'flex'});
		$('.like button').css({'background-color': 'yellowgreen'})
	    $('.navigationFilter').css({'display': 'none'});
		$('.navigation button').css({'background-color': 'orange'})
	    $('.searchFilter').css({'display': 'none'});
		$('.search button').css({'background-color': 'orange'});
	});

});
