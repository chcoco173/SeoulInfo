import React, { useState } from 'react';
import '../css/Login.css'; 
import { useNavigate } from 'react-router-dom';  
import { useAuth } from './AuthContext';

function Login() {
  const [adminId, setAdminId] = useState('');
  const [adminPw, setAdminPw] = useState('');
  const [errorMessage, setErrorMessage] = useState('');
  const navigate = useNavigate();  
  const { login } = useAuth();

  const handleLogin = async () => {
    try {
      const response = await login(adminId, adminPw);
      if (response) {
        navigate('/dashboard/user-info/');
      }
    } catch (error) {
      if (error.response) {
        setErrorMessage(error.response.data.message);
      } else {
        setErrorMessage('로그인 요청 중 오류가 발생했습니다.');
      }
    }
  };

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
          onKeyUp={handleKeyUp}
        />
        <input
          type="password"
          placeholder="비밀번호"
          value={adminPw}
          onChange={(e) => setAdminPw(e.target.value)}
          onKeyUp={handleKeyUp} 
        />
        {errorMessage && <div className="error-message">{errorMessage}</div>}
        <button onClick={handleLogin}>로그인</button>
      </div>
    </div>
  );
}

export default Login;