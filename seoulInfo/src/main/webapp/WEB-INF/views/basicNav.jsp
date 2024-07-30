<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java"%>
<%
	String area = request.getParameter("area");
System.out.println(area);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navigation-wrapper">
		<div data-animation="default" data-collapse="medium"
			data-duration="400" data-easing="ease" data-easing2="ease"
			role="banner" class="navbar_m w-nav">
			<div class="nav-wrapper">
				<a href="/" aria-current="page" class="brand w-nav-brand w--current">
					<img src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
					alt="">
				</a>
				<div class="links-and-search-wrapper">
					<%
						if (session.getAttribute("member") != null) {
					%>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/news/news?area=${param.area}"
							class="nav-link w-nav-link">뉴스</a> <a
							href="/festival/festival?area=${param.area}"
							class="nav-link w-nav-link">문화행사</a> <a href="/ev/evMain"
							class="nav-link w-nav-link">전기차</a> <a href="/mypage/profile"
							class="nav-link w-nav-link">마이페이지</a> <a href="/member/logout"
							class="nav-link w-nav-link">로그아웃</a>
					</nav>
					<%
						} else {
					%>
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="/gu" class="nav-link w-nav-link">문화행사/뉴스</a> <a
							href="/ev/evMain" class="nav-link w-nav-link">전기차</a> <a
							href="/member/login" class="nav-link w-nav-link">로그인</a>
					</nav>
					<%
						}
					%>
					<form action="/search"
						data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
						class="search w-form">
						<div class="search-div">
							<img src="/images/ph_magnifying-glass-light-xsmall.svg"
								loading="lazy" alt="" class="icon-1x1-xsmall">
						</div>
						<div class="nav-search-outer-wrapper">
							<div class="nav-search-internal-wrapper">
								<input class="form-field w-input" maxlength="256" name="query"
									placeholder="Search…" type="search" id="search" required="">
								<div class="search-button-wrapper">
									<input type="submit" class="button-primary-small w-button"
										value="Search"> <a
										data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
										class="close-search-link-block w-inline-block"> <img
										src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
										class="icon-1x1-xsmall">
									</a>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="menu-button w-nav-button">
					<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt=""
						class="icon-1x1-xsmall">
				</div>
			</div>
		</div>
	</div>
</body>
</html>