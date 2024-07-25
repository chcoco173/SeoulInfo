import React, { useState } from 'react';
import { Routes, Route, Link, useNavigate } from 'react-router-dom';
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
import Question from './Question';
import Answer from './Answer';
import InsertEVC from './InsertEVC';
import InsertEv from './InsertEv';
import FestivalBoardManagement from './FestivalBoardManagement';
import { useAuth } from './AuthContext';

function Dashboard() {
  const [isOpen, setIsOpen] = useState(false);
  const { logout } = useAuth();
  const navigate = useNavigate();

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  const handleLogout = async () => {
    await logout();
    navigate('/login');
  };

  return (
    <div>
      <nav className="menu-bar">
        <div className="menu-toggle" onClick={toggleMenu}>
          <div className={`menubox ${isOpen ? 'open' : ''}`}></div>
        </div>
        <ul className={`menu-list ${isOpen ? 'active' : ''}`}>
          <li className="menu-item"><Link to="user-info">회원정보</Link></li>
          <li className="menu-item"><Link to="admin-info">관리자정보</Link></li>
          <li className="menu-item"><Link to="festival">행사관리</Link></li>
          <li className="menu-item"><Link to="festival-board">행사게시판</Link></li>
          <li className="menu-item"><Link to="ev">전기차관리</Link></li>
          <li className="menu-item"><Link to="news">뉴스관리</Link></li>
          <li className="menu-item"><Link to="report">신고관리</Link></li>
          <li className="menu-item"><Link to="question">문의관리</Link></li>
          <li className="menu-item"><Link to="charts">차트</Link></li>
          <li className="menu-item logout-item"><a onClick={handleLogout}>로그아웃</a></li>
        </ul>
      </nav>
      <div className="main-content">
        <Routes>
          <Route path="user-info" element={<UserInfo />} />
          <Route path="admin-info" element={<AdminInfo />} />
          <Route path="festival" element={<FestivalManagement />} />
          <Route path="festival-board" element={<FestivalBoardManagement />} />
          <Route path="ev" element={<EVManagement />} />
          <Route path="news" element={<NewsManagement />} />
          <Route path="report" element={<ReportManagement />} />
          <Route path="question" element={<Question />} />
          <Route path="charts" element={<Charts />} />
          <Route path="/login" element={<Login />} />
          <Route path="insert-admin" element={<InsertAdmin />} />
          <Route path="insert-festival" element={<InsertFestival />} />
          <Route path="insert-ev" element={<InsertEv />} />
          <Route path="insert-evc" element={<InsertEVC />} />
          <Route path="answer/:question_no" element={<Answer />} />
        </Routes>
      </div>
    </div>
  );
}

export default Dashboard;