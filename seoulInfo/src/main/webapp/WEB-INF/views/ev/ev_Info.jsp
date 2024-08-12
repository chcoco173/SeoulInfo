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
	<div id="loadingBar" class="progress" style="height: 20px; display:none;">
	    <div id="loadingBarProgress" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
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
		<div id="roadview" style="width:100%;height:300px;margin-top:10px;"></div><br>
		<span id="charger_opsmall" style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"></span>
		<span id="charger_facsmall" style="border:1px solid orange; border-radius:5px; background-color: yellow; padding-left:10px; padding-right:10px; text-align:center"></span><hr>
        <div class="InfoDetail">
			<span><h5><b>주소</b></h5></span>
			<div>
				<div>도로명 : <span id="evc_address"></span></div>
				
				
			</div>
			<hr>
            <table class="chargers" style="border: 2px solid green; border-radius:5px; text-align:center; ">
                <thead>
                    <tr>
						<th style="width:11%">충전기 no.</th>
                        <th colspan="2">충전기 정보	</th>
                        <th style="width:20%">충전기 상태<br/>(갱신일시)</th>
						<th style="width:18%">사용제한</th>
                    </tr>
                </thead>
                <tbody id="chargerDetailsBody">
                    <tr>
						<td ><b id="charger_no" style="font-size:23px;"></b></td>
                        <td id="charger_mechine"></td>
						<td class="charger_type"></td>
                        <td ><span id="charger_state" >점검중</td>
						<td class="charger_userlimit"></td>
                    </tr>
                </tbody>
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
	<script>

	</script>
</body>
</html>
