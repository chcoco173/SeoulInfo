import React, { useState } from 'react';
import { Routes, Route, Link } from 'react-router-dom';
import UserInfo from './UserInfo';
import AdminInfo from './AdminInfo';
import FestivalManagement from './FestivalManagement';
import EVManagement from './EVManagement';
import NewsManagement from './NewsManagement';
import ReportManagement from './ReportManagement';
import Charts from './Charts';
import '../css/Dashboard.css';
import Login from './Login';
import InsertAdmin from './InsertAdmin';
import InsertFestival from './InsertFestival';

function Dashboard() {

  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  return (
    <div>
      <nav className="menu-bar">
        <div className="menu-toggle" onClick={toggleMenu}>
          <div className={`menubox
            
            ${isOpen ? 'open' : ''}`}></div>
        </div>
        <ul className={`menu-list ${isOpen ? 'active' : ''}`}>
          <li className="menu-item"><Link to="user-info">회원정보</Link></li>
          <li className="menu-item"><Link to="admin-info">관리자정보</Link></li>
          <li className="menu-item"><Link to="festival">축제관리</Link></li>
          <li className="menu-item"><Link to="ev">전기차관리</Link></li>
          <li className="menu-item"><Link to="news">뉴스관리</Link></li>
          <li className="menu-item"><Link to="report">신고관리</Link></li>
          <li className="menu-item"><Link to="charts">차트</Link></li>
          <li className="menu-item login-out"><Link to="/login">로그아웃</Link></li>
        </ul>
      </nav>
      <Routes>
        <Route path="user-info" element={<UserInfo />} />
        <Route path="admin-info" element={<AdminInfo />} />
        <Route path="festival" element={<FestivalManagement />} />
        <Route path="ev" element={<EVManagement />} />
        <Route path="news" element={<NewsManagement />} />
        <Route path="report" element={<ReportManagement />} />
        <Route path="charts" element={<Charts />} />
        <Route path="/login" element={<Login />} />
        <Route path="insert-admin" element={<InsertAdmin />} />
        <Route path="insert-festival" element={<InsertFestival />} />
      </Routes>
    </div>
  );
}

export default Dashboard;