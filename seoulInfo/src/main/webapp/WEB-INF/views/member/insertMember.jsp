<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4825" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>회원가입</title>
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
  <link href="/css/member/insertMember.css" rel="stylesheet" type="text/css">  
  <link href="/css/footer/footer.css" rel="stylesheet" type="text/css">

<style type="text/css">

/* 회색 텍스트를 적용하고 왼쪽 여백을 추가하는 클래스 */
.label-gray {
    color: #808080; /* 회색 색상 코드 */
    margin-left: 20px; /* 왼쪽 여백 설정, 필요에 따라 조절 가능 */
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
</head>
<body>
  <div class="page-wrapper">
	<!-- 검색 start -->
	<%@ include file="../Nav/guNav.jsp" %>
	
	<!--한) 회원가입 start-->
    <div class="main-wrapper">
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
              
              	<!-- 왼쪽 컬럼 -->
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
                  <div class="accent">서울 지역 안내 서비스에 오신 것을 환영합니다.</div>
                  <div class="spacer-large"></div>
                  <h1>회원가입</h1>
                  <div class="spacer-large"></div>
                  <p></p>
                  <div class="alert-message" id="alert-message"></div>
                </div>
				
				<!-- 오른쪽 컬럼 -->
                <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">				  
                  <form action="saveMember" method="post" name="wf-form-Contact-Form" id="wf-form-Contact-Form" 
				  		class="form" data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a65" >
                    <div class="form-field-wrapper">                   							
						<input class="form-field w-input" maxlength="256" name="member_id" placeholder="아이디" type="text" id="id" pattern="[A-Za-z0-9]{6,}" required>
						<div class="error-message" id="id-error">아이디는 영문자와 숫자로 이루어진 6자 이상이어야 합니다.</div>
		                <div class="error-message" id="id-duplicate-error">이미 사용 중인 아이디입니다.</div>
		                <div class="success-message" id="id-available-message">사용 가능한 아이디입니다.</div>												
					</div>
					<div class="form-field-wrapper">						
						<input class="form-field w-input" maxlength="256" name="member_pw" placeholder="비밀번호" type="password" id="pw" pattern="[A-Za-z0-9]{6,}" required>
						<div class="error-message" id="pw-error">비밀번호는 영문자와 숫자로 이루어진 6자 이상이어야 합니다.</div>
					</div>
					<div class="form-field-wrapper">
						<input class="form-field w-input" maxlength="256" placeholder="비밀번호 확인" type="password" id="pwCheck" pattern="[A-Za-z0-9]{6,}" required>
						<div class="error-message" id="pwCheck-error">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>
					</div>
					<div class="form-field-wrapper">
						<input class="form-field w-input" maxlength="256" name="member_name" placeholder="이름" type="text" id="name" pattern="[가-힣]{2,}" required>
						<div class="error-message" id="name-error">이름은 한글 2자 이상이어야 합니다.</div>
					</div>
                    <div class="form-field-wrapper">
						<input class="form-field w-input" maxlength="256" name="member_email" placeholder="이메일" type="email" id="email" required>
						<div class="error-message" id="email-error">유효한 이메일 주소를 입력하세요.</div>
						<div class="error-message" id="email-duplicate-error">이미 사용 중인 이메일입니다.</div>
		                <div class="success-message" id="email-available-message">사용 가능한 이메일입니다.</div>	
					</div>
					<div class="form-field-wrapper">
						<input class="form-field w-input" maxlength="256" name="member_tel" placeholder="전화번호" type="tel" id="tel" required>
						<div class="error-message" id="tel-error">전화번호는 숫자로 이루어진 10자 이상이어야 합니다.</div>
					</div>
					<div class="form-field-wrapper">
<!-- 						<input class="form-field w-input" maxlength="256" name="member_area" placeholder="지역" type="text" id="area" required>
						<div class="error-message" id="area-error">지역을 선택하세요.</div> -->
					    <label for="area" class="label-gray">지역</label>
					    <select class="form-field w-input" name="member_area" id="area" required>
					        <option value="" disabled selected>지역을 선택하세요</option>
					        <option value="강남구">강남구</option>
					        <option value="강동구">강동구</option>
					        <option value="강북구">강북구</option>
					        <option value="강서구">강서구</option>
					        <option value="관악구">관악구</option>
					        <option value="광진구">광진구</option>
					        <option value="구로구">구로구</option>
					        <option value="금천구">금천구</option>
					        <option value="노원구">노원구</option>
					        <option value="도봉구">도봉구</option>
					        <option value="동대문구">동대문구</option>
					        <option value="동작구">동작구</option>
					        <option value="마포구">마포구</option>
					        <option value="서대문구">서대문구</option>
					        <option value="서초구">서초구</option>
					        <option value="성동구">성동구</option>
					        <option value="성북구">성북구</option>
					        <option value="송파구">송파구</option>
					        <option value="양천구">양천구</option>
					        <option value="영등포구">영등포구</option>
					        <option value="용산구">용산구</option>
					        <option value="은평구">은평구</option>
					        <option value="종로구">종로구</option>
					        <option value="중구">중구</option>
					        <option value="중랑구">중랑구</option>
					    </select>
					    <div class="error-message" id="area-error">지역을 선택하세요.</div>						
					</div>
                    <div id="w-node-f07c70ce-d9c4-2d68-1944-a2df54e9288d-4f5c4825" class="contact-form-button-wrapper">
						<input type="submit" class="button-primary-large w-button" value="회원가입">
					</div>
                  </form>				  				  				  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!--한) 회원가입 end-->
	
  </div><!-- page-wrapper end -->
  <%@ include file="../footer.jsp" %>  

<script type="text/javascript">

	$(document).ready(function() {
		// 문자열 부분(?로 시작하는 부분)을 가져옴
		const queryParams = new URLSearchParams(window.location.search);
		const email = queryParams.get('member_email');
		const name = queryParams.get('member_name');
		
		console.log(email +"."+ name)
		// 받은 파라메터로 값 설정
		document.getElementById('name').value = name;
		document.getElementById('email').value = email;
				

		//회원가입 유효성 검사
	    var fields = [
	        { id: "#id", errorId: "#id-error", pattern: /^[A-Za-z0-9]{6,}$/, message: "아이디는 영문자와 숫자로 이루어진 6자 이상이어야 합니다." },
	        { id: "#pw", errorId: "#pw-error", pattern: /^[A-Za-z0-9]{6,}$/, message: "비밀번호는 영문자와 숫자로 이루어진 6자 이상이어야 합니다." },
	        { id: "#pwCheck", errorId: "#pwCheck-error", pattern: /^[A-Za-z0-9]{6,}$/, message: "비밀번호가 일치하지 않습니다. 다시 입력해주세요." },
	        { id: "#name", errorId: "#name-error", pattern: /^[가-힣]{2,}$/, message: "이름은 한글 2자 이상이어야 합니다." },
	        { id: "#email", errorId: "#email-error", pattern: /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/, message: "유효한 이메일 주소를 입력해주세요." },
	        { id: "#tel", errorId: "#tel-error", pattern: /^[0-9]{10,15}$/, message: "전화번호는 숫자로 이루어진 10자 이상이어야 합니다." },
	        { id: "#area", errorId: "#area-error", pattern: /.+/, message: "지역을 입력하세요." }
	    ];
	
	    // 각 필드에 blur 이벤트 추가
	    fields.forEach(function(field) {
	        $(field.id).on('blur', function() {
	            validateField(field);
	        });
	    });
	
	    // 아이디 유효성 검사
	    $("#id").on('blur', function() {
	        var id = $("#id").val();
	        if (/^[A-Za-z0-9]{6,}$/.test(id)) {
	            checkIdDuplicate(id);
	        } else {
	            hideMessage("#id-available-message");
	            showError("#id-error", "아이디는 영문자와 숫자로 이루어진 6자 이상이어야 합니다.");
	        }
	    });
	    
	    // 이메일 유효성 검사
	    $("#email").on('blur', function() {
	        var email = $("#email").val();
	        if (/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/.test(email)) {
	        	checkEmailDuplicate(email);
	        } else {
	            hideMessage("#email-available-message");
	            showError("#email-error", "유효한 이메일 주소를 입력해주세요.");
	        }
	    });
	
	    // 비밀번호 확인 일치 여부 검사
	    $("#pwCheck").on('blur', function() {
	        var pw = $("#pw").val();
	        var pwCheck = $("#pwCheck").val();
	        if (pw !== pwCheck) {
	            showError("#pwCheck-error", "비밀번호가 일치하지 않습니다.");
	        } else {
	            hideError("#pwCheck-error");
	        }
	    });
	    
	
	    function validateField(field) {
	        var value = $(field.id).val();
	        if (!field.pattern.test(value)) {
	            showError(field.errorId, field.message);
	        } else {
	            hideError(field.errorId);
	        }
	    }
		
	    //아이디 중복 검사 : DB확인
	    function checkIdDuplicate(id) {
			// AJAX를 이용하여 서버로 아이디 중복 확인 요청을 전송
	        $.ajax({
	            url: 'idChk',  //아이디 중복 확인을 처리하는 서버의 url(Controller의 value="이름")
	            type: 'POST',
	            data: { member_id: id }, //서버에 전송할 데이터 { DB 이름 : id 이름 }
	            success: function(data) {
	            	//alert(data); //데이터가 맞게 불러오는지 값 확인
	                if (data == 1) {
	                    showError("#id-duplicate-error", "이미 사용 중인 아이디입니다.");
	                    hideMessage("#id-available-message");
	                } else if (data == 0){
	                    showMessage("#id-available-message", "사용 가능한 아이디입니다.");
	                    hideError("#id-duplicate-error");
	                }
	            },
	            error: function() {
	                showError("#id-duplicate-error", "아이디 중복 검사를 실패했습니다. 다시 시도해주세요.");
	            }
	        });
	    }
	    
	    //이메일 중복 검사 : DB확인
	    function checkEmailDuplicate(email) {
			// AJAX를 이용하여 서버로 아이디 중복 확인 요청을 전송
	        $.ajax({
	            url: 'emailChk',  //이메일 중복 확인을 처리하는 서버의 url(Controller의 value="이름")
	            type: 'POST',
	            data: { member_email: email }, //서버에 전송할 데이터 { DB 이름 : id 이름 }
	            success: function(data) {
	            	//alert(data); //데이터가 맞게 불러오는지 값 확인
	                if (data == 1) {
	                    showError("#email-duplicate-error", "이미 사용 중인 이메일입니다.");
	                    hideMessage("#email-available-message");
	                } else if (data == 0){
	                    showMessage("#email-available-message", "사용 가능한 이메일입니다.");
	                    hideError("#email-duplicate-error");
	                }
	            },
	            error: function() {
	                showError("#email-duplicate-error", "이메일 중복 검사를 실패했습니다. 다시 시도해주세요.");
	            }
	        });
	    }
	    
	
	    function showError(errorId, message) {
	        $(errorId).text(message).show();
	    }
	
	    function hideError(errorId) {
	        $(errorId).hide();
	    }
	
	    function showMessage(messageId, message) {
	        $(messageId).text(message).show();
	    }
	
	    function hideMessage(messageId) {
	        $(messageId).hide();
	    }
	    
	    
	    	 
        
	    
	});
	


</script>  
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>