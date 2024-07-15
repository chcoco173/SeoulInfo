<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 - 검색</title>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/css/evSearch.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="search_map">
		<p style="text-align: center">
			<b>충전소 검색</b>
		</p>
		<hr>
		<form class="search-filter">
			<table>
				<tr>
					<td>충전기 타입</td>
					<td><select id="type" name="type" style="width: 95%">
							<option value="all">전체</option>
							<option value="AC3상">AC3상</option>
							<option value="AC완속">AC완속</option>
							<option value="DC차데모">DC차데모</option>
							<option value="DC차데모+AC3상">DC차데모+AC3상</option>
							<option value="DC차데모+AC3상+DC콤보">DC차데모+AC3상+DC콤보</option>
							<option value="DC차데모+DC콤보">DC차데모+DC콤보</option>
							<option value="DC콤보">DC콤보</option>
					</select></td>
				</tr>
				<tr>
					<td><hr></td>
					<td><hr></td>
				</tr>
				<tr>
					<td>지역 선택</td>
					<td><select id="area" name="area" style="width: 95%">
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
					</select></td>
				</tr>
				<tr>
					<td><hr></td>
					<td><hr></td>
				</tr>
				<tr>
					<td>운영시설</td>
					<td><select id="loc" name="loc" style="width: 95%">
							<option value="all">전체</option>
							<option value="환경부">환경부</option>
							<option value="타기관">타기관</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 40%;">검색</td>
					<td><select id="name" name="name" style="width: 95%">
							<option value="all">전체</option>
							<option value="지역명">지역명</option>
							<option value="충전소명">충전소명</option>
					</select> <input id="name_detail" name="name_detail" type="text"
						placeholder="검색어를 입력하세요." style="width: 95%"></td>
				</tr>
			</table>
			<hr>
			<button type="button" class="btn btn-dark btn-close">
				<b>X</b>
			</button>
			<button type="button" class="btn btn-primary btn-search"
				style="width: 50%">검색</button>
			<button type="button" class="btn btn-danger btn-reset">초기화</button>
		</form>
		<div class="result-list" style="display: none;">
			<dl id="filteredList">
				<dd>
					<table class="filtered-list result-list">
						<tr>
							<td rowspan="2"><img src="/images/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름1</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>
				<dd>
					<table class="filtered-list result-list">
						<tr>
							<td rowspan="2"><img src="/images/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름2</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>
				<dd>
					<table class="filtered-list result-list">
						<tr>
							<td rowspan="2"><img src="/images/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름3</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>
				<dd>
					<table class="filtered-list result-list">
						<tr>
							<td rowspan="2"><img src="/images/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름4</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>
				<dd>
					<table class="filtered-list result-list">
						<tr>
							<td rowspan="2"><img src="/images/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름5</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>

				<!-- 이하 생략 -->
			</dl>
			<div class="filtered-list result-list-pagination"
				style="text-align: center; margin-top: 20px;">

				<button type="button" class="btn btn-secondary"
					id="filtered-prevPage" disabled>이전</button>
				<span id="filtered-pageInfo">1 / 1</span>
				<button type="button" class="btn btn-secondary"
					id="filtered-nextPage">다음</button>
				<hr>
				<button type="button" class="btn btn-primary btn-back"
					style="width: 50%">
					<b>재검색</b>
				</button>
				<button type="button" class="btn btn-dark btn-close">
					<b>X</b>
				</button>

			</div>
		</div>
	</div>

	<!-- Bootstrap 및 jQuery JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
$(document).ready(function() {
    var itemsPerPage = 3; // 페이지당 보여줄 항목 수
    var currentPage = 1; // 현재 페이지
    var $filteredItems = $('#filteredList dd'); // 필터링된 항목들
    var totalItems = $filteredItems.length; // 전체 항목 수
    var totalPages = Math.ceil(totalItems / itemsPerPage); // 전체 페이지 수

    function showPage(page) {
        $filteredItems.hide();
        $filteredItems.slice((page - 1) * itemsPerPage, page * itemsPerPage).show();
        $('#filtered-pageInfo').text(page + ' / ' + totalPages);
        $('#filtered-prevPage').prop('disabled', page === 1);
        $('#filtered-nextPage').prop('disabled', page === totalPages);
    }

    $('#filtered-prevPage').click(function() {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    });

    $('#filtered-nextPage').click(function() {
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
        }
    });

    // 초기 페이지 로드
    showPage(currentPage);
});
</script>

</body>
</html>
