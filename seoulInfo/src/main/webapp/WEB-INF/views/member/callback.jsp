<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">

  //네이버 로그인	
  var naver_id_login = new naver_id_login("HA94y0JpXRf7aYIext_2", "http://localhost:8080/member/callback");
  
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //alert(naver_id_login.getProfileData('email'));
    //alert(naver_id_login.getProfileData('name'));  
    
    var email = naver_id_login.getProfileData('email');
    var name = naver_id_login.getProfileData('name');
    

    
    // 이메일을 서버로 전송하여 사용자 등록 여부 확인
    $.ajax({
      url: 'emailChkNaver',  // Spring MVC 컨트롤러의 URL
      type: 'POST',
      data: { member_email: email },  // 이메일 데이터
      success: function(response) {
        var data = JSON.parse(response);
        if (data.isRegistered) {
          // 사용자가 등록된 경우
          //alert(name + '님, 환영합니다!');
          window.location.href = '/';
        } else {
          // 사용자가 등록되지 않은 경우
          alert('처음 방문하신 고객님!! 회원 가입 후 서비스가 이용가능합니다.');
          window.location.href = '/member/insertMember';
        }
      },
      error: function() {
        alert('사용자 등록 확인 중 오류가 발생했습니다.');
      }
    });    
    
  }
  

  
</script>




</body>
</html>