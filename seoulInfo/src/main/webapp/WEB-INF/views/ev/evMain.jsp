<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- 모바일 화면 확대 방지-->
   <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
   <title>지도 생성하기</title>
   
   <!-- template default setting -->
   <meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
   <meta content="width=device-width, initial-scale=1" name="viewport">
   <meta content="Webflow" name="generator">
   
   <link href="/css/normalize.css" rel="stylesheet" type="text/css">
   <link href="/css/webflow.css" rel="stylesheet" type="text/css">
   <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">

   <link href="https://fonts.googleapis.com" rel="preconnect">
   <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
   <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
   <link href="/images/webclip.png" rel="apple-touch-icon">
   
   <script type="text/javascript">WebFont.load({ google: { families: ["Plus Jakarta Sans:regular,600,italic,600italic"] }});</script>
   <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
   
   <!-- EV add -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link href="/css/ev/evMain.css" rel="stylesheet" type="text/css">
   
   <!-- Bootstrap core CSS -->
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<!-- header navigation -->
   <div class="navigation-wrapper">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
         <div class="nav-wrapper">
            <a href="/" aria-current="page" class="brand w-nav-brand w--current">
               <img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt="">
            </a>
            <div class="links-and-search-wrapper">
               <nav role="navigation" class="nav-links-wrapper w-nav-menu">
                  <a href="/about" class="nav-link w-nav-link">About</a> 
                  <a href="/contact" class="nav-link w-nav-link">Contact</a>
               </nav>
               <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
                  <div class="search-div">
                     <img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
                  </div>
                  <div class="nav-search-outer-wrapper">
                     <div class="nav-search-internal-wrapper">
                        <input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                        <div class="search-button-wrapper">
                           <input type="submit" class="button-primary-small w-button" value="Search">
                           <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block">
                              <img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
                           </a>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
            <div class="menu-button w-nav-button">
               <img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
            </div>
         </div>
      </div>
   </div><br/><hr/>
<!-- end of header navigation -->

<!-- kakao map API -->
   <div class="map_wrap">
       <div id="map"></div>
      <table class="serviceCate" style="width: 100%; text-align:center;">
         <tr>
			<td>
				<a href="ev_Navigation"><button class="filter btn btn-success" id="filterBtn2">길찾기</button></a>
			</td>
            <td>
               <button class="filter btn btn-primary" id="filterBtn1">충전소 검색</button>
            </td>
            <td>
               <button class="filter btn btn-secondary" id="filterBtn3">즐겨찾기</button>
            </td>
         </tr>
      </table>
      
       <ul id="category" style="">
           <li id="BK9" data-order="0"> 
               <span class="category_bg bank"></span>
               AC3상
           </li>       
           <li id="MT1" data-order="1"> 
               <span class="category_bg mart"></span>
               AC3상
           </li>  
           <li id="PM9" data-order="2"> 
               <span class="category_bg pharmacy"></span>
               DC차<br>데모
           </li>  
           <li id="OL7" data-order="3"> 
               <span class="category_bg oil"></span>
               DC차<br>콤보
           </li>  
<!--           <li id="CE7" data-order="4"> 
               <span class="category_bg cafe"></span>
               DC차<br>데모
           </li>  
           <li id="CS2" data-order="5"> 
               <span class="category_bg store"></span>
               편의점
           </li> -->
       </ul>
	   
	   <div id="map_show_type" >
		   	<button class="btn btn-info" id="btnTerrain" data-enabled="false" onclick="setOverlayMapTypeId()">
				지형도
			</button>
	   </div>
   </div>
   <!--페이지 수정-->
   <div class="service_list">
      <%@include file="./ev_MapFilter.jsp"%>      
   </div>
   <!--
   <div class="service_list">
      <%@include file="./ev_Navigation.jsp"%>
   </div>
   -->
   <div class="service_list">
      <%@include file="./ev_Favorite.jsp"%>
   </div>
   <div class="service_detail">
   <%@include file="./ev_Info.jsp"%>
   <div>
<!-- end of kakao map API -->

<!-- kakao map Script-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e4d5069dc9a490e0b400e0844235a47e&libraries=services"></script>
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), 				// 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], 												// 마커를 담을 배열입니다
		    currCategory = ''; 											// 현재 선택된 카테고리를 가지고 있을 변수입니다
			
		// 지도를 표시할 div
		var mapContainer = document.getElementById('map'), 
			// 지도의 중심좌표, 확대 레벨 및 최대 확대 설정 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567),
		        level: 8,
				maxLevel: 8 
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 

		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);  

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    
		    // 커스텀 오버레이를 숨깁니다 
		    placeOverlay.setMap(null);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		    } else if (status === kakao.maps.services.Status.ERROR) {
		        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		        
		    }
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    var order = document.getElementById(currCategory).getAttribute('data-order');

		    

		    for ( var i=0; i<places.length; i++ ) {

		            // 마커를 생성하고 지도에 표시합니다
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		   
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>';

		    contentNode.innerHTML = content;
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}


		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;

		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;

		    placeOverlay.setMap(null);

		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;

		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }

		    if (el) {
		        el.className = 'on';
		    } 
		}
	// --------------------------------------------------------------------------------------------------------
	
	// 서울시 좌표 범위 설정
	var seoulBounds = new kakao.maps.LatLngBounds(
		    new kakao.maps.LatLng(37.413294, 126.734086), // 남서쪽 좌표
		    new kakao.maps.LatLng(37.715133, 127.269311)  // 북동쪽 좌표
		);
		
	// 지도의 중심이 서울시 좌표 범위를 벗어날 때 초기 중심으로 되돌리기
	kakao.maps.event.addListener(map, 'center_changed', function() {
		var center = map.getCenter();
		if (!seoulBounds.contain(center)) {
			map.setCenter(new kakao.maps.LatLng(37.5665, 126.9780)); // 초기 중심 좌표
			alert("서울시 정보만 제공됩니다.");
			}
			
		});

	// --------------------------------------------------------------------------------------------------------
	var mapTypes = {
	    terrain: kakao.maps.MapTypeId.TERRAIN
	};

	function setOverlayMapTypeId() {
	    var btnTerrain = document.getElementById('btnTerrain');
	    var isTerrainEnabled = btnTerrain.getAttribute('data-enabled') === 'true';

	    if (isTerrainEnabled) {
	        map.removeOverlayMapTypeId(mapTypes.terrain);
	        btnTerrain.setAttribute('data-enabled', 'false');
	        btnTerrain.innerText = "지형도";
			btnTerrain.classList.remove('btn-warning'); // 기존 클래스 제거
			btnTerrain.classList.add('btn-info'); // 새로운 클래스 추가
	    } else {
	        map.addOverlayMapTypeId(mapTypes.terrain);
	        btnTerrain.setAttribute('data-enabled', 'true');
	        btnTerrain.innerText = "이미지";
			btnTerrain.classList.remove('btn-info'); // 기존 클래스 제거
			btnTerrain.classList.add('btn-warning'); // 새로운 클래스 추가
	    }
	}


	</script>
<!-- end of kakao map Script -->
   <script src="/js/webflow.js" type="text/javascript"></script>
   <script src="/js/evPage.js" type="text/javascript"></script>
</body>
</html>

