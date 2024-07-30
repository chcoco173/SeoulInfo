import React from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from './AuthContext';

// 보호된 라우트 컴포넌트
const ProtectedRoute = ({ children }) => {
  const { admin } = useAuth(); // AuthContext에서 admin 상태를 가져옴

  // admin이 false일 경우 로그인 페이지로 리디렉션
  if (!admin) {
    return <Navigate to="/login" />;
  }

  // admin이 true일 경우 자식 컴포넌트 렌더링
  return children;
};

export default ProtectedRoute;

/*
 * 1. useAuth 훅을 사용하여 AuthContext에서 admin 상태를 가져옵니다.
 * 2. admin 상태가 false일 경우 <Navigate> 컴포넌트를 사용하여 로그인 페이지로 리디렉션합니다.
 * 3. admin 상태가 true일 경우 자식 컴포넌트를 렌더링합니다.
 * 
 */