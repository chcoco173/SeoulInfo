import React, { createContext, useState, useContext, useEffect } from 'react';
import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://localhost:8000',
  withCredentials: true
});

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [admin, setAdmin] = useState(JSON.parse(sessionStorage.getItem('admin')) || null);

  useEffect(() => {
    const storedAdmin = sessionStorage.getItem('admin');
    if (storedAdmin) {
      setAdmin(JSON.parse(storedAdmin));
    }
  }, []);

  const login = async (adminId, adminPw) => {
    try {
      const response = await instance.post('/login', { adminId, adminPw });
      setAdmin(response.data.admin);
      sessionStorage.setItem('admin', JSON.stringify(response.data.admin));
      return response.data;
    } catch (error) {
      console.error('로그인 에러:', error);
      throw error;
    }
  };

  const logout = async () => {
    try {
      await instance.post('/logout');
      setAdmin(null);
      sessionStorage.removeItem('admin');
    } catch (error) {
      console.error('로그아웃 에러:', error);
    }
  };

  const value = {
    admin,
    login,
    logout,
    instance
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  return useContext(AuthContext);
};