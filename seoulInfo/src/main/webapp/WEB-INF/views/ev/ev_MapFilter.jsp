<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>전기차 -검색</title>
</head>
<body>

	
<div class="search_map ">
	<p style=" text-align: center"><b> 충전소 검색 </b></p><hr>
	<form>
	<table>
		<tr>
			<td>충전기 타입</td>
			<td>
				<select name="type" style="width:95%">
					<option value="all">전체</option>
					<option value="AC3상">AC3상</option>
					<option value="AC완속">AC완속</option>
					<option value="DC차데모">DC차데모</option>
					<option value="DC차데모+AC3상">DC차데모+AC3상</option>
					<option value="DC차데모+AC3상+DC콤보">DC차데모+AC3상+DC콤보</option>
					<option value="DC차데모+DC콤보">DC차데모+DC콤보</option>
					<option value="DC콤보">DC콤보</option>
				<select>
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>
			<td>지역 선택</td>
			<td>
				<select name="area" style="width:95%">
					<option value="all">전체</option>
					<option value="강남구">강남구</option>
					<option value="강동구">강동구</option>
					<option value="강서구">강서구</option>
					<option value="강북구">강북구</option>
					<option value="관악구">관악구</option>
					<option value="광진구">광진구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="노원구">노원구</option>
					<option value="동대문구">동대문구</option>
					<option value="도봉구">도봉구</option>
					<option value="동작구">동작구</option>
					<option value="마포구">마포구</option>
					<option value="서대문구">서대문구</option>
					<option value="성동구">성동구</option>
					<option value="성북구">성북구</option>
					<option value="서초구">서초구</option>
					<option value="송파구">송파구</option>
					<option value="영등포구">영등포구</option>
					<option value="용산구">용산구</option>
					<option value="양천구">양천구</option>
					<option value="은평구">은평구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="중랑구">중랑구</option>
				</select>
			</td>
		</tr>
		<tr><td><hr></td><td><hr></td></tr>
		<tr>				
			<td>운영시설</td>
			<td>
				<select name="loc" style="width:95%">
					<option value="all">전체</option>
					<option value="환경부">환경부</option>
					<option value="타기관">타기관</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="width: 40%;">검색</td>
			<td>
				<select name="name" style="width:95%">
					<option value="all">전체</option>
					<option value="지역명">지역명</option>
					<option value="충전소명">충전소명</option>
				</select>
				<input name="name_detail" type="text" placeholder="검색어를 입력하세요." style=" width:95%">
			</td>
		</tr>
	</table>
	<hr>
	<button class="btn btn-secondary btn-close" ><b> X </b></button>
	<button class="btn btn-primary" style="width:50%"> 검색 </button>
	<button class="btn btn-danger" > 초기화 </button>
	</form>
		<dl class="result-list" style="display:none;">
			<dd>1</dd>
		</dl>	
	<!-- template default script-->
	<script src="/js/webflow.js" type="text/javascript"></script>
	
</body>
</html>