<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member 상세</title>
	<!-- template default setting -->
	<meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	
	<link href="/css/normalize.css" rel="stylesheet" type="text/css">
	<link href="/css/webflow.css" rel="stylesheet" type="text/css">
	<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
	
	<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link href="/images/webclip.png" rel="apple-touch-icon">
	<!-- 기존의 CSS 및 JavaScript 파일 포함 -->
	<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"	rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<style>
		#errorText {
		   	width: 100%;
			height: 33%;
		    background: #FFFAE0;
		    text-align: center;
		    position: relative;
			bottom: 0; /* 화면의 하단에 위치 */
		   	left: 0; /* 좌우 정렬: 화면의 왼쪽에서 시작 */
		   	padding: 10px; /* 약간의 패딩을 추가하여 텍스트 주변의 공간 확보 */
		   	box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.2); /* 상단에 그림자 추가 (선택사항) */
		   	display: flex;
		   	justify-content: center; /* 가로축 가운데 정렬 */
		   	align-items: center; /* 세로축 가운데 정렬 */
		}

		
		#notFound {
		    width: auto;
		    height: 58%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    margin: 0 auto; /* 가로축 중앙 정렬 */
		}
	
		button{
			margin-bottom:5px;
		}

		#errorCar {
		    width: 70px;
		    position: fixed;
		    bottom: calc(25% - 5px); /* #errorText의 높이에 따라 반응형으로 위치 조정 */
		    left: 0;
		    animation: moveCar 15s linear infinite;
		    z-index: 100;
		    transform: translateY(-100%); /* 자동차를 정확히 #errorText의 상단에 맞춤 */
		}

		@keyframes moveCar {
		    0% {
		        left: 0;
		        opacity: 1; /* 시작 시 완전히 보임 */
		    }
		    80% {
		        left: calc(100% - 70px); /* 화면 너비의 끝까지 이동 */
		        opacity: 1; /* 이동 중에는 완전히 보임 */
		    }
		    100% {
		        left: calc(100% - 70px); /* 끝 위치에서 */
		        opacity: 0; /* 완전히 사라짐 */
		    }
		}


	</style>
</head>
<body><!-- header navigation -->
	<div class="navigation-wrapper">
		<div data-animation="default" data-collapse="medium"
			data-duration="400" data-easing="ease" data-easing2="ease"
			role="banner" class="navbar_m w-nav">
			<div class="nav-wrapper">
				<a href="/" aria-current="page" class="brand w-nav-brand w--current">
					<img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt="">
				</a>
				<div class="links-and-search-wrapper">
					<% if (session.getAttribute("member") != null) { %>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/news/news?area=${sessionScope.member.member_area}"
							class="nav-link w-nav-link">뉴스</a> <a
							href="/festival/festival?area=${sessionScope.member.member_area}"
							class="nav-link w-nav-link">문화행사</a> <a href="/mypage/profile"
							class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
							class="nav-link w-nav-link">로그아웃</a>
					</nav>
					<%
						} else {
					%>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/gu" class="nav-link w-nav-link">문화행사/뉴스</a> <a
							href="/member/login" class="nav-link w-nav-link">로그인/회원가입</a>
					</nav>
					<%
						}
					%>
					
				</div>
				<div class="menu-button w-nav-button">
					<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
				</div>
			</div>
		</div>
	</div>
	<!-- end of header navigation -->
	<img id="notFound" src="/images/error/error1.gif" alt="test">
	<img id="errorCar" src="/images/error/error3.gif" style="width:70px; position:fixed;" alt="test">
	<div id="errorText">
		<h><b>죄송합니다.<br>요청하신 페이지를 찾을 수 없습니다.</b></h3>
		<p>일시적인 오류로 현재 요청하신 페이지에 접속이 불가능합니다.</p>
		<br>
		<a href="/"><button type="button" class="btn btn-success">메인페이지로 이동</button></a>
		<button type="button" class="btn btn-primary btn-moveBefore" onclick="history.back();">이전페이지로 이동</button>
	</div>

</body>
</html>
