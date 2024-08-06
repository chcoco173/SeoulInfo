<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <link href="/css/mypage/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
  
  <style type="text/css">
  	/* 로그인 성공 메세지 */
    .login-success-title {
      color: #007bff;
      font-weight: bold;
    }
    
    .error-message {
    display: none;
    color: red;
	}
	
	.success-message {
    display: none;
    color: green;
	}
	
    /* alert창 : 기본적인 alert 박스 스타일 */
    .alert {
        padding: 20px;
        border: 1px solid transparent;
        border-radius: 8px;
        position: fixed; /* 화면 상단에 고정 */
        top: 20px; /* 페이지 상단에서의 위치 */
        left: 50%;
        transform: translateX(-50%); /* 수평 중앙 정렬 */
        z-index: 9999; /* 다른 요소들보다 위에 보이도록 */
        width: 400px; /* 원하는 너비 */
        max-width: 100%;
        background-color: #d4edda;
        color: #155724;
        display: none; /* 초기 상태에서는 숨김 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        position: relative; /* 닫기 버튼을 위한 위치 기준 */
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
    }

    .alert-error {
        background-color: #f8d7da;
        color: #721c24;
    }

    .alert .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background: transparent;
        border: none;
        font-size: 16px;
        cursor: pointer;
        color: inherit; /* 상속된 색상 사용 */
    }

    .alert.show {
        display: block; /* 표시 상태 */
    }
    
    
/* 팝업창 : 기본 스타일링 */
.popup {
    display: none; /* 숨기기 */
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 배경을 어둡게 */
    justify-content: center;
    align-items: center;
    z-index: 1000; /* 팝업이 다른 요소 위에 표시되도록 */
}

.popup-content {
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    position: relative;
    width: 300px;
}

.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 20px;
    cursor: pointer;
}    	 
	
  </style>  
  

   
</head>
<body>
  <div class="page-wrapper">
	

	
	<!-- 검색 start -->
    <div class="navigation-wrapper">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
          <a href="/" aria-current="page" class="brand w-nav-brand w--current"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
          <div class="links-and-search-wrapper">
            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
              <div class="login-success-title">${sessionScope.member.member_name}님, 환영합니다.</div>
              <a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a>
              <a href="/member/logout" class="nav-link w-nav-link">로그아웃</a>
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
	<!-- 검색 end -->	
	
	
    <div class="main-wrapper">
    
    	<!--한) 마이페이지 start-->
      <div class="section-posts-row">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">				
 		
              <h2 data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f381" style="opacity:1">마이페이지</h2>              
              <div class="spacer-xlarge"></div>
              <div data-w-id="92aebb47-1885-83d3-60a8-004b18e908c0" style="opacity:1" class="divider-line"></div>
              <div class="spacer-xlarge"></div>
			  
              <div class="w-dyn-list">
                <div role="list" class="w-dyn-items">
                
                  <div data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f385" style="opacity:1" role="listitem" class="w-dyn-item">
                    <div class="post-row-grid">
		           <!-- 프로필 사진 -->
		           <c:choose>
		          	 	<c:when test="${sessionScope.member.member_imageName == null}">		         
		                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
							  		class="post-row-image-overflow-container w-inline-block">
		                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
									style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
									class="post-row-image">
								<img src="/images/mypage/default_profile.jpg" >
								</div>
		                      </a>
		                  </c:when>
		                 <c:otherwise>
		                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
							  		class="post-row-image-overflow-container w-inline-block">
		                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
									style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
									class="post-row-image">
								<img src="/files/${sessionScope.member.member_imageName}">
								</div>
		                      </a>                 
		                 </c:otherwise>     
		           </c:choose>          					
                	<!-- 회원정보 -->	
                      <div id="w-node-bbff658c-4524-8e8f-d0bf-96425152472b-4f5c4820" class="post-row-wrapper">						
                        <div class="tags-wrappers">
                          <a href="" class="tag-a w-inline-block">회원아이디 : ${sessionScope.member.member_id}
                            <div class="text-size-small w-dyn-bind-empty"></div>
                          </a>
                          <a href="" class="tag-a w-inline-block">회원이메일 : ${sessionScope.member.member_email}
                            <div class="text-size-small w-dyn-bind-empty"></div>
                          </a>
                        </div>												
                      </div>				
                    </div>
                  </div>
                
				<!-- 한)마이페이지 탭 start-->
				 <div>
					<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
					  <h4></h4>
					  <div class="spacer-large"></div>
					  <a href="/mypage/profile" class="tag-t w-inline-block">프로필 관리</a>

					  <a href="/mypage/memberInfo" class="tag-t w-inline-block">개인정보 관리</a>
					  
					  <a href="/mypage/newsComment" class="tag-t w-inline-block">내가 작성한 댓글</a>
					  
					  <a href="/mypage/product" class="tag-t w-inline-block">관심상품 목록</a>
					  
					  <a href="/mypage/ev" class="tag-t w-inline-block">충전소 즐겨찾기</a>
					  
					  <a href="/mypage/question" class="tag-t w-inline-block">1 : 1 문의</a>				  				  
					</div>
				</div>
				<!-- 한)마이페이지 탭 end-->
																				
				</div>					
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--한) 마이페이지 end-->					

          
    
    <!--한) 개인정보관리 start-->
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
              
              	<!-- 왼쪽 컬럼 -->
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
                  <div class="accent"></div>
                  <div class="spacer-large"></div>
                  <h1>개인정보 관리</h1>
                  <div class="spacer-large"></div>
                  <p></p>
<!-- 					<div id="alert-box" class="alert alert-success">
					    <button class="close-btn" onclick="hideAlert()">×</button>
					    <div id="alert-message"></div>
					</div> --> 
                </div>
                
					<c:if test="${not empty message}">
					    <div id="popup" class="popup">
					        <div class="popup-content">
					            <span class="close-btn" onclick="hidePopup()">×</span>
					            <p>${message}</p>
					        </div>
					    </div>
					</c:if>                
				
				<!-- 오른쪽 컬럼 -->

                <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">				  

                  <form action="${pageContext.request.contextPath}/member/updateMember" method="POST" name="wf-form-Contact-Form" id="wf-form-Contact-Form" 
				  		class="form member-info-form" data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a65">	
					<input class="form-field w-input" type="hidden" name="member_id" id="id" value="${sessionScope.member.member_id}">

					<div class="form-field-wrapper">
						<label>비밀번호</label>						
						<input class="form-field w-input" maxlength="256" name="member_pw" type="password" id="pw" value="" pattern="[A-Za-z0-9]{6,}" placeholder="회원정보를 수정하실려면 비밀번호를 입력해주세요.">
						<div class="error-message" id="pw-error">비밀번호는 영문자와 숫자로 이루어진 6자 이상이어야 합니다.</div>
					</div>
					<div class="form-field-wrapper">
						<label>비밀번호 확인</label>
						<input class="form-field w-input" maxlength="256" type="password" id="pwCheck" pattern="[A-Za-z0-9]{6,}" >
						<div class="error-message" id="pwCheck-error">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>
					</div>
					<div class="form-field-wrapper">
						<label>이름</label>
						<input class="form-field w-input" maxlength="256" name="member_name" type="text" id="name" value="${sessionScope.member.member_name}" pattern="[가-힣]{2,}" >
						<div class="error-message" id="name-error">이름은 한글 2자 이상이어야 합니다.</div>
					</div>
                    <div class="form-field-wrapper">
                    	<label>이메일</label>
						<input class="form-field w-input" maxlength="256" name="member_email" type="email" id="email" value="${sessionScope.member.member_email}" >
						<div class="error-message" id="email-error">유효한 이메일 주소를 입력하세요.</div>
						<div class="error-message" id="email-duplicate-error">이미 사용 중인 이메일입니다.</div>
		                <div class="success-message" id="email-available-message">사용 가능한 이메일입니다.</div>
					</div>
					<div class="form-field-wrapper">
						<label>전화번호</label>
						<input class="form-field w-input" maxlength="256" name="member_tel" type="tel" id="tel" value="${sessionScope.member.member_tel}">
						<div class="error-message" id="tel-error">전화번호는 숫자로 이루어진 10자 이상이어야 합니다.</div>
					</div>
					<div class="form-field-wrapper">
						<label for="area">지역</label>
					    <select class="form-field w-input" name="member_area" id="area">
										<option ${sessionScope.member.member_area eq '강남구' ? 'selected' : ''}>강남구</option>
										<option ${sessionScope.member.member_area eq '강동구' ? 'selected' : ''}>강동구</option>
										<option ${sessionScope.member.member_area eq '강서구' ? 'selected' : ''}>강서구</option>
										<option ${sessionScope.member.member_area eq '강북구' ? 'selected' : ''}>강북구</option>
										<option ${sessionScope.member.member_area eq '관악구' ? 'selected' : ''}>관악구</option>
										<option ${sessionScope.member.member_area eq '광진구' ? 'selected' : ''}>광진구</option>
										<option ${sessionScope.member.member_area eq '구로구' ? 'selected' : ''}>구로구</option>
										<option ${sessionScope.member.member_area eq '금천구' ? 'selected' : ''}>금천구</option>
										<option ${sessionScope.member.member_area eq '노원구' ? 'selected' : ''}>노원구</option>
										<option ${sessionScope.member.member_area eq '도봉구' ? 'selected' : ''}>도봉구</option>
										<option ${sessionScope.member.member_area eq '동대문구' ? 'selected' : ''}>동대문구</option>
										<option ${sessionScope.member.member_area eq '동작구' ? 'selected' : ''}>동작구</option>
										<option ${sessionScope.member.member_area eq '마포구' ? 'selected' : ''}>마포구</option>
										<option ${sessionScope.member.member_area eq '서대문구' ? 'selected' : ''}>서대문구</option>
										<option ${sessionScope.member.member_area eq '서초구' ? 'selected' : ''}>서초구</option>
										<option ${sessionScope.member.member_area eq '성동구' ? 'selected' : ''}>성동구</option>
										<option ${sessionScope.member.member_area eq '성북구' ? 'selected' : ''}>성북구</option>
										<option ${sessionScope.member.member_area eq '송파구' ? 'selected' : ''}>송파구</option>
										<option ${sessionScope.member.member_area eq '양천구' ? 'selected' : ''}>양천구</option>
										<option ${sessionScope.member.member_area eq '영등포구' ? 'selected' : ''}>영등포구</option>
										<option ${sessionScope.member.member_area eq '용산구' ? 'selected' : ''}>용산구</option>
										<option ${sessionScope.member.member_area eq '은평구' ? 'selected' : ''}>은평구</option>
										<option ${sessionScope.member.member_area eq '종로구' ? 'selected' : ''}>종로구</option>
										<option ${sessionScope.member.member_area eq '중구' ? 'selected' : ''}>중구</option>
										<option ${sessionScope.member.member_area eq '중랑구' ? 'selected' : ''}>중랑구</option>
					    </select>
					    <div class="error-message" id="area-error">지역을 선택하세요.</div>	
					</div>					
                    <div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper">
						<input type="submit" class="button-primary-large w-button" value="회원정보 수정">
					</div>
                  </form>
                  <div class="spacer-large"></div>
<%-- 					<c:if test="${not empty message}">
				        <div class="alert alert-success">${message}</div>
				    </c:if> --%>
                 				  				  				  
                </div>
				
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--한) 개인정보 관리 end-->



            
    </div>
    <!-- main-wrapper end -->
	
	
	
    <div class="section-newsletter">
      <div class="padding-global">
        <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
          <div class="_2-column-grid-uneven-left">
            <h3 class="newsletter-heading">Love what you see? Sign up for my newsletter and stay in touch.</h3>
            <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
              <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2"><input class="form-field newsletter w-input" maxlength="256" name="Email" data-name="Email" placeholder="Your email address" type="email" id="Email" required=""><input type="submit" data-wait="Please wait..." class="button-primary-large max-width-full-mobile-portrait w-button" value="Join"></form>
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
    <!-- section-newsletter end -->
    
    <div class="section-footer">
      <div class="padding-global">
        <div class="spacer-xxlarge"></div>
        <div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe" class="container-footer">
          <div class="padding-global">
            <div class="padding-section-medium">
              <div class="_2-column-grid">
                <a href="/member/loginSuccess" class="w-inline-block"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
                <div>
                  <h3>The stories of a travel photographer and blogger exploring the world .</h3>
                  <div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb" class="spacer-xxlarge"></div>
                </div>
              </div>
              <div class="_2-column-grid footer">
                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb" class="footer-micro-links-wrapper">
                  <p class="text-size-small">Website template by <a href="https://www.callistodigitalstudio.com/" target="_blank" class="text-size-small">Callisto Digital Studio</a>.</p>
                  <p class="text-size-small">Powered by <a href="https://webflow.com/templates/html/sightseer-travel-website-template" target="_blank" class="text-size-small">Webflow</a>.</p>
                </div>
                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb" class="_3-column-grid footer-links">
                  <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
                    <h4>About</h4>
                    <div class="spacer-large"></div>
                    <a href="about.html" class="footer-link">About</a>
                    <a href="contact.html" aria-current="page" class="footer-link w--current">Contact</a>
                  </div>
                  <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
                    <h4>Social</h4>
                    <div class="spacer-large"></div>
                    <a href="http://tiktok.com" target="_blank" class="footer-link">TikTok</a>
                    <a href="http://Instagram.com" target="_blank" class="footer-link">Instagram</a>
                    <a href="http://Facebook.com" target="_blank" class="footer-link">Facebook</a>
                    <a href="http://Youtube.com" target="_blank" class="footer-link">Youtube</a>
                  </div>
                  <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
                    <h4>Theme</h4>
                    <div class="spacer-large"></div>
                    <a href="template/template-style-guide.html" class="footer-link">Style Guide</a>
                    <a href="template/changelog.html" class="footer-link">Changelog</a>
                    <a href="template/licenses.html" class="footer-link">Licenses</a>
                    <a href="https://webflow.com/templates/designers/callisto-digital-studio" target="_blank" class="footer-link">All Templates</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="spacer-xxlarge"></div>
      </div>
    </div>
    <!-- section-footer end -->           
    
  </div>
  <!-- page-wrapper end -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // 유효성 검사 함수
        function validateField(field) {
            var value = $(field.id).val();
            if (!field.pattern.test(value)) {
                showError(field.errorId, field.message);
                return false; // 검증 실패
            } else {
                hideError(field.errorId);
                return true; // 검증 성공
            }
        }

        function validateEmail(email) {
            var originalEmail = "${sessionScope.member.member_email}";
            var isValid = true;

            if (email !== originalEmail) {
                $.ajax({
                    url: '/member/emailChk',
                    type: 'POST',
                    data: { member_email: email },
                    success: function(data) {
                        if (data == 1) {
                            showError("#email-duplicate-error", "이미 사용 중인 이메일입니다.");
                            hideSuccess("#email-available-message");
                            isValid = false;
                        } else {
                            hideError("#email-duplicate-error");
                            showSuccess("#email-available-message", "사용 가능한 이메일입니다.");
                        }
                        // 폼 제출 여부 결정
                        if (isValid) {
                            $(".member-info-form").off('submit').submit();
                        }
                    },
                    error: function() {
                        showError("#email-error", "이메일 중복 검사를 실패했습니다. 다시 시도해주세요.");
                        isValid = false;
                    }
                });
            } else {
                $(".member-info-form").off('submit').submit();
            }
        }

        // 폼 제출 이벤트
        $(".member-info-form").on('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            var isValid = true;
            var fields = [
                { id: "#pw", errorId: "#pw-error", pattern: /^[A-Za-z0-9]{6,}$/, message: "비밀번호는 영문자와 숫자로 이루어진 6자 이상이어야 합니다." },
                { id: "#pwCheck", errorId: "#pwCheck-error", pattern: /^[A-Za-z0-9]{6,}$/, message: "비밀번호가 일치하지 않습니다. 다시 입력해주세요." },
                { id: "#name", errorId: "#name-error", pattern: /^[가-힣]{2,}$/, message: "이름은 한글 2자 이상이어야 합니다." },
                { id: "#email", errorId: "#email-error", pattern: /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/, message: "유효한 이메일 주소를 입력해주세요." },
                { id: "#tel", errorId: "#tel-error", pattern: /^[0-9]{10,15}$/, message: "전화번호는 숫자로 이루어진 10자 이상이어야 합니다." },
                { id: "#area", errorId: "#area-error", pattern: /.+/, message: "지역을 입력하세요." }
            ];

            // 각 필드 유효성 검사
            fields.forEach(function(field) {
                if (!validateField(field)) {
                    isValid = false; // 검증 실패
                }
            });

            // 비밀번호와 비밀번호 확인 일치 검사
            var pw = $("#pw").val();
            var pwCheck = $("#pwCheck").val();
            if (pw !== pwCheck) {
                showError("#pwCheck-error", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                isValid = false; // 검증 실패
            } else {
                hideError("#pwCheck-error");
            }

            // 이메일 검증
            var email = $("#email").val();
            if (isValid) {
                validateEmail(email);
            }
        });

        // 입력 필드 blur 이벤트
        $(".member-info-form input").on('blur', function() {
            var fieldId = "#" + $(this).attr('id');
            var field = fields.find(f => f.id === fieldId);
            if (field) {
                validateField(field);
            }
            if ($(this).attr('id') === 'email') {
                validateEmail($(this).val());
            }
        });

        // 에러 메시지 표시 함수
        function showError(errorId, message) {
            $(errorId).text(message).show();
        }

        function hideError(errorId) {
            $(errorId).hide();
        }

        // 성공 메시지 표시 함수
        function showSuccess(successId, message) {
            $(successId).text(message).show();
        }

        function hideSuccess(successId) {
            $(successId).hide();
        }

    });
    
    
    // alert창 : 회원정보 수정 성공 
    function showAlert(message, type) {
        var alertBox = document.getElementById('alert-box');
        var alertMessage = document.getElementById('alert-message');
        alertBox.className = 'alert ' + type; // 알림 유형에 따라 클래스를 설정
        alertMessage.textContent = message;
        alertBox.classList.add('show'); // alert 박스를 보이게 설정
    }

    function hideAlert() {
        var alertBox = document.getElementById('alert-box');
        alertBox.classList.remove('show'); // alert 박스를 숨김
    }

    // 페이지 로드 후 메시지 표시
    document.addEventListener('DOMContentLoaded', function() {
        var message = '${message}'; // JSP 변수에서 메시지를 가져옴
        if (message && message.includes('수정되었습니다.')) {
            showAlert(message, 'alert-success'); // 성공 메시지일 때만 alert 박스를 표시
        }
    });
    
    // 팝업창 : 회원정보 수정 성공 
    function showPopup() {
        document.getElementById('popup').style.display = 'flex';
    }

    function hidePopup() {
        document.getElementById('popup').style.display = 'none';
    }

    // 페이지가 로드될 때 팝업을 자동으로 표시
    window.onload = function() {
        if (document.getElementById('popup')) {
            showPopup();
        }
    }    
    
</script>
  
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>