import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../css/ReportManagement.css';

function ReportPopup({ isOpen, onClose, reportDetails, handleApprove, handleReject }) {
  if (!isOpen) return null;

  return (
    <div className="popup-overlay" onClick={onClose}>
      <div className="popup-content" onClick={e => e.stopPropagation()}>
        <button className="close-button" onClick={onClose}>X</button>
        <h2>신고 내용</h2>
        {reportDetails.length > 0 ? (
          reportDetails.map((detail, index) => (
            <div key={index}>
              <p>{index + 1}. {detail}</p>
              <button onClick={() => handleApprove(detail.memberId)}>승인</button>
              <button onClick={() => handleReject(detail.id)}>반려</button>
              <hr />
            </div>
          ))
        ) : (
          <p>신고 내용이 없습니다.</p>
        )}
      </div>
    </div>
  );
}


function ReportBall({ count, onClick }) {
  const maxBalls = 3;
  const balls = [];
  for (let i = 0; i < maxBalls; i++) {
    balls.push(
      <span key={i} className={i < count ? 'ball colored' : 'ball'} onClick={onClick}></span>
    );
  }
  return <div>{balls}</div>;
}

function ReportManagement() {
  const [reports, setReports] = useState([]); 
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [currentReportDetails, setCurrentReportDetails] = useState([]);

  useEffect(() => {
    fetchReports();
  }, []);

  const fetchReports = async () => {
    try {
      const response = await axios.get('http://localhost:8000/data/reports');
      console.log("받아온 데이터:", response.data); // 데이터 구조 확인
      setReports(response.data); // 응답 데이터를 상태에 저장
    } catch (error) {
      console.error('Error fetching data: ', error);
    }
  };

  const handleApprove = async (memberId) => {
    try {
      await axios.post(`http://localhost:8000/data/increase-report-count/${memberId}`);
      alert('신고 횟수가 성공적으로 증가하였습니다.');
      fetchReports(); // 업데이트 후 데이터 새로고침
    } catch (error) {
      console.error('신고 승인 처리 중 오류 발생:', error);
      alert('신고 승인 처리 실패');
    }
  };
  
  const handleReject = async (reportId) => {
    try {
      await axios.delete(`http://localhost:8000/data/delete-report/${reportId}`);
      alert('신고 내용이 성공적으로 삭제되었습니다.');
      fetchReports(); // 삭제 후 데이터 새로고침
    } catch (error) {
      console.error('신고 반려 처리 중 오류 발생:', error);
      alert('신고 반려 처리 실패');
    }
  };

  const handleReportClick = async (member_id, reportCount) => {
  if (reportCount === 0) {
    return;
  }
  try {
    const response = await axios.get(`http://localhost:8000/data/reports/${member_id}`);
    if (response.data && response.data.length > 0) {
      // 예를 들어 서버가 JSON 배열을 반환한다고 가정
      const reportDetails = response.data.map(detail => detail.report_reason);
      setCurrentReportDetails(reportDetails);
      setIsPopupOpen(true);
    } else {
      alert('해당 회원에 대한 신고 내용이 없습니다.');
      setCurrentReportDetails([]); // 데이터가 없을 경우 빈 배열 설정
    }
  } catch (error) {
    console.error('Error fetching report details: ', error);
    alert('신고 내용을 불러오는데 실패하였습니다.');
  }
};


  const handleDelete = async (member_id) => {
    if (window.confirm('정지하시겠습니까?')) {
      try {
        await axios.delete(`http://localhost:8000/data/delete-member/${member_id}`);
        alert('회원이 삭제되었습니다.');
        fetchReports(); 
      } catch (error) {
        console.error('Error deleting user: ', error);
        alert('회원 삭제에 실패하였습니다.');
      }
    }
  }

  return (
    <div className="report-info">
      <h1>신고 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="member_id">아이디</option>
          <option value="member_reportcount">신고횟수</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="report-table">
        <thead>
          <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>신고횟수</th>
            <th>정지</th>
          </tr>
        </thead>
        <tbody>
      {reports.map((member, index) => (
        <tr key={member.member_id}>
          <td>{index + 1}</td>
          <td>{member.member_id}</td>
          <td>
            <div onClick={() => handleReportClick(member.member_id, member.report_count)}>
              <ReportBall count={member.report_count} />
            </div>
          </td>
          <td>
            <button className="delete-button" onClick={() => handleDelete(member.member_id)}>정지</button>
          </td>
        </tr>
      ))}
    </tbody>
      </table>
      <ReportPopup isOpen={isPopupOpen} onClose={() => setIsPopupOpen(false)} reportDetails={currentReportDetails} handleApprove={handleApprove} handleReject={handleReject} />
    </div>
  );
}

export default ReportManagement;