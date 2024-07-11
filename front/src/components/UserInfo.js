import React from 'react';
import '../css/UserInfo.css';

function UserInfo() {
  return (
    <div className="user-info">
      <h1>회원 정보</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="name">이름</option>
          <option value="id">아이디</option>
          <option value="loc">지역</option>
          <option value="tel">전화번호</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="users-table">
        <thead>
          <tr>
            <th>회원이미지</th>
            <th>이름</th>
            <th>아이디</th>
            <th>지역</th>
            <th>이메일</th>
            <th>전화번호</th>
          </tr>
        </thead>
        <tbody>
          {/* */}
        </tbody>
      </table>
    </div>
  );
}

export default UserInfo;