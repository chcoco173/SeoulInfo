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
                    <h3 id="ev_name">충전소 이름</h3>
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
            <p><h5><b>충전기 1</b></h5></p>
            <table class="chargers" style="border: 2px solid green">
                <thead>
                    <tr>
                        <th>구분</th>
                        <th>충전기 타입</th>
                        <th>충전기 상태<br>(갱신일시)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="charger_machine"></td>
                        <td id="charger_type"></td>
                        <td id="charger_state"><br>{(갱신한 시간)}</td>
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
                    <td id="evc_name"></td>
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
        function showChargerInfo(marker) {
            $.ajax({
                url: '/getChargerInfo',
                type: 'POST',
                data: { evc_id: marker.info.evc_id },
                success: function(data) {
                    $('#ev_name').text(data.evc_name);
                    $('#evc_address').text(data.evc_address);
                    $('#charger_machine').text(data.charger_machine);
                    $('#charger_type').text(data.charger_type);
                    $('#charger_state').text(data.charger_state);
                    $('#charger_facsmall').text(data.charger_facsmall);
                    $('#charger_opsmall').text(data.charger_opsmall);
                    $('#charger_userlimit').text(data.charger_userlimit);

                    $('.charger_Information').show();
                },
                error: function(err) {
                    console.error("Error fetching charger info: ", err);
                }
            });
        }

        $(document).ready(function() {
            $('.closeInfo').click(function() {
                $('.charger_Information').hide();
            });
        });
    </script>
</body>
</html>
