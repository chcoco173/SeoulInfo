import React from 'react';
import '../css/ReportManagement.css';

function ReportManagement() {
  return (
    <div className="report-info">
      <h1>신고 관리</h1>
      <div className="search-section">
        <select className="search-select">
        <option value="mId">아이디</option>
          <option value="rNum">신고횟수</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="report-table">
        <thead>
          <tr>
            <th>아이디</th>
            <th>신고횟수</th>
            <th>정지</th>
          </tr>
        </thead>
        <tbody>
          {/* */}
        </tbody>
      </table>
    </div>
  );
}

export default ReportManagement;