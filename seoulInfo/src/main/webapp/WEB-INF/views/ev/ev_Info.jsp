<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 - 상세정보</title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
							 <br><span>{(갱신한 시간)}</span>
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
		    $(document).ready(function() {
            $('.closeInfo').click(function() {
				$('.overlay').hide();
				$('.overlay').css({'display':'none','z-index':'-1'});
				$('.charger_Information').hide();
				$('.charger_Information').css({'display':'none','z-index':'-1'});
            });
        });
    </script>
</body>
</html>
