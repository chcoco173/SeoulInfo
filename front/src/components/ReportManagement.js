import React, { useState, useEffect } from 'react';
import '../css/ReportManagement.css';
import { useAuth } from './AuthContext';

// 신고 내역 팝업 컴포넌트
function ReportPopup({ isOpen, onClose, reportDetails, handleApprove, handleReject }) {
  if (!isOpen) return null; // 팝업이 열리지 않았으면 null 반환

  return (
    <div className="popup-overlay" onClick={onClose}> 
      <div className="popup-content" onClick={e => e.stopPropagation()}> 
        <button className="close-button" onClick={onClose}>X</button> {/* 팝업 닫기 버튼 */}
        <h1>신고 내역 리스트</h1>
        <br/>
        {reportDetails.map((detail, index) => (
          <div key={index}>
            <h2>{index + 1}.</h2>
            <h3>신고 카테고리 : {detail.report_cate}</h3>
            <h3>신고 사유 : {detail.report_reason}</h3> {/* 신고 사유 표시 */}
            {!detail.is_processed ? ( // 신고가 처리되지 않았을 경우
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
              <span className="processed-label">처리 완료</span> // 신고가 처리된 경우
            )}
            <hr />
            <br/>
          </div>
        ))}
      </div>
    </div>
  );
}

// 신고 횟수를 나타내는 볼 컴포넌트
function ReportBall({ count, onClick }) {
  const maxBalls = 3; // 최대 볼 개수 설정
  const balls = []; // 볼을 저장할 배열
  for (let i = 0; i < maxBalls; i++) {
    balls.push(
      <span key={i} className={i < count ? 'ball colored' : 'ball'} onClick={onClick}></span>
    );
  }
  return <div>{balls}</div>;
}

function ReportManagement() {
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옴
  const [reports, setReports] = useState([]); // 신고 데이터를 저장할 상태
  const [isPopupOpen, setIsPopupOpen] = useState(false); // 팝업 상태를 저장할 상태
  const [currentReportDetails, setCurrentReportDetails] = useState([]); // 현재 신고 상세 정보를 저장할 상태
  const [page, setPage] = useState(1); // 현재 페이지 번호를 저장할 상태
  const [total, setTotal] = useState(0); // 총 신고 건수를 저장할 상태
  const [search, setSearch] = useState(''); // 검색 키워드를 저장할 상태
  const [searchInput, setSearchInput] = useState(''); // 검색 입력 필드 상태를 저장할 상태

  // 컴포넌트 마운트 시 및 페이지, 검색 키워드 변경 시 신고 데이터를 가져옴
  useEffect(() => {
    reportView();
  }, [page, search]);

  // 신고 데이터를 서버에서 가져오는 함수
  const reportView = async () => {
    try {
      const response = await instance.get('/data/reports', {
        params: { page, search }, // 페이지와 검색 키워드를 서버에 전달
      });
      setReports(response.data.results || []); // 응답 데이터를 상태에 저장
      setTotal(response.data.total || 0); // 총 신고 건수를 상태에 저장
    } catch (error) {
      setReports([]); // 오류 발생 시 빈 배열로 설정
    }
  };

  // 신고 승인 처리 함수
  const handleApprove = async (memberId, reportId, index) => {
    try {
      await instance.post(`/data/increase-report-count/${memberId}`, { reportId });
      alert('신고 횟수가 성공적으로 증가하였습니다.');
      const updatedDetails = [...currentReportDetails];
      updatedDetails[index].is_processed = true;
      setCurrentReportDetails(updatedDetails);
      reportView(); // 업데이트 후 데이터 새로고침
    } catch (error) {
      alert('신고 승인 처리 실패');
    }
  };

  // 신고 반려 처리 함수
  const handleReject = async (reportId) => {
    try {
      await instance.delete(`/data/delete-report/${reportId}`);
      alert('신고 내용이 성공적으로 삭제되었습니다.');
      reportView(); // 삭제 후 데이터 새로고침
      setIsPopupOpen(false);
    } catch (error) {
      alert('신고 반려 처리 실패');
    }
  };

  // 특정 회원의 신고 내용을 팝업으로 표시하는 함수
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
      alert('신고 내용을 불러오는데 실패하였습니다.');
    }
  };

  // 회원을 삭제하는 함수
  const handleDelete = async (memberId) => {
    if (window.confirm('정지하시겠습니까?')) {
      try {
        await instance.delete(`/data/delete-member/${memberId}`);
        alert('회원이 삭제되었습니다.');
        reportView(); 
      } catch (error) {
        alert('회원 삭제에 실패하였습니다.');
      }
    }
  };

  const totalPages = Math.ceil(total / 10); // 총 페이지 수 계산

  // 페이지네이션을 렌더링하는 함수
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

  // 검색 버튼 클릭 시 검색 키워드를 설정하고 페이지를 1로 초기화하는 함수
  const handleSearch = () => {
    setSearch(searchInput);
    setPage(1); // 검색할 때 페이지를 1로 초기화
  };

  // 검색 입력 필드에서 Enter 키를 눌렀을 때 검색을 실행하는 함수
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
          <option value="report_count">신고횟수</option>
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
                  disabled={member.report_count < 3}
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
      <ReportPopup 
        isOpen={isPopupOpen} 
        onClose={() => setIsPopupOpen(false)} 
        reportDetails={currentReportDetails} 
        handleApprove={handleApprove} 
        handleReject={handleReject} 
      />
    </div>
  );
}

export default ReportManagement;

/*
 * 1. useEffect를 통해 `reportView 함수를 호출하여 현재 페이지의 신고 데이터를 가져옴.
 * 2. setPage 함수를 통해 page 상태가 변경될 때마다 reportView 호출.
 * 3. handleStatusToggle 함수에서 회원 상태를 토글하고 updateMemberStatus 함수 호출.
 * 4. 검색 입력 필드에서 Enter 키를 누르거나 검색 버튼 클릭 시 handleSearch 함수 호출.
 * 5. 특정 회원의 신고 횟수 클릭 시 handleReportClick 함수 호출로 신고 상세 정보를 팝업으로 표시.
 * 6. 삭제 버튼 클릭 시 handleDelete 함수 호출로 회원 삭제.
 */
