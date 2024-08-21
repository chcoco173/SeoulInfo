<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.beans.factory.annotation.Value" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4825" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>로그인</title>
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

  <link href="/css/member/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/footer/footer.css" rel="stylesheet" type="text/css">

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
	<%@ include file="../Nav/guNav.jsp" %>	
	<!--한) 로그인 start-->
    <div class="main-wrapper">
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
					<c:if test="${not empty insertMember}">
						<h5 class="login-title">회원가입을 축하드립니다.</h5>
					</c:if>
					
					<div class="accent">다양한 서비스를 제공 받을 수 있습니다.</div>
					
                  <div class="spacer-large"></div>
                  <h1>로그인</h1>
                  <div class="spacer-large"></div>
                  <p></p>
                </div>
                <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:1; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">				  
					<form action="loginCheck" method="post" name="wf-form-Contact-Form" id="wf-form-Contact-Form" class="form" 
						data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a65">
					<c:if test="${not empty result}">
						<input type="hidden" name="pwchangecheck" value="${result}">
					</c:if>
					<div class="form-field-wrapper">						
						<input class="form-field w-input" maxlength="256" name="member_id" placeholder="아이디" type="text" id="id" pattern="[A-Za-z0-9]{6,}" required>						
					</div>
					<div class="form-field-wrapper">						
						<input class="form-field w-input" maxlength="256" name="member_pw" placeholder="비밀번호" type="password" id="pw" pattern="[A-Za-z0-9]{6,}" required>
					</div>
					<c:if test="${not empty result}">
						<p class="button-primary-large-msg-y">${result}</p>
					</c:if>
					<c:if test="${not empty memberID}">
						<div class="button-primary-large-msg-y">당신의 아이디는 ${memberID} 입니다.</div>
					</c:if>
					<c:if test="${not empty no_ID}">
						<div class="button-primary-large-msg-n">이름과 이메일이 일치하는 아이디가 없습니다. 회원가입하시거나 다시 입력해주세요.</div>		
					</c:if>
					<c:if test="${not empty loginCheck}">
						<p class="button-primary-large-msg-y">${loginCheck}</p>
					</c:if> 
					<div class="spacer-large"></div>
					<div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper">					
						<input type="submit" class="button-primary-large-b w-button_login loginBtn" value="로그인">
						<!-- 네이버로그인 id값이 naver_id_login 여야만 실행 가능-->
						<div id="naver_id_login" class="button-primary-large-g w-button_naver"></div>

						<!--<div class="button-primary-large-g w-button_naver">네이버 로그인</div>-->
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
  <%@ include file="../footer.jsp" %>
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <!-- 네이버 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript">
	// 채은 api 키	
    var naver_id_login = new naver_id_login("mwih9PLmsIf9FHg7_L2K", "http://localhost:8080/member/login");
    var state = naver_id_login.getUniqState();

    naver_id_login.setButton("white", 2, 40);
    naver_id_login.setDomain("http://localhost:8080");
    naver_id_login.setState(state);
    // naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();

    function naverSignInCallback() {
        // 로그인 성공 후 처리할 작업
        var email = naver_id_login.getProfileData('email');
        var nickname = naver_id_login.getProfileData('nickname');
        var name = naver_id_login.getProfileData('name');
        var age = naver_id_login.getProfileData('age');
        var gender = naver_id_login.getProfileData('gender');
        var birthday = naver_id_login.getProfileData('birthday');
        var mobile = naver_id_login.getProfileData('mobile');

        // alert(email+nickname+age+gender)

        // AJAX 요청으로 이메일 존재 여부 확인
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/member/emailCheck",
            data: JSON.stringify({ email: email }),
            dataType: 'json',
            success: function(result) {
                if (result.exists) {
                    loginWithNaver(email);
                } else {
                    // 이메일이 존재하지 않으면 회원가입으로 유도
                    alert("가입된 이메일이 없습니다 회원가입후 로그인 부탁드립니다");
                    var baseUrl = '${pageContext.request.contextPath}/member/insertMember';
                    var redirectUrl = baseUrl + '?member_email=' + encodeURIComponent(email) +
                        '&member_name=' + encodeURIComponent(name);
                    window.location.href = redirectUrl;
                }
            },
            error: function(e) {
                console.log("이메일 확인 중 오류 발생", e);
                alert("로그인 처리중 오류가 발생했습니다.");
            }
        });
    }

    function loginWithNaver(email) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/member/login-naver",
            data: JSON.stringify({ email: email }),
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    alert("네이버 로그인 성공!");
                    // 페이지 새로고침
                    window.location.href="/";
                } else {
                    alert("로그인에 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("네이버 로그인 처리 중 오류 발생", error);
                alert("로그인 처리 중 오류가 발생했습니다.");
            }
        });
    }

    // 페이지 로드 완료 후 실행
    window.addEventListener('load', function() {
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
    });
    </script>

</body>
</html>