import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../css/UserInfo.css';

function UserInfo() {

  const [memberData, setMemberData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);

  useEffect(() => {
    fetchMemberData(currentPage);
  }, [currentPage]);

  const fetchMemberData = async (page) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallmember', {
        params: { page }
      });
      setMemberData(response.data.member);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching member data:', error);
    }
  };

  // const stopMember = async (member_id) => {
  //   try {
  //     await axios.delete(`http://localhost:8000/data/stop-member/${member_id}`);
  //     fetchMemberData(currentPage); // 현재 페이지의 데이터를 다시 불러옵니다.
  //   } catch (error) {
  //     console.error('Error deleting member:', error);
  //   }
  // };


  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const renderPageNumbers = () => {
    const pageNumbers = [];
    const maxPagesToShow = 10; // 한 번에 표시할 최대 페이지 수
    const totalPageBlocks = Math.ceil(totalPages / maxPagesToShow);
    const currentBlock = Math.floor(currentPage / maxPagesToShow);
    
    const startPage = currentBlock * maxPagesToShow;
    const endPage = Math.min(startPage + maxPagesToShow, totalPages);

    if (currentBlock > 0) {
      pageNumbers.push(<button key="prev-block" onClick={() => handlePageChange(startPage - 1)}>&lt;</button>);
    }

    for (let i = startPage; i < endPage; i++) {
      pageNumbers.push(
        <button
          key={i}
          onClick={() => handlePageChange(i)}
          className={i === currentPage ? 'active' : ''}
        >
          {i + 1}
        </button>
      );
    }

    if (currentBlock < totalPageBlocks - 1) {
      pageNumbers.push(<button key="next-block" onClick={() => handlePageChange(endPage)}>&gt;</button>);
    }

    return pageNumbers;
  };

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
            <th className='member_name'>이름</th>
            <th className='member_id'>아이디</th>
            <th className='member_area'>지역</th>
            <th className='member_email'>이메일</th>
            <th className='member_tel'>전화번호</th>
            <th className='member_status'>회원상태</th>
            <th className='memberstop'>정지</th>
          </tr>
        </thead>
        <tbody>
        {memberData.map(member => (
            <tr key={member.member_id}>
              <td className='member_name'>{member.member_name}</td>
              <td className='member_id'>{member.member_id}</td>
              <td className='member_area'>{member.member_area}</td>
              <td className='member_email'>{member.member_email}</td>
              <td className='member_tel'>{member.member_tel}</td>
              <td className='member_status'>{member.member_status}</td>
              <td className='memberstop'>
                <button className='memberstop-button' /*onClick={() => stopMember(member.member_id)}*/>정지</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="pagination">
        {renderPageNumbers()}
      </div>
    </div>
  );
}

export default UserInfo;