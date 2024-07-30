import React, { useState } from 'react';
import '../css/Login.css'; // 로그인 페이지의 스타일을 가져옴
import { useNavigate } from 'react-router-dom'; // 페이지 이동을 위한 훅을 가져옴
import { useAuth } from './AuthContext'; // 인증 컨텍스트를 가져옴

function Login() {
  const [adminId, setAdminId] = useState(''); // 관리자 아이디를 저장할 상태
  const [adminPw, setAdminPw] = useState(''); // 관리자 비밀번호를 저장할 상태
  const [errorMessage, setErrorMessage] = useState(''); // 에러 메시지를 저장할 상태
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수
  const { login } = useAuth(); // AuthContext에서 login 함수를 가져옴

  // 로그인 버튼 클릭 시 호출되는 함수
  const handleLogin = async () => {
    try {
      const response = await login(adminId, adminPw); // 로그인 시도
      if (response) {
        navigate('/menubar/user-info/'); // 로그인 성공 시 회원정보 페이지로 이동
      }
    } catch (error) {
      if (error.response) {
        setErrorMessage(error.response.data.message); // 서버에서 받은 에러 메시지 설정
      } else {
        setErrorMessage('로그인 시도 중 오류가 발생했습니다.'); // 기타 에러 메시지 설정
      }
    }
  };

  // 입력 필드에서 Enter 키를 눌렀을 때 로그인 시도하는 함수
  const handleKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleLogin();
    }
  };

  return (
    <div className="login-container">
      <div className="login-form">
        <h3>관리자 로그인</h3>
        <input
          type="text"
          placeholder="아이디"
          value={adminId}
          onChange={(e) => setAdminId(e.target.value)}
          onKeyUp={handleKeyUp} // Enter 키 이벤트 핸들러 추가
        />
        <input
          type="password"
          placeholder="비밀번호"
          value={adminPw}
          onChange={(e) => setAdminPw(e.target.value)}
          onKeyUp={handleKeyUp} // Enter 키 이벤트 핸들러 추가
        />
        {errorMessage && <div className="error-message">{errorMessage}</div>} {/* 에러 메시지 출력 */}
        <button onClick={handleLogin}>로그인</button> {/* 로그인 버튼 클릭 시 handleLogin 함수 호출 */}
      </div>
    </div>
  );
}

export default Login;

/*
 * 1. `useState를 통해 adminId, adminPw, errorMessage 상태를 저장.
 * 2. handleLogin 함수에서 login 함수를 호출하여 로그인 시도 후 성공 시 회원정보 페이지로 이동. 로그인 실패 시 서버에서 받은 에러 메시지를 설정.
 * 3. handleKeyUp 함수에서 Enter 키 입력 시 handleLogin 함수를 호출하여 로그인 시도합니다.
 * 4. 관리자 아이디와 비밀번호 입력 필드, 에러 메시지, 로그인 버튼을 렌더링합니다.
 */