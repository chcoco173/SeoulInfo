<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 - 상세정보</title>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- ev css -->
<link href="/css/ev/evInfo.css" rel="stylesheet" type="text/css">

</head>
<body>
    <div class="charger_Information">
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

    <!-- jQuery 및 Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        function showChargerInfo(marker) {
            $('#ev_name').text(marker.info.name);
            $('#evc_address').text(marker.info.address);
            $('#charger_machine').text(marker.info.machine);
            $('#charger_type').text(marker.info.type);
            $('#charger_state').text(marker.info.state);
            $('#charger_facsmall').text(marker.info.facility);
            $('#charger_opsmall').text(marker.info.operator);
            $('#charger_userlimit').text(marker.info.userLimit);

            $('.charger_Information').show();
        }

        $(document).ready(function() {
            $('.closeInfo').click(function() {
                $('.charger_Information').hide();
            });
        });
    </script>
</body>
</html>
