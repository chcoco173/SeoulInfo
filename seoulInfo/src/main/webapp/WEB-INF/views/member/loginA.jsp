<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.beans.factory.annotation.Value" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4825" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Sightseer - Webflow Travel Photography Website Template</title>
  <meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="og:title">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="og:description">
  <meta content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg" property="og:image">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="twitter:title">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="twitter:description">
  <meta content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg" property="twitter:image">
  <meta property="og:type" content="website">
  <meta content="summary_large_image" name="twitter:card">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="/css/member/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/member/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/member/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
  
  <style>
  	/* 회원가입 성공 메세지 */
    .login-title {
        color: green;
        margin-top: 5px;
        font-weight: bold;
    }
  
  </style>
  
</head>
<body>
  <div class="page-wrapper">
	
	<!-- 한) 상단:회원가입/로그인 버튼 start -->
	<div class="section-newsletter">
	  <div class="padding-global">
	    <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
	      <div class="_2-column-grid-uneven-left">
	        <h3 class="newsletter-heading">서울 지역 안내 서비스</h3>
	        <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
	          <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4820" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
				
				<a href="/member/insertMember" class="button-primary-large max-width-full-mobile-portrait w-button">회원가입</a>
				<a href="/member/login" class="button-primary-large max-width-full-mobile-portrait w-button">로그인</a>
				
			  </form>
	          <div class="form-success-message w-form-done">
	            <div class="text-size-regular text-color-white">Thank you! Your submission has been received!</div>
	          </div>
	          <div class="form-error-message w-form-fail">
	            <div class="text-size-regular">Oops! Something went wrong while submitting the form.</div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 한) 상단:회원가입/로그인 버튼 end -->
	
	
    <div class="navigation-wrapper">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
          <a href="/" class="brand w-nav-brand"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
          <div class="links-and-search-wrapper">
            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
              <a href="about" class="nav-link w-nav-link"></a>
              <a href="contact" aria-current="page" class="nav-link w-nav-link w--current"></a>
            </nav>
            <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
              <div class="search-div"><img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
              <div class="nav-search-outer-wrapper">
                <div class="nav-search-internal-wrapper"><input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                  <div class="search-button-wrapper"><input type="submit" class="button-primary-small w-button" value="Search">
                    <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block"><img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></a>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="menu-button w-nav-button"><img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
        </div>
      </div>
    </div>
	
	
	<!--한) 로그인 start-->
    <div class="main-wrapper">
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
                  <h5 class="login-title">회원가입을 축하드립니다.</h5>
                  <div class="spacer-small"></div>
				  <div class="accent">계속 이용하시려면 로그인해주세요.</div>
                  <div class="spacer-large"></div>
                  <h1>로그인</h1>
                  <div class="spacer-large"></div>
                  <p></p>
                </div>
                <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">				  
					<form action="loginCheck" method="post" name="wf-form-Contact-Form" id="wf-form-Contact-Form" class="form" 
						data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a65">
					<div class="form-field-wrapper">						
						<input class="form-field w-input" maxlength="256" name="member_id" placeholder="아이디" type="text" id="id" pattern="[A-Za-z0-9]{6,}" required>						
					</div>
					<div class="form-field-wrapper">						
						<input class="form-field w-input" maxlength="256" name="member_pw" placeholder="비밀번호" type="password" id="pw" pattern="[A-Za-z0-9]{6,}" required>
					</div>
					
					<div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper">
						<input type="submit" class="button-primary-large-b w-button loginBtn" value="로그인">
						<!-- 네이버로그인 -->
						<div class="button-primary-large-g w-button">네이버 로그인<%@ include file="./naverlogin.jsp" %></div>						
					</div>
					<div class="spacer-large"></div>
					<div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper">
						<a href="id_search" class="button-primary-large w-button">아이디 찾기</a>
						<a href="pw_change" class="button-primary-large w-button">비밀번호 찾기</a>
					</div>															
					</form>				  				  				  
                </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!--한) 로그인 end-->
	
	

    
    
  </div><!-- page-wrapper end --> 
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>