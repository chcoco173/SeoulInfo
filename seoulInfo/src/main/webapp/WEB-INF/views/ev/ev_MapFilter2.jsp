<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 -검색</title>
</head>
<body>

	
<div class="search_map">
	<p style=" text-align: center"><b> 충전소 검색 </b></p><hr>
	<form>
	<table>
		<tr>
			<td>충전기 타입</td>
			<td>
				<select name="type" style="width:100%">
					<option>전체</option>
					<option>AC3상</option>
					<option>AC완속</option>
					<option>DC차데모</option>
					<option>DC차데모+AC3상</option>
					<option>DC차데모+AC3상+DC콤보</option>
					<option>DC차데모+DC콤보</option>
					<option>DC콤보</option>
				<select>
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>
			<td>지역 선택</td>
			<td>
				<select name="area" style="width:100%">
					<option>전체</option>
					<option>강남구</option>
					<option>강동구</option>
					<option>강서구</option>
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
					<option>서초구</option>
					<option>송파구</option>
					<option>영등포구</option>
					<option>용산구</option>
					<option>양천구</option>
					<option>은평구</option>
					<option>종로구</option>
					<option>중구</option>
					<option>중랑구</option>
				</select>
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>				
			<td>운영시설</td>
			<td>
				<select name="loc" style="width:100%">
					<option>전체</option>
					<option>환경부</option>
					<option>타기관</option>
				</select>
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>
			<td style="width: 40%;">검색</td>
			<td>
				<select name="name" style="width:100%">
					<option>전체</option>
					<option>지역명</option>
					<option>충전소명</option>
				</select>
				<input name="name_detail" type="text" placeholder="검색어를 입력하세요." style="width:100%">
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>
			<td style="width:40%">
				<button class="btn btn-primary" > 검색 </button>
			</td>
			<td style="width:40%">
				<button class="btn btn-danger" > 초기화 </button>
			<td>
		</tr>
	</table>
	<div  >
		<dl class="result_list" style="display:none;">
			<dd>1</dd>
			<dd>2</dd>
			<dd>3</dd>
			<dd>4</dd>
			<dd>5</dd>
			<dd>6</dd>
			<dd>7</dd>
			<dd>8</dd>
			<dd>9</dd>
			<dd>0</dd>
		</dl>
	</div>
	
	<!-- template default script-->
	<script src="/js/webflow.js" type="text/javascript"></script>
	
</body>
</html>