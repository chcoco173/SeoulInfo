import React from 'react';
import '../css/NewsManagement.css';

function NewsManagement() {
  return (
    <div className="news-info">
      <h1>뉴스 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="nId">번호</option>
          <option value="nTitle">제목</option>
          <option value="nArea">지역</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="news-table">
        <thead>
          <tr>
            <th>번호</th>
            <th>지역</th>
            <th>제목</th>
            <th>링크</th>
            <th>삭제</th>
          </tr>
        </thead>
        <tbody>
          {/* */}
        </tbody>
      </table>
    </div>
  );
}

export default NewsManagement;