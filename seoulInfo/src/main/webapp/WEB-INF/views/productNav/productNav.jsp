<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page language="java" %>
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
				<a href="/" class="brand w-nav-brand"><img
					src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
				<div class="links-and-search-wrapper">
					<nav role="navigation" class="nav-links-wrapper w-nav-menu">
						<a href="productMain?area=${param.area}" class="style-guide-nav-link w-nav-link">홈</a>
						<a href="productCategory?area=${param.area}&category=전자제품" class="style-guide-nav-link w-nav-link">전자제품</a>
						<a href="productCategory?area=${param.area}&category=생활용품" class="style-guide-nav-link w-nav-link">생활용품</a>
						<a href="productCategory?area=${param.area}&category=도서" class="style-guide-nav-link w-nav-link">도서</a>
						<a href="productCategory?area=${param.area}&category=의류" class="style-guide-nav-link w-nav-link">의류</a>
						<a href="productCategory?area=${param.area}&category=기타" class="style-guide-nav-link w-nav-link">기타</a>
 
						<c:if test="${sessionScope.member != null}">
							<a href="productMypage" class="style-guide-nav-link w-nav-link">마이페이지</a>
							<a href="chat" class="style-guide-nav-link w-nav-link">채팅</a>
						</c:if>
					</nav>
					<form action="productSearch?area=${param.area}"
						data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5"
						class="search w-form">
						<div class="search-div">
							<img src="/images/ph_magnifying-glass-light-xsmall.svg"
								loading="lazy" alt="" class="icon-1x1-xsmall">
						</div>
						<div class="nav-search-outer-wrapper">
							<div class="nav-search-internal-wrapper">
								<input type="hidden" name="area" value="${param.area}"/>
								<input class="form-field w-input" maxlength="256" name="productsearch_keyword"
									placeholder="Search…" type="search" id="search" required="">
								<div class="search-button-wrapper">
									<input type="submit" class="button-primary-small w-button"
										value="Search"> <a
										data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#"
										class="close-search-link-block w-inline-block"><img
										src="/images/ph_x-light-xsmall.svg" loading="lazy" alt=""
										class="icon-1x1-xsmall"></a>
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