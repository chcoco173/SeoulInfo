<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<body onload="initMap()">
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
	<div  onload="initMap()">
       <div id="map"></div>
	   </div>
      <table class="serviceCate" style="width: 100%; text-align:center;">
         <tr>
			<td style="width:33%">
				<a href="https://openapi.sk.com/products/preview/tmap?svcSeq=4&menuSeq=4"><button class="filter btn btn-success" id="filterBtn2">길찾기</button></a>
			</td>
            <td style="width:33%">
               <button class="filter btn btn-primary" id="filterBtn1">충전소 검색</button>
            </td>
            <td style="width:33%">
               <button class="filter btn btn-secondary" id="filterBtn3">즐겨찾기</button>
            </td>
         </tr>
      </table>
      
       <ul id="category">
           <li id="BK9" data-order="0"> 
               <span class="category_bg bank"></span>
               은행
           </li>       
           <li id="MT1" data-order="1"> 
               <span class="category_bg mart"></span>
               마트
           </li>  
           <li id="PM9" data-order="2"> 
               <span class="category_bg pharmacy"></span>
               약국
           </li>  
           <li id="OL7" data-order="3"> 
               <span class="category_bg oil"></span>
               주유소
           </li>  
           <li id="CE7" data-order="4"> 
               <span class="category_bg cafe"></span>
               카페
           </li>  
           <li id="CS2" data-order="5"> 
               <span class="category_bg store"></span>
               편의점
           </li>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=008b79e594d7ab4e1058e1180ccf546c"></script>
	<script>
		// 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var mapOption = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567),
			level: 8,
			maxLevel: 8 // 확대 최대 레벨
		};  
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커를 표시할 위치와 title 객체 배열입니다 	
		var positions = [
			<c:forEach var="coordinate" items="${evStationList}" varStatus="status">
				{
					title: "${coordinate.evc_name}",
					latlng: new kakao.maps.LatLng(${coordinate.evc_lat}, ${coordinate.evc_long})
				}
				<c:if test="${!status.last}">,</c:if>
			</c:forEach>
		];
		
		// 기능 0 : 지도에 마커 표시 (100개 제한) ------------------------------------------------------------------
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		for (var i = 0; i < positions.length; i++) {
			// 마커 이미지의 이미지 크기입니다
			var imageSize = new kakao.maps.Size(24, 35); 
			
			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: positions[i].latlng, // 마커를 표시할 위치
				title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image: markerImage // 마커 이미지 
			});
		}
		// 기능 1 (지도 이동 범위 제한 : 서울시)------------------------------------------------------------------
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
					alert("서울시 정보만 제공됩니다.")
					}
				});
		// 기능 2 (지도 이미지 변환) -----------------------------------------------------------------------
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

