import React, { useState, useEffect } from 'react';
import '../css/ReportManagement.css';
import { useAuth } from './AuthContext';

function ReportPopup({ isOpen, onClose, reportDetails, handleApprove, handleReject }) {
  if (!isOpen) return null;

  return (
    <div className="popup-overlay" onClick={onClose}>
      <div className="popup-content" onClick={e => e.stopPropagation()}>
        <button className="close-button" onClick={onClose}>X</button>
        <h1>신고 내역 리스트</h1>
        <br/>
        {reportDetails.length > 0 ? (
          reportDetails.map((detail, index) => (
            <div key={index}>
              <p>{index + 1}. {detail.report_reason}</p>
              {!detail.is_processed ? (
                <>
                  <button
                    className="popup-button approve-button"
                    onClick={() => handleApprove(detail.member_id, detail.report_id, index)}
                  >
                    승인
                  </button>
                  <button
                    className="popup-button reject-button"
                    onClick={() => handleReject(detail.report_id)}
                  >
                    반려
                  </button>
                </>
              ) : (
                <span className="processed-label">처리 완료</span>
              )}

              <hr />
              <br/>
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
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.
  const [reports, setReports] = useState([]); 
  const [isPopupOpen, setIsPopupOpen] = useState(false);
  const [currentReportDetails, setCurrentReportDetails] = useState([]);
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(0);
  const [search, setSearch] = useState('');
  const [searchInput, setSearchInput] = useState(''); // 검색 입력 필드 상태 추가

  useEffect(() => {
    fetchReports();
  }, [page, search]);

  const fetchReports = async () => {
    try {
      const response = await instance.get('/data/reports', {
        params: { page, search },
      });
      console.log("받아온 데이터:", response.data); // 데이터 구조 확인
      setReports(response.data.results || []); // 응답 데이터를 상태에 저장
      setTotal(response.data.total || 0);
    } catch (error) {
      console.error('Error fetching data: ', error);
      setReports([]); // 오류 발생 시 빈 배열로 설정
    }
  };

  const handleApprove = async (memberId, reportId, index) => {
    try {
      await instance.post(`/data/increase-report-count/${memberId}`, { reportId });
      alert('신고 횟수가 성공적으로 증가하였습니다.');
      const updatedDetails = [...currentReportDetails];
      updatedDetails[index].is_processed = true;
      setCurrentReportDetails(updatedDetails);
      fetchReports(); // 업데이트 후 데이터 새로고침
    } catch (error) {
      console.error('신고 승인 처리 중 오류 발생:', error);
      alert('신고 승인 처리 실패');
    }
  };

  const handleReject = async (reportId) => {
    try {
      await instance.delete(`/data/delete-report/${reportId}`);
      alert('신고 내용이 성공적으로 삭제되었습니다.');
      fetchReports(); // 삭제 후 데이터 새로고침
      setIsPopupOpen(false);
    } catch (error) {
      console.error('신고 반려 처리 중 오류 발생:', error);
      alert('신고 반려 처리 실패');
    }
  };

  const handleReportClick = async (memberId, reportCount) => {
    if (reportCount === 0) {
      return;
    }
    try {
      const response = await instance.get(`/data/reports/${memberId}`);
      if (response.data && response.data.length > 0) {
        setCurrentReportDetails(response.data);
        setIsPopupOpen(true);
      } else {
        alert('해당 회원에 대한 신고 내용이 없습니다.');
        setCurrentReportDetails([]); 
      }
    } catch (error) {
      console.error('Error fetching report details: ', error);
      alert('신고 내용을 불러오는데 실패하였습니다.');
    }
  };

  const handleDelete = async (memberId) => {
    if (window.confirm('정지하시겠습니까?')) {
      try {
        await instance.delete(`/data/delete-member/${memberId}`);
        alert('회원이 삭제되었습니다.');
        fetchReports(); 
      } catch (error) {
        console.error('Error deleting user: ', error);
        alert('회원 삭제에 실패하였습니다.');
      }
    }
  };

  const totalPages = Math.ceil(total / 10);

  const renderPagination = () => {
    const pages = [];
    for (let i = 1; i <= totalPages; i++) {
      pages.push(
        <button
          key={i}
          onClick={() => setPage(i)}
          className={i === page ? 'active' : ''}
        >
          {i}
        </button>
      );
    }
    return pages;
  };

  const handleSearch = () => {
    setSearch(searchInput);
    setPage(1); // 검색할 때 페이지를 1로 초기화
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  return (
    <div className="report-info">
      <h1>신고 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="member_id">아이디</option>
          <option value="member_reportcount">신고횟수</option>
        </select>
        <input
          type="text"
          placeholder="검색"
          className="search-input"
          value={searchInput}
          onChange={(e) => setSearchInput(e.target.value)}
          onKeyUp={handleKeyPress} // onKeyUp 이벤트 추가
        />
        <button className="search-button" onClick={handleSearch}>검색</button>
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
              <td>{(page - 1) * 10 + index + 1}</td>
              <td>{member.member_id}</td>
              <td>
                <div onClick={() => handleReportClick(member.member_id, member.report_count)}>
                  <ReportBall count={member.report_count} />
                </div>
              </td>
              <td>
                <button
                  className="delete-button"
                  onClick={() => handleDelete(member.member_id)}
                  disabled={member.member_reportcount < 3}
                >
                  정지
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="pagination">
        {renderPagination()}
      </div>
      <ReportPopup isOpen={isPopupOpen} onClose={() => setIsPopupOpen(false)} reportDetails={currentReportDetails} handleApprove={handleApprove} handleReject={handleReject} />
    </div>
  );
}

export default ReportManagement;