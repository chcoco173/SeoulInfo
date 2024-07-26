<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<form class="search-filter" id="searchForm" action="ev_MapFilter"
			method="post">
			<table>
				<tr>
					<td>충전 타입</td>
					<td><select id="charger_type" name="charger_type"
						style="width: 95%">
							<option ${coordinate.charger_type eq '전체' ? 'selected' : ''}>
								전체</option>
							<option ${coordinate.charger_type eq 'AC3상' ? 'selected' : ''}>
								AC3상</option>
							<option ${coordinate.charger_type eq 'AC완속' ? 'selected' : ''}>
								AC완속</option>
							<option ${coordinate.charger_type eq 'DC차데모' ? 'selected' : ''}>
								DC차데모</option>
							<option	${coordinate.charger_type eq 'DC차데모+AC3상' ? 'selected' : ''}>
								DC차데모+AC3상</option>
							<option	${coordinate.charger_type eq 'DC차데모+AC3상+DC콤보' ? 'selected' : ''}>
								DC차데모+AC3상+DC콤보</option>
							<option	${coordinate.charger_type eq 'DC차데모+DC콤보' ? 'selected' : ''}>
								DC차데모+DC콤보</option>
							<option ${coordinate.charger_type eq 'DC콤보' ? 'selected' : ''}>
								DC콤보</option>
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
					<td><select id="charger_opbig" name="charger_opbig"
						style="width: 95%">
							<option ${coordinate.charger_opbig eq '전체' ? 'selected' : ''}>전체</option>
							<option ${coordinate.charger_opbig eq '환경부' ? 'selected' : ''}>환경부</option>
							<option ${coordinate.charger_opbig eq '타기관' ? 'selected' : ''}>타기관</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 40%;">검색</td>
					<td><select id="name" name="name" style="width: 95%">
							<option>전체</option>
							<option
								${coordinate.charger_opsmall eq '운영기관명' ? 'selected' : ''}>운영기관명</option>
							<option ${coordinate.evc_name eq '충전소명' ? 'selected' : ''}>충전소명</option>
					</select> <input type="text" class="form-control" id="searchText"
						name="searchText" placeholder="검색어를 입력하세요." style="width: 95%"></td>
				</tr>
			</table>
			<hr>
			<button type="button" class="btn btn-dark btn-close">
				<b>X</b>
			</button>
			<button type="submit" class="btn btn-primary btn-search"
				style="width: 50%">검색</button>
			<button type="button" class="btn btn-danger btn-reset">초기화</button>
		</form>
		
		<!-- 결과가 출력될 div -->
		<div id="resultContainer" class="result-list" style="display: none;"></div>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
				
		// search button 이벤트 핸들러
		$('#searchForm').on('submit', function(e) {
			e.preventDefault();
			$.ajax({
				url: 'ev_MapFilter',
				type: 'POST',
			    data: $(this).serialize(),
			    success: function(data) {
				console.log(data);
			    $('#resultContainer').html(''); // 결과 영역 초기화
				if (data && data.length > 0) {
					data.forEach(function(item) {
						var resultHTML =  '<dl id="filteredList" class="high-z-index">';
							resultHTML += 	'<dd>';
							resultHTML += 		'<table class="filtered-list result-list result-list-table" data-lat="' + item.evc_lat + '" data-lng="' + item.evc_long + '" data-title="' + item.evc_name + '" data-id="' + item.evc_id + '">';
							resultHTML += 			'<tr>';
							resultHTML += 				'<td rowspan="2"><img src="/images/ev/goverment-logo.png" /></td>';
							resultHTML += 				'<td colspan="2">' + item.evc_name + '</td>';
							resultHTML += 			'</tr>';
							resultHTML += 			'<tr>';
							resultHTML += 				'<td><span style="font-size: 12px">' + item.charger_userlimit + '</span></td>';
							resultHTML += 				'<td><span style="font-size: 12px">' + item.charger_type + '</span></td>';
							resultHTML += 			'</tr>';
							resultHTML += 		'</table>';
							resultHTML += 		'<br>';
							resultHTML += 	'</dd>';
							resultHTML += '</dl>';
							$('#resultContainer').append(resultHTML);
							});
						var paginationHTML = `
							<div class="filtered-list result-list-pagination" style="text-align: center; margin-top: 20px;">
								<button type="button" class="btn btn-secondary" id="filtered-prevPage" disabled>이전</button>
									<span id="filtered-pageInfo">1 / 1</span>
									<button type="button" class="btn btn-secondary" id="filtered-nextPage">다음</button><hr>
									<button type="button" class="btn btn-primary btn-back" style="width: 50%"><b>재검색</b></button>
									<button type="button" class="btn btn-dark btn-close"><b>X</b></button>
							</div>`;
						$('#resultContainer').append(paginationHTML);
						$('#resultContainer').show(); // 결과 영역 표시

						// 페이지네이션 기능 초기화
						initializePagination();
						
						$(document).on('click', '.btn-back', function(event) {
								event.stopPropagation();
								event.preventDefault();
								$('.search-filter').css({'display':'inherit'});
								$('.result-list').css({'display':'none'});
						});
						// 닫기 버튼
						$(document).on('click', '.btn-close', function(event) {
								event.stopPropagation();
							    event.preventDefault();
							    $(".search_map").css({"display":"none"});
							    $(".search_navigation").css({"display":"none"});
							    $(".search_favorite").css({"display":"none"});
								
						    	// 화면을 원래대로 복귀
					    		$('.charger_Information').css({'display':'none','z-index':'-1'});
						});						
						// 상세정보 클릭 핸들러
						$(document).on('click', '.result-list-table', function() {
						    var lat   = $(this).data('lat');
						    var lng   = $(this).data('lng');
							var title = $(this).data('title');
							var evcId = $(this).data('id');
							$('.charger_Information').css({'display':'inherit', 'z-index':'1100'});
							$('.overlay').show();
							$('.overlay').css({'display':'inherit', 'z-index':'1090'});
							
							// AJAX 요청 보내기
						$.ajax({
							url: 'ev_info',
							type: 'GET',
							data: { evc_id: evcId },
							success: function(data) {
								if (data.length > 0) {
									console.log('data: '+data);
									var charger = data[0]; // 첫 번째 충전소 정보 가져오기 (필요에 따라 수정)
									$('.ev_name'			).text(charger.evc_name);
									$('#evc_address'		).text(charger.evc_address);
									$('#charger_no'			).text(charger.charger_no);
									$('#charger_mechine'	).text(charger.charger_mechine);
									$('.charger_type'       ).text(charger.charger_type);
									$('#charger_state'		).text(charger.charger_state);
									$('#charger_facsmall'	).text(charger.charger_facsmall);
									$('#charger_opsmall'	).text(charger.charger_opsmall);
									$('#charger_userlimit'	).text(charger.charger_userlimit);
									$('.charger_Information').show();
								} else {
									alert('No data found');
									console.log('No data found');
									$('.charger_Information').hide();
									$('.overlay').hide();
								}
							},
							error: function(err) {
								console.error("Error fetching charger info: ", err);
							}
						});
						panTo(lat, lng, 1, title);
					});
				} else {						
						$('#resultContainer').html('<p>검색 결과가 없습니다.</p>');
						var paginationHTML = `<div class="filtered-list result-list-pagination" style="text-align: center; margin-top: 20px;">
												<button type="button" class="btn btn-secondary" id="filtered-prevPage" disabled>이전</button>
												<span id="filtered-pageInfo">1 / 1</span>
												<button type="button" class="btn btn-secondary" id="filtered-nextPage">다음</button><hr>
												<button type="button" class="btn btn-primary btn-back" style="width: 50%"><b>재검색</b></button>
												<button type="button" class="btn btn-dark btn-close"><b>X</b></button>
								  			  </div>`;
						// 재검색
						$(document).on('click', '.btn-back', function(event) {
								event.stopPropagation();
								event.preventDefault();
								$('.search-filter').css({'display':'inherit'});
								$('.result-list').css({'display':'none'});
						});
						
						// 닫기 버튼
						$(document).on('click', '.btn-close', function(event) {
								event.stopPropagation();
								event.preventDefault();												
								$(".search_map").css({"display":"none"});
								$(".search_navigation").css({"display":"none"});
								$(".search_favorite").css({"display":"none"});
								// 화면을 원래대로 복귀
								$('.overlay').hide();
								$('.overlay').css({'display':'none','z-index':'-1'});
								$('.charger_Information').css({'display':'none','z-index':'-1'});
						});
						$('#resultContainer').append(paginationHTML);
						$('#resultContainer').show(); // 결과 영역 표시	
					}
				},
				error: function(err) {
						$('#resultContainer').html('');
						$('#resultContainer').show(); // 결과 영역 표시
						alert(err);
						console.log(err);
				}
				});
		});
		
		// map moving smooth
		function panTo(lat, lng, level) {
		    var moveLatLon = new kakao.maps.LatLng(lat, lng);
		    map.panTo(moveLatLon);
			map.setLevel(level);
			
			var markerImage = new kakao.maps.MarkerImage('/images/ev/ev_normal.png', new kakao.maps.Size(24, 24));
			var marker = new kakao.maps.Marker({
			    position: moveLatLon,
			    image: markerImage,
			    title: title
			});

			// 마커를 지도에 추가
			marker.setMap(map);
		}

		// paging event function
		function initializePagination() {
		    var itemsPerPage = 3; // 페이지당 보여줄 항목 수
		    var currentPage = 1; // 현재 페이지
		    var $filteredItems = $('#resultContainer dl'); // 필터링된 항목들
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
		}
});
	</script>

</body>
</html>
