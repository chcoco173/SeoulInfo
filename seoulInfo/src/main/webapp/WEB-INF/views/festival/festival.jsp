<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4825"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>Sightseer - Webflow Travel Photography Website Template</title>
<meta content="Sightseer - Webflow Travel Photography Website Template"
	name="description">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="og:title">
<meta content="Sightseer - Webflow
 Travel Photography Website Template"
	property="og:description">
<meta
	content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg"
	property="og:image">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="twitter:title">
<meta content="Sightseer - Webflow Travel Photography Website Template"
	property="twitter:description">
<meta
	content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg"
	property="twitter:image">
<meta property="og:type" content="website">
<meta content="summary_large_image" name="twitter:card">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.8/index.global.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.8/index.global.min.css"
	rel="stylesheet">
<link href="/css/festival/festivalPopup.css" rel="stylesheet">

<!-- 07/25 기진 추가 : loading style tag-->
<style>
#loading {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 255, 255, 0.8);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
	flex-direction: column;
}

.spinner-border {
	width: 3rem;
	height: 3rem;
	margin-bottom: 1rem;
}

.loading-text {
	font-size: 1.5rem;
	font-weight: bold;
}
.links-and-search-wrapper {
	    grid-column-gap: 0;
	}
	.nav-links-wrapper {
	  grid-column-gap: 0;
	  }
</style>
</head>
<body>
	<!-- 07/25  기진 추가 : Delay for page loading -->
	<div id="loading">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
		<div class="loading-text">Loading . . .</div>
	</div>
	<!-- festival info page-->
	<div class="page-wrapper">
		<div class="navigation-wrapper">
			<div data-animation="default" data-collapse="medium"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="navbar_m w-nav">
				<div class="nav-wrapper">
					<a href="/" aria-current="page"
						class="brand w-nav-brand w--current"> <img
						src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
						alt="">
					</a>
					<div class="links-and-search-wrapper">
						<%
							if (session.getAttribute("member") != null) {
						%>
						<nav role="navigation" class="nav-links-wrapper w-nav-menu">
							<a href="/news/news?area=${param.area}"
								class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
								class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
								class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
								class="nav-link w-nav-link">로그아웃</a>
						</nav>
						<%
							} else {
						%>
						<nav role="navigation" class="nav-links-wrapper w-nav-menu">
							<a href="/news/news?area=${param.area}"
								class="nav-link w-nav-link">뉴스</a> <a href="/ev/evMain"
								class="nav-link w-nav-link">전기차</a> <a href="/member/login"
								class="nav-link w-nav-link">로그인</a>
						</nav>
						<%
							}
						%>
						
					</div>
					<div class="menu-button w-nav-button">
						<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
							class="icon-1x1-xsmall">
					</div>
				</div>
			</div>
		</div>
		<div class="main-wrapper">
			<div class="section-contact">
				<div class="padding-global">
					<div class="padding-section-medium">
						<div class="row">
							<div class="col-md-8">
								<div id="calendar"></div>

								<!-- Popup Modal -->
								<div id="festivalPopup" class="modal">
									<div class="modal-content">
										<span class="close">&times;</span>
										<h2 id="festivalTitle"></h2>
										<img id="festivalImage" src="" alt="Festival Image"
											style="max-width: 65%;">
										<p id="festivalDetails"></p>
										<p id="festivalAppdate"></p>
										<p id="festivalLoc"></p>
										<p id="festivalFee"></p>
										<p id="festivalTarget"></p>
										<p id="festivalHost"></p>
										<p id="festival_viewcount"></p>

										<!-- 버튼 추가 -->
										<div class="modal-buttons">
											<button id="site" class="modal-btn">사이트 바로가기</button>
											<button id="Detail" class="modal-btn">상세내용 보러가기</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div id="event-list">
									<input type="hidden" id="area" value="${area}">
									<h2 id="event-list-title">오늘의 ${area} 문화정보</h2>
									<ul class="list-unstyled">
										<c:forEach items="${festivalList}" var="festival">
											<li class="media mb-3 event-item"><input type="hidden"
												id="festival_id" name="festival_id"
												value="${festival.festival_id }"> <img class="mr-3"
												src="${festival.festival_imageurl}" alt="축제 이미지"
												 />
												<div class="media-body">
													<p>${festival.festival_name}</p>
													<p>시작일:${festival.festival_startDate}</p>
													<p>종료일:${festival.festival_endDate}</p>
													<p class="viewcount">조회수:${festival.festival_viewcount}</p>
													<a href="/festival/festivalDetail?festival_id=${festival.festival_id}">상세내용 보러가기</a>
												</div></li>
										</c:forEach>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="/js/webflow.js" type="text/javascript"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.8/index.global.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.8/index.global.min.js"></script>

	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
	<script>
		//07/25 기진 추가 : loading delay 1 - 로딩 바 표시
		document.getElementById('loading').style.display = 'flex';

		//주석 추가 : -- calender script
		document.addEventListener('DOMContentLoaded', function() {
			
			var calendarEl = document.getElementById('calendar');
			// JSP로부터 festivalList 데이터를 JavaScript 배열로 변환
			var festivals = [
				<c:forEach items="${calenderList}" var="calenderList" varStatus="status">
				{
					title: "<c:out value='${calenderList.festival_name}'/>",
					start: "<c:out value='${calenderList.festival_startDate}'/>",
					end: "<c:out value='${calenderList.festival_endDate}'/>",
					location : "<c:out value='${calenderList.festival_loc}'/>",
					imgurl : "<c:out value='${calenderList.festival_imageurl}'/>",
					siteurl : "<c:out value='${calenderList.festival_siteurl}'/>",
					fee : "<c:out value='${calenderList.festival_fee}'/>",
					appdate : "<c:out value='${calenderList.festival_appdate}'/>",
					target : "<c:out value='${calenderList.festival_target}'/>",
					host : "<c:out value='${calenderList.festival_host}'/>",
					id : "<c:out value='${calenderList.festival_id}'/>",
					viewcount : "<c:out value='${calenderList.festival_viewcount}'/>"

				}<c:if test="${!status.last}">,</c:if>
				</c:forEach>
				];
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					right: 'today prev,next'
				},
				locale: 'ko',
				initialDate: new Date(),
				navLinks: true,
				selectable: true,
				selectMirror: true,
				navLinkDayClick: function(date) { // 일 클릭시 이벤트
					// date는 JavaScript Date 객체입니다.
					var year = date.getFullYear();
					var month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
					var day = String(date.getDate()).padStart(2, '0');

					// 날짜 문자열 생성
					var selectedDate = year + '-' + month + '-' + day; // 'YYYY-MM-DD' 형식
					var area = document.getElementById('area').value; 

					console.log('Clicked date:', selectedDate);

					// 날짜에 해당하는 list 가져오기
					$.ajax({
						url: '/festival/selectDateList',
						type: 'GET',
						data: {
							selectDate: selectedDate,
							area: area // 또는 사용자가 선택한 지역
						},
						success: function(response) {
							// 성공적으로 데이터를 받아온 경우
							console.log(response)
							// 기존 목록을 클리어
							var eventList = document.getElementById('event-list').getElementsByTagName('ul')[0];
							eventList.innerHTML = ''; // Clear the list

							// 받아온 데이터로 목록 업데이트
							response.selectDateList.forEach(function(festival) {
								var listItem = document.createElement('li');
								listItem.className = 'media mb-3 event-item';
								listItem.innerHTML = 
									'<input type="hidden" id="festival_id" name="festival_id" value="' + festival.festival_id + '">' +
									'<img class="mr-3" src="' + festival.festival_imageurl + '" alt="매물 이미지" >' +
									'<div class="media-body">' +
									'<p>' + festival.festival_name + '</p>' +
									'<p> 시작일 : ' + festival.festival_startDate + '</p>' +
									'<p> 종료일 : ' + festival.festival_endDate + '</p>' +
									'<p class="viewcount"> 조회수:' + festival.festival_viewcount + '</p>' +
									'<a href="/festival/festivalDetail?festival_id=' + festival.festival_id + '">상세내용 보러가기</a>'
									'</div>';

								eventList.appendChild(listItem);
							});
							// <h2> 태그 내용 업데이트
							var titleElement = document.getElementById('event-list-title');
							titleElement.innerText = month + '월 ' + day + '일 ' + area + ' 문화정보';
							
						},
						error: function(xhr, status, error) {
							// 오류 발생 시
							alert('An error occurred while fetching the count.');
						}
					});

					// 선택해제
					calendar.unselect();
				},
				eventClick: function(arg) {
					console.log(arg.event);

					// 클릭시 조회수 증가
					$.ajax({
						url: '/festival/festivalViewCountUpdate',
						type: 'POST',
						data: {
							festival_id: arg.event.id
						},success: function(response) {
							if(response.status === 'success'){
								console.log("조회수 업데이트 성공");
								document.getElementById('festival_viewcount').innerText = "조회수 : " + response.viewcount;

								// 리스트의 조회수 업데이트
								var listItems = document.querySelectorAll('#event-list .media');
								listItems.forEach(function(item) {
									var festivalIdInput = item.querySelector('input[name="festival_id"]');
									if (festivalIdInput && festivalIdInput.value == arg.event.id) {
										var viewCountElement = item.querySelector('.viewcount');
										if (viewCountElement) {
											viewCountElement.innerText = "조회수 : " +  response.viewcount;
										}
									}
								});							

							} else {
								alert("조회수 업데이트 실패");
							}

						},error: function(error) {
							console.log("viewcount update error");
						}

					});


					// range 객체에서 start와 end를 추출
					var startDate = arg.event._instance.range.start;
					var endDate = arg.event._instance.range.end;

					// 신청일 가져오기
					var appDate = arg.event.extendedProps.appdate;

					// Date 객체를 로컬 문자열로 포맷
					var startDateStr = startDate ? new Date(startDate).toLocaleString() : 'No start date';
					var endDateStr = endDate ? new Date(endDate).toLocaleString() : 'No end date';
					var appDateStr = appDate ? new Date(appDate).toLocaleString() : 'No end date';

					// 모달에 이벤트 세부정보를 채웁니다
					document.getElementById('festivalTitle').innerText = arg.event.title;
					document.getElementById('festivalDetails').innerText = 
						"시작날짜 :" + startDateStr + "\n 종료날짜 :" + endDateStr;
					document.getElementById('festivalLoc').innerText = "장소 : " + arg.event.extendedProps.location;
					document.getElementById('festivalImage').src = arg.event.extendedProps.imgurl;
					document.getElementById('festivalAppdate').innerText = "신청일 : " + appDateStr;
					document.getElementById('festivalFee').innerText = "이용요금 : " + arg.event.extendedProps.fee;
					document.getElementById('festivalTarget').innerText = "이용대상 : " +arg.event.extendedProps.target;
					document.getElementById('festivalHost').innerText = "주체자 : " + arg.event.extendedProps.host;
					document.getElementById('festival_viewcount').innerText = "조회수 : " + arg.event.extendedProps.viewcount;


					// 모달을 표시합니다
					var modal = document.getElementById('festivalPopup');
					modal.style.display = 'block';

					// 사용자 정의 팝업이 열리면 "more" 팝업을 숨김
					var morePopovers = document.querySelectorAll('.fc-more-popover');
					morePopovers.forEach(function(popover) {
						popover.style.display = 'none';
					});

					// 닫기 버튼 클릭 시 모달 닫기
					var span = document.getElementsByClassName('close')[0];
					span.onclick = function() {
						modal.style.display = 'none';

					};

					// site 버튼 클릭시
					var site = document.getElementById('site');
					site.onclick = function() {
						// URL의 앰퍼샌드를 올바르게 변환
						var siteUrl = arg.event.extendedProps.siteurl.replace(/&amp;/g, '&');

						window.open(siteUrl, '_blank'); // 새 탭에서 상세 내용 열기
					};
					
					// 문화 상세 페이지로 이동
					
					var Detail = document.getElementById('Detail');
					Detail.onclick = function() {
					    alert(arg.event.id);
					    var festival_id = arg.event.id;
					    window.location.href = "/festival/festivalDetail?festival_id=" + festival_id;
					}
					
					// 모달 외부 클릭 시 모달 닫기
					window.onclick = function(event) {
						if (event.target == modal) {
							modal.style.display = 'none';
						}
					};
				},
				dayMaxEvents: 0,
				events: festivals // Use the festivals array here
			});

			calendar.render();

			// Hide loading bar after loading
			document.getElementById('loading').style.display = 'none';
		});


		// list의 li 요소 클릭시
		var eventItems = document.querySelectorAll('#event-list .event-item');
		eventItems.forEach(function(item) {
			item.addEventListener('click', function() {
				// 클릭된 item 내부의 .festival_id input 요소를 선택
				var festivalId = this.querySelector('#festival_id').value;
				// festival_id를 alert로 표시
				//alert('Festival ID: ' + festivalId);
				//window.location.href = "/festival/festivalDetail?festival_id=" + festivalId;

				// 클릭시 조회수 증가
				$.ajax({
					url: '/festival/festivalViewCountUpdate',
					type: 'POST',
					data: {
						festival_id: festivalId
					},success: function(response) {
						if(response.status === 'success'){
							console.log("조회수 업데이트 성공");

							document.getElementById('festival_viewcount').innerText = "조회수 : " + response.viewcount;

							// 리스트의 조회수 업데이트
							var listItems = document.querySelectorAll('#event-list .media');
							listItems.forEach(function(item) {
								var festivalIdInput = item.querySelector('input[name="festival_id"]');
								if (festivalIdInput && festivalIdInput.value == festivalId) {
									var viewCountElement = item.querySelector('.viewcount');
									if (viewCountElement) {
										viewCountElement.innerText = response.viewcount;
									}
								}
							});
						} else {
							alert("조회수 업데이트 실패");
						}
					},error: function(error) {
						console.log("viewcount update error");
					}
				});

			});
		});
    </script>
</body>
</html>