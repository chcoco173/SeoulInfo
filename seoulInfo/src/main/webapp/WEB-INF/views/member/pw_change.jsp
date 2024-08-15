<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <link href="/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
  <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <link href="/css/member/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/footer/footer.css" rel="stylesheet" type="text/css">
  <style>
  #loading {
  	position: fixed;
  	top: 0;
  	left: 0;
  	width: 100%;
  	height: 100%;
  	background: rgba(255, 255, 255, 0.8);
  	display: none;
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
  </style>
</head>
<body>
	<div id="loading">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
			<div class="loading-text">임시번호 이메일로 전송중~~~! 기다료~~~</div>
	</div>
	 <div class="page-wrapper">
	
    <%@ include file="../Nav/guNav.jsp" %>	
	
	
	<!--한) 비밀번호찾기 start-->
    <div class="main-wrapper">
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
                  <div class="accent">가입시 등록하신 정보를 입력해주세요.</div>
                  <div class="spacer-large"></div>
                  <h1>비밀번호 찾기</h1>
                  <div class="spacer-large"></div>
                  <p></p>
                </div>
			                                
                <!-- 비밀번호찾기(이메일인증) start-->
                <!-- <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form"> -->
                <div id="Style-Guide-Form"  style="opacity:1; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">

				  <div class="spacer-large"></div>				  
					<form action="${pageContext.request.contextPath}/member/pw_change" method="post" name="wf-form-Contact-Form" id="wf-form-Contact-Form" class="form" >						
						<!-- 비밀번호 찾기 -->	
						<div class="form-field-wrapper">						
							<input class="form-field w-input" maxlength="256" name="member_id" placeholder="아이디" type="text" id="id" pattern="[A-Za-z0-9]{6,}" required>						
						</div>
						<div class="form-field-wrapper">						
							<input class="form-field w-input" maxlength="256" name="member_email" placeholder="이메일" type="email" id="member_email" required>
						</div>
						
						<div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper imsipw">
							<input type="submit" class="button-primary-large w-button" value="임시 비밀번호 발급">
						</div>										
					</form>
					<div class="spacer-large"></div>
				    <c:if test="${not empty result}">
				        <p class="button-primary-large-msg-y">${result}</p>
				    </c:if> 									  				  				  
                </div>
                <!-- 비밀번호찾기(이메일인증) end-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!--한) 비밀번호찾기 end-->
  </div><!-- page-wrapper end -->

  <%@ include file="../footer.jsp" %>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  			
  <script>
	$(document).ready(function() {
	    // Click event handler for the submit button
	    $(".imsipw").click(function(event) {
	      $("form").submit();


	        // Delay the form submission by 5 seconds (5000 milliseconds)
	        setTimeout(function() {
	            // Submit the form after the delay
	         $("#loading").css("display", "flex");
	        });
	    });
	});

	</script>
</body>
</html>