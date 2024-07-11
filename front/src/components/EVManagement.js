import React from 'react';
import '../css/EVManagement.css';

function EVManagement() {
  return (
    <div className="ev-info">
      <h1>전기차 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="evcName">이름</option>
          <option value="evcArea">지역</option>
          <option value="evcType">충전기타입</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="ev-table">
        <thead>
          <tr>
            <th>이름</th>
            <th>지역</th>
            <th>주소</th>
            <th>충전기타입</th>
            <th>운영기관</th>
            <th>수정</th>
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

export default EVManagement;