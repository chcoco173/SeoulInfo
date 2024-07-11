import React, { useState } from 'react';
import '../css/Login.css'; 
import { useNavigate } from 'react-router-dom';  

function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();  

  const handleLogin = () => {

    navigate('/dashboard/user-info/');
  };

  return (
    <div className="login-container">
      <div className="login-form">
        <h3>관리자 로그인</h3>
        <input
          type="text"
          placeholder="아이디"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <input
          type="password"
          placeholder="비밀번호"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button onClick={handleLogin}>로그인</button>
      </div>
    </div>
  );
}

export default Login;