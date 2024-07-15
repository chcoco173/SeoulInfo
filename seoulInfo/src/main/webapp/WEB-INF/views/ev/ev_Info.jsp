<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 - 상세정보</title>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- ev css -->
<link href="/css/evInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="charger_Information">
		<table class="title">
			<tr>
				<td >
				<button class="setFavorite">
					<img src="" alt="찜이미지">
				</button>
				</td>
				<td style="width:75%; text-align:center;">
				<span >충전소 이름</span>
				</td>
				<td style="width:10%">
				<button class="setFavorite">X</button>
				</td>
			</tr>
		</table>
		<hr>
		<div class="InfoDetail">
			<p>충전기</p>
			<table>
				<thead>
					<td>구분
					</td>
					<td>충전기 타입
					</td>
					<td>충전기 상태<br>(갱신일시)
					</td>
				</thead>
				<tbody>
					<tr>
						<td>급속</td>
						<td>DC콤보</td>
						<td>사용가능<br>(시간)
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<p>상세정보</p>
			<table>
				<tr>
					<td>도로명 주소</td>
					<td> ~ </td>
				</tr>
				<tr>
					<td>상세위치</td>
					<td> ~ </td>
				</tr>
				<tr>
					<td>운영기관</td>
					<td> ~ </td>
				</tr>
				<tr>
					<td> 연락처 </td>
					<td> ~ </td>
				</tr>
				<tr>
					<td> 충전요금 </td>
					<td> ~ </td>
				</tr>
				<tr>
					<td> 참고사항 </td>
					<td> ~ </td>
				</tr>
			<table>
		</div>
	</div>
	<!-- jQuery 및 Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
