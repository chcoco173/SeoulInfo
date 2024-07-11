<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4820"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>지도 생성하기</title>
	<link href="/css/evMain.css" rel="stylesheet" type="text/css">
	
	<!-- template default setting -->
	<meta content="Sightseer - Webflow Travel Photography Website Template"
		name="description">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	<link href="/css/normalize.css" rel="stylesheet" type="text/css">
	<link href="/css/webflow.css" rel="stylesheet" type="text/css">
	<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
		type="text/css">
	
	<link href="https://fonts.googleapis.com" rel="preconnect">
	<link href="https://fonts.gstatic.com" rel="preconnect"
		crossorigin="anonymous">

	<script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
	<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
	<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link href="/images/webclip.png" rel="apple-touch-icon">
	<style>
	/* 기본 CSS 설정 */
	#map {
		width: 50%;
		height: 1000px;
		position: relative; /* Position 설정 */
		z-index: -99
	}
	
	.map-filter {
		position: absolute; /* 절대 위치 설정 */
		z-index: 100; /* z-index 설정 */
		background-color: rgba(255, 255, 255, 0.8); /* 배경색 및 투명도 설정 */
		width: 100%;
		height: 100%;
	}
	
	/* kakao map - style*/
		#mapwrap{position:relative;overflow:hidden;}
		.category, .category *{margin:0;padding:0;color:#000;}   
		.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
		.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
		.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
		.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
		.category .ico_coffee {background-position:-10px 0;}  
		.category .ico_store {background-position:-10px -36px;}   
		.category .ico_carpark {background-position:-10px -72px;}
	</style>
</head>
<body>
	<div class="page-wrapper">
		<div class="navigation-wrapper">
			<div data-animation="default" data-collapse="medium"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="navbar_m w-nav">
				<div class="nav-wrapper">
					<a href="index" aria-current="page"
						class="brand w-nav-brand w--current"><img
						src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
						alt=""></a>
					<div class="links-and-search-wrapper">
						<nav role="navigation" class="nav-links-wrapper w-nav-menu">
							<a href="about" class="nav-link w-nav-link">About</a> <a
								href="contact" class="nav-link w-nav-link">Contact</a>
						</nav>
						<form action="/search"
							data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
							class="search w-form">
							<div class="search-div">
								<img src="/images/ph_magnifying-glass-light-xsmall.svg"
									loading="lazy" alt="" class="icon-1x1-xsmall">
							</div>
							<div class="nav-search-outer-wrapper">
								<div class="nav-search-internal-wrapper">
									<input class="form-field w-input" maxlength="256" name="query"
										placeholder="Search…" type="search" id="search" required="">
									<div class="search-button-wrapper">
										<input type="submit" class="button-primary-small w-button"
											value="Search"> <a
											data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
											class="close-search-link-block w-inline-block"><img
											src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
											class="icon-1x1-xsmall"></a>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="menu-button w-nav-button">
						<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
							class="icon-1x1-xsmall">
					</div>
				</div>
			</div>
		</div>
		<br>
		<hr />
		<!-- end of header -->
		<div class="container">
			<div class="mapFilter">
				<table style="padding-left: 10%;" class="filter">
					<tr>
						<td style="width: 20%;">
							<div>
								<div class="service">
								<span class="search"><button>검색</button></span> | 
								<span class="navigation"><button>길찾기</button></span> | 
								<span class="like"><button>즐겨찾기</button>
								</div>
							</div><br/>
							
							
		<!-- search tag --> <section class="searchFilter">
								<form>
		<!-- search tag:type --><div>충전기 종류</div>
									<select class="chType" name="chType" id="chType" >
										<option>전체선택</option>
										<option>AC3상</option>
										<option>AC완속</option>
										<option>DC차데모</option>
										<option>DC차데모+AC3상</option>
										<option>DC차데모+AC3상+DC콤보</option>
										<option>DC차데모+DC콤보</option>
										<option>DC콤보</option>
									</select>
									<br/>
		<!-- search tag:dept --><div>담당기관</div>
									<select class="chDept" name="chDept" id="chDept">
										<option>환경부</option>
										<option>한국전력</option>
										<option>타기관</option>
									</select>
									<br/>
		<!-- search tag:area --><div>지역</div>
									<select class="area" name="area" id="area">
										<option>강남구</option>
										<option>강동구</option>
										<option>강서구</option>
										<option>강남구</option>
										<option>강북구</option>
										<option>관악구</option>
										<option>광진구</option>
										<option>구로구</option>
										<option>금천구</option>
										<option>노원구</option>
										<option>동대문구</option>
										<option>도봉구</option>
										<option>동작구</option>
										<option>마포구</option>
										<option>서대문구</option>
										<option>성동구</option>
										<option>성북구</option>
										<option>서포구</option>
										<option>송파구</option>
										<option>영등포구</option>
										<option>용산구</option>
										<option>양천구</option>
										<option>은평구</option>
										<option>종로구</option>
										<option>중구</option>
										<option>중랑구</option>
									</select><br/>
									<div style="display : inline-block;">
			<!-- search tag:name --><select class="detail" name="detail" id="detail">
										<option>전체</option>
										<option value="name">지역명</option>
										<option value="chName">충전소명</option>
									</select>
									<input placeholder="test" class="textSearch" name="textSearch"	id="textSearch" >
									</div><br>
									<button>검색</button>
									<button>초기화</button>
									<br>
								</form>
	  <!-- end of search --></section> 
	  <!-- navgation part--><section class="navigationFilter">
								
							</section>
	  <!-- end of navigation section-->
							
	  <!-- like section --> <section class="likeFilter">
								
							</section> <!-- end of like section --></td>
					</tr>
				</table>
	 <!-- end of service-->
	 <!-- result -->
				<section>
					<dd>
						<dl>
							<div>
								<img src="" alt="mark">&nbsp; <span>test</span> &nbsp; <span>using</span>
								<label htmlFor=""></label>
							</div>
						</dl>
						<dl>
							<img src="" alt="mark2">&nbsp;
							<span>test</span> &nbsp;
							<span>using</span>
							<label htmlFor=""></label>
						</dl>
					</dd>
				</section>
				<!-- end of result section-->
			</div>
			<!-- Map container -->
			<div class="map">			
				<div id="mapwrap"> 
				    <!-- 지도가 표시될 div -->
				    <div id="map" style="width:1450px;height:775px;"></div>
				    <!-- 지도 위에 표시될 마커 카테고리 -->
				    <div class="category">
				        <ul>
				            <li id="coffeeMenu" onclick="changeMarker('coffee')">
				                <span class="ico_comm ico_coffee"></span>
				                커피숍
				            </li>
				            <li id="storeMenu" onclick="changeMarker('store')">
				                <span class="ico_comm ico_store"></span>
				                편의점
				            </li>
				            <li id="carparkMenu" onclick="changeMarker('carpark')">
				                <span class="ico_comm ico_carpark"></span>
				                주차장
				            </li>
				        </ul>
				    </div>
				</div>
			</div>
		<!-- end of Map container -->
		</div>
		<!-- end of total container -->
	</div>
	<!-- end of Page -->
	
	<!-- template default script-->

	<script src="/js/webflow.js" type="text/javascript"></script>
	<script src="/js/evPage.js" type="text/javascript"></script>
	
	<!-- kakao map : script -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4d5069dc9a490e0b400e0844235a47e&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
	        level: 3 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 커피숍 마커가 표시될 좌표 배열입니다
	var coffeePositions = [ 
	    new kakao.maps.LatLng(37.499590490909185, 127.0263723554437),
	    new kakao.maps.LatLng(37.499427948430814, 127.02794423197847),
	    new kakao.maps.LatLng(37.498553760499505, 127.02882598822454),
	    new kakao.maps.LatLng(37.497625593121384, 127.02935713582038),
	    new kakao.maps.LatLng(37.49646391248451, 127.02675574250912),
	    new kakao.maps.LatLng(37.49629291770947, 127.02587362608637),
	    new kakao.maps.LatLng(37.49754540521486, 127.02546694890695)                
	];

	// 편의점 마커가 표시될 좌표 배열입니다
	var storePositions = [
	    new kakao.maps.LatLng(37.497535461505684, 127.02948149502778),
	    new kakao.maps.LatLng(37.49671536281186, 127.03020491448352),
	    new kakao.maps.LatLng(37.496201943633714, 127.02959405469642),
	    new kakao.maps.LatLng(37.49640072567703, 127.02726459882308),
	    new kakao.maps.LatLng(37.49640098874988, 127.02609983175294),
	    new kakao.maps.LatLng(37.49932849491523, 127.02935780247945),
	    new kakao.maps.LatLng(37.49996818951873, 127.02943721562295)
	];

	// 주차장 마커가 표시될 좌표 배열입니다
	var carparkPositions = [
	    new kakao.maps.LatLng(37.49966168796031, 127.03007039430118),
	    new kakao.maps.LatLng(37.499463762912974, 127.0288828824399),
	    new kakao.maps.LatLng(37.49896834100913, 127.02833986892401),
	    new kakao.maps.LatLng(37.49893267508434, 127.02673400572665),
	    new kakao.maps.LatLng(37.49872543597439, 127.02676785815386),
	    new kakao.maps.LatLng(37.49813096097184, 127.02591949495914),
	    new kakao.maps.LatLng(37.497680616783086, 127.02518427952202)                       
	];    

	var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
	    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
	    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
	    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

	    
	createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
	createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
	createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

	changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
	function createMarkerImage(src, size, options) {
	    var markerImage = new kakao.maps.MarkerImage(src, size, options);
	    return markerImage;            
	}

	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	function createMarker(position, image) {
	    var marker = new kakao.maps.Marker({
	        position: position,
	        image: image
	    });
	    
	    return marker;  
	}   
	   
	// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
	function createCoffeeMarkers() {
	    
	    for (var i = 0; i < coffeePositions.length; i++) {  
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {  
	                spriteOrigin: new kakao.maps.Point(10, 0),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };     
	        
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	            marker = createMarker(coffeePositions[i], markerImage);  
	        
	        // 생성된 마커를 커피숍 마커 배열에 추가합니다
	        coffeeMarkers.push(marker);
	    }     
	}

	// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setCoffeeMarkers(map) {        
	    for (var i = 0; i < coffeeMarkers.length; i++) {  
	        coffeeMarkers[i].setMap(map);
	    }        
	}

	// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
	function createStoreMarkers() {
	    for (var i = 0; i < storePositions.length; i++) {
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(10, 36),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	            marker = createMarker(storePositions[i], markerImage);  

	        // 생성된 마커를 편의점 마커 배열에 추가합니다
	        storeMarkers.push(marker);    
	    }        
	}

	// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setStoreMarkers(map) {        
	    for (var i = 0; i < storeMarkers.length; i++) {  
	        storeMarkers[i].setMap(map);
	    }        
	}

	// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
	function createCarparkMarkers() {
	    for (var i = 0; i < carparkPositions.length; i++) {
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(10, 72),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	            marker = createMarker(carparkPositions[i], markerImage);  

	        // 생성된 마커를 주차장 마커 배열에 추가합니다
	        carparkMarkers.push(marker);        
	    }                
	}

	// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setCarparkMarkers(map) {        
	    for (var i = 0; i < carparkMarkers.length; i++) {  
	        carparkMarkers[i].setMap(map);
	    }        
	}

	// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
	function changeMarker(type){
	    
	    var coffeeMenu = document.getElementById('coffeeMenu');
	    var storeMenu = document.getElementById('storeMenu');
	    var carparkMenu = document.getElementById('carparkMenu');
	    
	    // 커피숍 카테고리가 클릭됐을 때
	    if (type === 'coffee') {
	    
	        // 커피숍 카테고리를 선택된 스타일로 변경하고
	        coffeeMenu.className = 'menu_selected';
	        
	        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
	        storeMenu.className = '';
	        carparkMenu.className = '';
	        
	        // 커피숍 마커들만 지도에 표시하도록 설정합니다
	        setCoffeeMarkers(map);
	        setStoreMarkers(null);
	        setCarparkMarkers(null);
	        
	    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
	    
	        // 편의점 카테고리를 선택된 스타일로 변경하고
	        coffeeMenu.className = '';
	        storeMenu.className = 'menu_selected';
	        carparkMenu.className = '';
	        
	        // 편의점 마커들만 지도에 표시하도록 설정합니다
	        setCoffeeMarkers(null);
	        setStoreMarkers(map);
	        setCarparkMarkers(null);
	        
	    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
	     
	        // 주차장 카테고리를 선택된 스타일로 변경하고
	        coffeeMenu.className = '';
	        storeMenu.className = '';
	        carparkMenu.className = 'menu_selected';
	        
	        // 주차장 마커들만 지도에 표시하도록 설정합니다
	        setCoffeeMarkers(null);
	        setStoreMarkers(null);
	        setCarparkMarkers(map);  
	    }    
	} 
	</script>
</body>
</html>