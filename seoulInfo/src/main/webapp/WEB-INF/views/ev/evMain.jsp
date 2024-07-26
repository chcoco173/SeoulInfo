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

   <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
   <link href="/images/webclip.png" rel="apple-touch-icon">
   
   <!-- EV setting -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link href="/css/ev/evMain.css" rel="stylesheet" type="text/css">
   
   <!-- Bootstrap core CSS -->
   <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <style>
           #loading {
               position: fixed;
               top: 0;
               left: 0;
               width: 100%;
               height: 100%;
               background: rgba(255, 255, 255, 0.8);
               display: flex;
               justify-content: center;
               align-items: center;
               z-index: 9999;
               flex-direction: column;
           }

           .spinner-border {
               width: 3rem;
               height: 3rem;
               margin-bottom: 1rem;
           }

           .loading-text {
               font-size: 1.5rem;
               font-weight: bold;
           }
       </style>
</head>
<body onload="initMap()">
<!-- Overlay for black background -->
    <div class="overlay"></div>
<!-- Delay for page loading -->
<div id="loading">
        <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
        </div>
        <div class="loading-text">Loading . . .</div>
    </div>
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
   <div class="map_wrap after-loading">
	<div  onload="initMap()">
       <div id="map"></div>
	   </div>
	  <!-- service Buttons -->
      <table class="serviceCate" style="width: 100%; text-align:center;">
         <tr>
			<td style="width:33%">
				<a href="/ev/ev_Navigation"><button class="filter btn btn-success" id="filterBtn2">길찾기</button></a>
			</td>
            <td style="width:33%">
               <button class="filter btn btn-primary" id="filterBtn1">충전소 검색</button>
            </td>
            <td style="width:33%">
               <button class="filter btn btn-secondary" id="filterBtn3">즐겨찾기</button>
            </td>
         </tr>
      </table>
		<!-- convenience category Buttons -->
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
	   <!-- show diffrent map type-->
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=008b79e594d7ab4e1058e1180ccf546c&libraries=clusterer"></script>
    <script>
		// ## delay 1 - 로딩 바 표시
		document.getElementById('loading').style.display = 'flex';
		
		// ########### 지도 생성 ############## 
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 8,
            maxLevel: 8 // 확대 최대 레벨
        };  
        var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// ######## 마커/클러스터러 생성 ##############
		// 각 DB data의 위도,경도를 forEach 문으로 마커정보 담기
        var positions = [
            <c:forEach var="coordinate" items="${evStationList}" varStatus="status">
                {
                    title: "${coordinate.evc_id}",
                    latlng: new kakao.maps.LatLng(${coordinate.evc_lat}, ${coordinate.evc_long})
                }
                <c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
		console.log(positions);

        var imageSrc = "/images/ev/ev_normal.png"; 
        var clickedImageSrc = "/images/ev/ev_click.png"; 

        var markers = [];
        var imageSize = new kakao.maps.Size(30, 30); 

        var currentClickedMarker = null;

        for (var i = 0; i < positions.length; i++) {        
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            var marker = new kakao.maps.Marker({
                position: positions[i].latlng,
                title: positions[i].title,
                image: markerImage,
                isClicked: false,
            });
			//마커에 클릭 기능 넣어주기 
            (function(marker) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    if (currentClickedMarker && currentClickedMarker !== marker) {
                        var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                        currentClickedMarker.setImage(originalImage);
                        currentClickedMarker.isClicked = false;
                    }

                    if (marker.isClicked) {
                        var originalImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                        marker.setImage(originalImage);
                        marker.isClicked = false;
                    } else {
                        var clickedImage = new kakao.maps.MarkerImage(clickedImageSrc, imageSize);
                        marker.setImage(clickedImage);
                        marker.isClicked = true;
                        currentClickedMarker = marker;

                        $('.overlay').show();
						$('.overlay').css({'z-index':'1099'});
                        $('.charger_Information').show();
						$(".charger_Information").css({"display":"inherit",'z-index':'1100'});
						
						// alert(marker.Gb);
						// AJAX 요청 보내기 - 마커에 해당하는 상세정보 불러오기
						$.ajax({
							url: 'ev_info',
							type: 'GET',
							data: { evc_id: marker.Gb },
							success: function(data) {
								console.log('data: '+data);
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
											$('#charger_facsmall').text(data[0].charger_facsmall);
											$('#charger_opsmall').text(data[0].charger_opsmall);
											$('#charger_userlimit').text(data[0].charger_userlimit);
											$('.charger_Information').show();
								        } else {
											var chargerDetailsBody = $('#chargerDetailsBody');
											chargerDetailsBody.empty();
											alert('No data found');
								            console.log('No data found');
											$('.charger_Information').hide();
											$('.overlay').hide();
								        }
							},
							error: function(err) {
							console.error("Error fetching charger info: ", err);
							}
						});
                    }
                });
            })(marker);
            markers.push(marker);
			console.log(marker);
        }
        
        var clusterer = new kakao.maps.MarkerClusterer({
            map: map,
            averageCenter: true,
            minLevel: 4,
            disableClickZoom: true
        });
        
        clusterer.addMarkers(markers);
		
		// ## delay 2 - 지도 로드 완료 이벤트 등록
		kakao.maps.event.addListener(map, 'tilesloaded', function() {
		document.getElementById('loading').style.display = 'none';
		});
		
		// ######## 클러스터러 확대 이벤트 ##############
        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
            var level = map.getLevel() - 1;
            map.setLevel(level, { anchor: cluster.getCenter() });			
        });

		// ######## 서울 범위 밖에 이동 시, 중심 지로 이동하는 기능 ####################
        var seoulBounds = new kakao.maps.LatLngBounds(
            new kakao.maps.LatLng(37.413294, 126.734086),
            new kakao.maps.LatLng(37.715133, 127.269311)
        );

        kakao.maps.event.addListener(map, 'center_changed', function() {
            var center = map.getCenter();
            if (!seoulBounds.contain(center)) {
                map.setCenter(new kakao.maps.LatLng(37.5665, 126.9780));
                alert("서울시 정보만 제공됩니다.");
            }
        });
		
		// ######## 지도 이미지 변경 이벤트 ##############
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
                btnTerrain.classList.remove('btn-warning');
                btnTerrain.classList.add('btn-info');
            } else {
                map.addOverlayMapTypeId(mapTypes.terrain);
                btnTerrain.setAttribute('data-enabled', 'true');
                btnTerrain.innerText = "이미지";
                btnTerrain.classList.remove('btn-info');
                btnTerrain.classList.add('btn-warning');
            }
        }
		
		// ##########################  test  ###########################
		
		
</script>

<!-- end of kakao map Script -->
   <script src="/js/webflow.js" type="text/javascript"></script>
   <script src="/js/evPage.js" type="text/javascript"></script>
</body>
</html>


