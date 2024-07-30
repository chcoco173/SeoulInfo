import React, { useState, useEffect } from 'react';
import { Routes, Route, Link, useNavigate, useLocation } from 'react-router-dom';
import UserInfo from './UserInfo';
import AdminInfo from './AdminInfo';
import FestivalManagement from './FestivalManagement';
import EVManagement from './EVManagement';
import NewsManagement from './NewsManagement';
import ReportManagement from './ReportManagement';
import Charts from './Charts';
import '../css/Menubar.css';
import Login from './Login';
import InsertAdmin from './InsertAdmin';
import InsertFestival from './InsertFestival';
import Question from './Question';
import Answer from './Answer';
import InsertEVC from './InsertEVC';
import InsertEv from './InsertEv';
import FestivalBoardManagement from './FestivalBoardManagement';
import { useAuth } from './AuthContext';
import AlreadyAnswer from './AlreadyAnswer';

function Menubar() {
  const [isOpen, setIsOpen] = useState(false); // 메뉴가 열려있는지 상태를 저장
  const { logout } = useAuth(); // AuthContext에서 logout 함수를 가져옴
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수
  const location = useLocation(); // 현재 위치 정보를 가져옴

  // 메뉴 토글을 처리하는 함수
  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  // 로그아웃을 처리하는 함수
  const handleLogout = async () => {
    await logout(); // 로그아웃 실행
    navigate('/login'); // 로그인 페이지로 이동
  };

  // location이 변경될 때 메뉴를 닫는 효과를 주는 useEffect
  useEffect(() => {
    setIsOpen(false);
  }, [location]);

  return (
    <div>
      <nav className="menu-bar">
        <div className="menu-toggle" onClick={toggleMenu}>
          <div className={`menubox ${isOpen ? 'open' : ''}`}></div> {/* 메뉴 상태에 따라 클래스 변경 */}
        </div>
        <ul className={`menu-list ${isOpen ? 'active' : ''}`}> {/* 메뉴 상태에 따라 클래스 변경 */}
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
          <Route path="alreadyanswer/:question_no" element={<AlreadyAnswer />} />
        </Routes>
      </div>
    </div>
  );
}

export default Menubar;

/*
 * 1. useState를 통해 메뉴가 열려있는지 상태를 저장 (isOpen).
 * 2. toggleMenu 함수에서 메뉴 상태를 토글.
 * 3. handleLogout 함수에서 로그아웃을 실행하고 로그인 페이지로 이동.
 * 4. useEffect를 통해 location이 변경될 때 isOpen 상태를 false로 설정하여 메뉴를 닫기.
 * 5. 메뉴 항목을 클릭하면 해당 경로로 이동.
 * 6. 메뉴가 열려있을 때와 닫혀있을 때 각각 다른 클래스를 적용.
 * 7. Routes 컴포넌트를 통해 각 경로에 대한 컴포넌트를 렌더링. user-info 경로로 이동하면 `UserInfo` 컴포넌트가 렌더링.
 */