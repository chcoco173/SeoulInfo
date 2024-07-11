$(function(){
	
	$('.filterOpen').click(function(){
		//alert("test");
		$('#map').css({'width':'80%'})
		$('.mapFilter').css({'display':'inline-block'})
	});

	$('.search').click(function () {
	    //alert("search");
	    $('.searchFilter').css({'display': 'flex'});
		$('.search button').css({'background-color': 'yellowgreen'})
	    $('.navigationFilter').css({'display': 'none'});
		$('.navigation button').css({'background-color': 'orange'})
	    $('.likeFilter').css({'display': 'none'});
		$('.like button').css({'background-color': 'orange'})
		
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
