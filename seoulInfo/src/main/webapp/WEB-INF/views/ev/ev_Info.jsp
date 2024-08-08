<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 - 상세정보</title>
    <link href="/css/ev/evInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="charger_Information" style="display: none;">
        <table class="title">
            <tr>
                <td>
                    <button class="setFavorite">
                        <img id="favoriteImage" src="/images/ev/like_off.png" alt="찜이미지">
                    </button>
                </td>
                <td style="text-align:center;">
                    <h3 class="ev_name"></h3>
					<h3 class="evc_id" style="display:none;"></h3>
                </td>
                <td>
                    <button type="button" class="btn btn-dark closeInfo">
                        <b>X</b>
                    </button>
                </td>
            </tr>
        </table>
        <hr>
        <div class="InfoDetail">
            <table class="chargers" style="border: 2px solid green; text-align:center">
                <thead>
                    <tr>
						<th style="width:11%">충전기 no.</th>
                        <th>구분		</th>
                        <th>충전 타입	</th>
                        <th>충전기 상태	<br/>(갱신일시)</th>
                    </tr>
                </thead>
                <tbody id="chargerDetailsBody">
                    <tr >
						<td ><b id="charger_no" style="font-size:23px;"></b></td>
                        <td id="charger_mechine"></td>
						<td class="charger_type"></td>
                        <td ><span style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"><b id="charger_state" >점검중</b></span>
							 <br><span>(갱신한 시간)</span>
						</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <p><h5><b>상세정보</b></h5></p>
            <table class="chargers_detail_info">
                <tr>
                    <td>도로명 주소</td>
                    <td id="evc_address"></td>
                </tr>
                <tr>
                    <td>상세위치</td>
                    <td class="ev_name"></td>
                </tr>
                <tr>
                    <td>시설구분</td>
                    <td id="charger_facsmall"></td>
                </tr>
                <tr>
                    <td>운영기관</td>
                    <td id="charger_opsmall"></td>
                </tr>
                <tr>
                    <td>참고사항</td>
                    <td id="charger_userlimit"></td>
                </tr>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
		// 클릭된 마커를 저장하는 변수
		var currentClickedMarker = null;

		$(document).ready(function() {
		    // 정보 창 닫기 버튼 클릭 이벤트
		    $('.closeInfo').click(function() {
		        closeInfoWindow();
		    });

		    // 마커 클릭 이벤트 예시 (모든 마커에 대해 적용)
		    function onMarkerClick(marker) {
		        return function() {
		            // 이미 클릭된 마커가 있을 경우
		            if (currentClickedMarker !== null) {
		                // 이전에 클릭된 마커를 원래 상태로 되돌림
		                var normalImageSrc = "/images/ev/ev_normal.png"; 
		                var normalImageSize = new kakao.maps.Size(30, 30);
		                var normalImage = new kakao.maps.MarkerImage(normalImageSrc, normalImageSize);
		                currentClickedMarker.setImage(normalImage);
		            }

		            // 현재 클릭된 마커를 업데이트
		            currentClickedMarker = marker;

		            // 클릭된 마커의 이미지 변경
		            var clickedImageSrc = "/images/ev/ev_click.png"; 
		            var clickedImageSize = new kakao.maps.Size(30, 30);
		            var clickedImage = new kakao.maps.MarkerImage(clickedImageSrc, clickedImageSize);
		            currentClickedMarker.setImage(clickedImage);

		            // 정보 창 등 관련 UI 표시 (필요시 추가)
		            $('.overlay').show();
		            $('.charger_Information').show();
		        };
		    }

		    // 마커 클릭 이벤트를 추가하는 예시
		    // markers 배열에 포함된 모든 마커에 클릭 이벤트 리스너 추가
		    markers.forEach(function(marker) {
		        kakao.maps.event.addListener(marker, 'click', onMarkerClick(marker));
		    });

		    // 정보 창을 닫고 상태 초기화 함수
		    function closeInfoWindow() {
		        // 오버레이와 충전기 정보 창 숨기기
		        $('.overlay').hide();
		        $('.charger_Information').hide();

		        // 클릭된 마커가 있는 경우, 원래 상태로 복원
		        if (currentClickedMarker !== null) {
		            var normalImageSrc = "/images/ev/ev_normal.png"; 
		            var normalImageSize = new kakao.maps.Size(30, 30);
		            var normalImage = new kakao.maps.MarkerImage(normalImageSrc, normalImageSize);
		            currentClickedMarker.setImage(normalImage);
		            currentClickedMarker = null; // 현재 클릭된 마커 초기화
		        }
		    }
		});
    </script>
</body>
</html>
