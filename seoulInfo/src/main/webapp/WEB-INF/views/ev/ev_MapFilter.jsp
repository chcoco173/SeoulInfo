<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전기차 - 검색</title>
<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/css/ev/evSearch.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="search_map">
		<p style="text-align: center">
			<b>충전소 검색</b>
		</p>
		<hr>
		<form class="search-filter" action="ev_search-filter" method="get">
			<table>
				<tr>
					<td>충전기 타입</td>
					<td><select id="charger_type" name="charger_type" style="width: 95%">
							<option ${coordinate.charger_type eq '전체' ? 'selected' : ''}>전체</option>
							<option ${coordinate.charger_type eq 'AC3상' ? 'selected' : ''}>AC3상</option>
							<option ${coordinate.charger_type eq 'AC완속' ? 'selected' : ''}>AC완속</option>
							<option ${coordinate.charger_type eq 'DC차데모' ? 'selected' : ''}>DC차데모</option>
							<option ${coordinate.charger_type eq 'DC차데모+AC3상' ? 'selected' : ''}>DC차데모+AC3상</option>
							<option ${coordinate.charger_type eq 'DC차데모+AC3상+DC콤보' ? 'selected' : ''}>DC차데모+AC3상+DC콤보</option>
							<option ${coordinate.charger_type eq 'DC차데모+DC콤보' ? 'selected' : ''}>DC차데모+DC콤보</option>
							<option ${coordinate.charger_type eq 'DC콤보' ? 'selected' : ''}>DC콤보</option>
					</select></td>
				</tr>
				<tr>
					<td><hr></td>
					<td><hr></td>
				</tr>
				<tr>
					<td>지역 선택</td>
					<td><select id="evc_area" name="evc_area" style="width: 95%">
							<option ${coordinate.evc_area eq '전체' ? 'selected' : ''}>전체</option>
							<option ${coordinate.evc_area eq '강남구' ? 'selected' : ''}>강남구</option>
							<option ${coordinate.evc_area eq '강동구' ? 'selected' : ''}>강동구</option>
							<option ${coordinate.evc_area eq '강서구' ? 'selected' : ''}>강서구</option>
							<option ${coordinate.evc_area eq '강북구' ? 'selected' : ''}>강북구</option>
							<option ${coordinate.evc_area eq '관악구' ? 'selected' : ''}>관악구</option>
							<option ${coordinate.evc_area eq '광진구' ? 'selected' : ''}>광진구</option>
							<option ${coordinate.evc_area eq '구로구' ? 'selected' : ''}>구로구</option>
							<option ${coordinate.evc_area eq '금천구' ? 'selected' : ''}>금천구</option>
							<option ${coordinate.evc_area eq '노원구' ? 'selected' : ''}>노원구</option>
							<option ${coordinate.evc_area eq '동대문구' ? 'selected' : ''}>동대문구</option>
							<option ${coordinate.evc_area eq '도봉구' ? 'selected' : ''}>도봉구</option>
							<option ${coordinate.evc_area eq '동작구' ? 'selected' : ''}>동작구</option>
							<option ${coordinate.evc_area eq '마포구' ? 'selected' : ''}>마포구</option>
							<option ${coordinate.evc_area eq '서대문구' ? 'selected' : ''}>서대문구</option>
							<option ${coordinate.evc_area eq '성동구' ? 'selected' : ''}>성동구</option>
							<option ${coordinate.evc_area eq '성북구' ? 'selected' : ''}>성북구</option>
							<option ${coordinate.evc_area eq '서초구' ? 'selected' : ''}>서초구</option>
							<option ${coordinate.evc_area eq '송파구' ? 'selected' : ''}>송파구</option>
							<option ${coordinate.evc_area eq '영등포구' ? 'selected' : ''}>영등포구</option>
							<option ${coordinate.evc_area eq '용산구' ? 'selected' : ''}>용산구</option>
							<option ${coordinate.evc_area eq '양천구' ? 'selected' : ''}>양천구</option>
							<option ${coordinate.evc_area eq '은평구' ? 'selected' : ''}>은평구</option>
							<option ${coordinate.evc_area eq '종로구' ? 'selected' : ''}>종로구</option>
							<option ${coordinate.evc_area eq '중구' ? 'selected' : ''}>중구</option>
							<option ${coordinate.evc_area eq '중랑구' ? 'selected' : ''}>중랑구</option>
					</select></td>
				</tr>
				<tr>
					<td><hr></td>
					<td><hr></td>
				</tr>
				<tr>
					<td>운영시설</td>
					<td><select id="charger_opbig" name="charger_opbig" style="width: 95%">
							<option ${coordinate.charger_opbig eq '전체' ? 'selected' : ''}>전체</option>
							<option ${coordinate.charger_opbig eq '환경부' ? 'selected' : ''}>환경부</option>
							<option ${coordinate.charger_opbig eq '타기관' ? 'selected' : ''}>타기관</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 40%;">검색</td>
					<td><select id="name" name="name" style="width: 95%">
							<option>전체</option>
							<option ${coordinate.charger_opsmall eq '운영기관명' ? 'selected' : ''}>운영기관명</option>
							<option ${coordinate.evc_name eq '충전소명' ? 'selected' : ''}>충전소명</option>
					</select> <input type="text" class="form-control" id="searchText"  name="searchText" 
						placeholder="검색어를 입력하세요." style="width: 95%"></td>
				</tr>
			</table>
			<hr>
			<button type="button" class="btn btn-dark btn-close" >
				<b>X</b>
			</button>
			<button type="submit" class="btn btn-primary btn-search" style="width: 50%">검색</button>
			<button type="button" class="btn btn-danger btn-reset">초기화</button>
		</form>
		<div class="result-list" style="display: none;">
			<dl id="filteredList">
				<dd>
					<table class="filtered-list result-list result-list-table">
						<tr>
							<td rowspan="2"><img src="/images/ev/goverment-logo.png" /></td>
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
					<table class="filtered-list result-list result-list-table">
						<tr>
							<td rowspan="2"><img src="/images/ev/goverment-logo.png" /></td>
							<td colspan="2">충전소 이름2</td>
						</tr>
						<tr>
							<td><span style="font-size: 12px">사용가능</span></td>
							<td><span style="font-size: 12px">충전기 타입</span></td>
						</tr>
					</table>
					<br>
				</dd>
				
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
