import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../css/EVManagement.css';

function EVManagement() {

  const [evData, setEvData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);

  useEffect(() => {
    fetchEvData(currentPage);
  }, [currentPage]);

  const fetchEvData = async (page) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallev', {
        params: { page }
      });
      setEvData(response.data.ev);
      setTotalPages(response.data.totalPages); // 서버에서 전체 페이지 수를 받아옵니다.
    } catch (error) {
      console.error('Error fetching ev data:', error);
    }
  };

  const deleteEv = async (evc_id) => {
    try {
      await axios.delete(`http://localhost:8000/data/delete-ev/${evc_id}`);
      fetchEvData(currentPage); // 현재 페이지의 데이터를 다시 불러옵니다.
    } catch (error) {
      console.error('Error deleting ev:', error);
    }
  };

  // const updateEv = async (evc_id) => {
  //   try {
  //     await axios.post(`http://localhost:8000/data/update-ev/${evc_id}`);
  //     fetchEvData(currentPage);
  //   } catch (error) {
  //     console.error('Error updating ev:', error);
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
            <th className='evc_name'>이름</th>
            <th className='evc_area'>지역</th>
            <th className='evc_address'>주소</th>
            <th className='evc_type'>충전기타입</th>
            <th className='evc_mbig'>기종</th>
            <th className='evc_opbig'>운영기관</th>
            <th className='evupdate'>수정</th>
            <th className='evdelete'>삭제</th>
          </tr>
        </thead>
        <tbody>
        {evData.map(ev => (
            <tr key={ev.evc_id}>
              <td className='evc_name'>{ev.evc_name}</td>
              <td className='evc_area'>{ev.evc_area}</td>
              <td className='evc_address'>{ev.evc_address}</td>
              <td className='evc_mbig'>{ev.evc_type}</td>
              <td className='evc_mbig'>{ev.evc_mbig}</td>
              <td className='evc_opbig'>{ev.evc_opbig}</td>
              <td className='evupdate'>
              { <button className='evupdate-button' /*onClick={() => updateEv(ev.evc_id)}*/>수정</button> }
              </td>
              <td className='evdelete'>
                <button className='evdelete-button' onClick={() => deleteEv(ev.evc_id)}>삭제</button>
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

export default EVManagement;