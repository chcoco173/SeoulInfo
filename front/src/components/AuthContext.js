import React, { createContext, useState, useContext, useEffect } from 'react';
import axios from 'axios';

// Axios 인스턴스를 생성하고 기본 설정을 지정합니다.
const instance = axios.create({
  baseURL: 'http://localhost:8000',
  withCredentials: true
});

// AuthContext를 생성합니다.
const AuthContext = createContext();

// AuthProvider 컴포넌트는 AuthContext.Provider로 감싸진 자식 컴포넌트들에게 인증 정보를 제공합니다.
export const AuthProvider = ({ children }) => {
  const [admin, setAdmin] = useState(JSON.parse(sessionStorage.getItem('admin')) || null); // 관리자 정보를 저장할 상태

  // 컴포넌트가 마운트될 때 세션 스토리지에서 관리자 정보를 가져옵니다.
  useEffect(() => {
    const storedAdmin = sessionStorage.getItem('admin');
    if (storedAdmin) {
      setAdmin(JSON.parse(storedAdmin));
    }
  }, []);

  // 로그인 함수: 서버에 로그인 요청을 보내고 응답 데이터를 상태와 세션 스토리지에 저장합니다.
  const login = async (adminId, adminPw) => {
    try {
      const response = await instance.post('/login', { adminId, adminPw });
      setAdmin(response.data.admin); // 관리자 정보를 상태에 저장
      sessionStorage.setItem('admin', JSON.stringify(response.data.admin)); // 관리자 정보를 세션 스토리지에 저장
      return response.data;
    } catch (error) {
      throw error; // 오류 발생 시 오류를 던집니다.
    }
  };

  // 로그아웃 함수: 서버에 로그아웃 요청을 보내고 상태와 세션 스토리지에서 관리자 정보를 제거합니다.
  const logout = async () => {
    try {
      await instance.post('/logout');
      setAdmin(null); // 관리자 정보를 상태에서 제거
      sessionStorage.removeItem('admin'); // 관리자 정보를 세션 스토리지에서 제거
    } catch (error) {
      console.error('Error during logout:', error);
    }
  };

  // AuthContext.Provider에 전달할 값을 정의합니다.
  const value = {
    admin,
    login,
    logout,
    instance
  };

  // 자식 컴포넌트들에게 인증 정보를 제공합니다.
  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

// useAuth 훅: AuthContext를 사용하기 위한 커스텀 훅입니다.
export const useAuth = () => {
  return useContext(AuthContext);
};

/*
 * 1. axios.create를 통해 기본 설정이 포함된 Axios 인스턴스를 생성.
 * 2. createContext를 통해 AuthContext를 생성.
 * 3. useState를 사용하여 관리자 정보를 상태로 관리합니다.
 *    useEffect를 사용하여 컴포넌트가 마운트될 때 세션 스토리지에서 관리자 정보를 가져옵니다.
 *    login 함수는 서버에 로그인 요청을 보내고, 응답 데이터를 상태와 세션 스토리지에 저장합니다.
 *    logout 함수는 서버에 로그아웃 요청을 보내고, 상태와 세션 스토리지에서 관리자 정보를 제거합니다.
 *    AuthContext.Provider를 사용하여 자식 컴포넌트들에게 인증 정보를 제공합니다.
 * 4. useContext를 사용하여 AuthContext를 반환
 */