import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../css/FestivalBoardManagement.css';

function FestivalBoardManagement() {
  const [festivalBoardData, setFestivalBoardData] = useState([]);
  const [areaNames, setAreaNames] = useState([]);
  const [typeNames, setTypeNames] = useState([]);
  const [festivalNames, setFestivalNames] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [selectAreaCategory, setSelectAreaCategory] = useState('all');
  const [selectTypeCategory, setSelectTypeCategory] = useState('all');
  const [selectFestivalCategory, setSelectFestivalCategory] = useState('all');
  const [searchCategory, setSearchCategory] = useState('title');
  const [searchKeyword, setSearchKeyword] = useState('');

  useEffect(() => {
    fetchAreaNames();
    fetchTypeNames();
  }, []);

  useEffect(() => {
    fetchFestivalNames(selectAreaCategory, selectTypeCategory);
    fetchFestivalBoardData(currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory);
  }, [currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory]);

  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      fetchFestivalBoardData(currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory);
    }
  }, [currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory]);

  const fetchAreaNames = async () => {
    try {
      const response = await axios.get('http://localhost:8000/data/get-area-names');
      setAreaNames(response.data);
    } catch (error) {
      console.error('Error fetching area names:', error);
    }
  };

  const fetchTypeNames = async () => {
    try {
      const response = await axios.get('http://localhost:8000/data/get-type-names');
      setTypeNames(response.data);
    } catch (error) {
      console.error('Error fetching type names:', error);
    }
  };

  const fetchFestivalNames = async (area, type) => {
    try {
      const response = await axios.get('http://localhost:8000/data/get-festival-names', {
        params: { area, type }
      });
      setFestivalNames(response.data);
    } catch (error) {
      console.error('Error fetching festival names:', error);
    }
  };

  const fetchFestivalBoardData = async (page, area, type, festival) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallfestivalboard', {
        params: { page, area, type, festival }
      });
      setFestivalBoardData(response.data.festivalboard);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching festival board data:', error);
    }
  };

  const deleteFestivalBoard = async (fr_id) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await axios.delete(`http://localhost:8000/data/delete-festivalboard/${fr_id}`);
        window.location.reload();
      } catch (error) {
        console.error('Error deleting festival board:', error);
      }
    }
  };

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const handleSearch = async (page = 0) => {
    try {
      const res = await axios.get('http://localhost:8000/data/search-festivalboard', {
        params: {
          category: searchCategory,
          keyword: searchKeyword,
          page,
          area: selectAreaCategory,
          type: selectTypeCategory,
          festival: selectFestivalCategory
        }
      });
      setFestivalBoardData(res.data.festivalboard);
      setTotalPages(res.data.totalPages);
      setCurrentPage(page);
    } catch (error) {
      console.error('검색 실패:', error);
    }
  };

  const handleKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  const renderPageNumbers = () => {
    const pageNumbers = [];
    const maxPagesToShow = 10; 
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
    <div className="festivalboard-info">
      <h1>행사별 게시판 관리</h1>
      <div className="search-section">
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="fr_title">제목</option>
          <option value="member_id">게시자</option>
        </select>
        <input
          type="text"
          placeholder="검색"
          className="search-input"
          value={searchKeyword}
          onChange={(e) => setSearchKeyword(e.target.value)}
          onKeyUp={handleKeyUp}
        />
        <button className="search-button" onClick={() => handleSearch(0)}>검색</button>
      </div>
      <select className="area-cate-select space-bar" value={selectAreaCategory} onChange={(e) => setSelectAreaCategory(e.target.value)}>
        <option value="all">전체</option>
        {areaNames.map((name, index) => (
          <option key={index} value={name}>{name}</option>
        ))}
      </select>
      <select className="type-cate-select space-bar" value={selectTypeCategory} onChange={(e) => setSelectTypeCategory(e.target.value)}>
        <option value="all">전체</option>
        {typeNames.map((name, index) => (
          <option key={index} value={name}>{name}</option>
        ))}
      </select>
      <select className="festival-cate-select" value={selectFestivalCategory} onChange={(e) => setSelectFestivalCategory(e.target.value)}>
        <option value="all">전체</option>
        {festivalNames.map((name, index) => (
          <option key={index} value={name}>{name}</option>
        ))}
      </select>
      <table className="board-table">
        <thead>
          <tr>
            <th className='board_id'>게시물번호</th>
            <th className='board_cate'>행사이름</th>
            <th className='board_title'>게시물제목</th>
            <th className='board_member'>게시자</th>
            <th className='board_date'>업로드날짜</th>
            <th className='board_delete'>삭제</th>
          </tr>
        </thead>
        <tbody>
          {festivalBoardData.map(festivalboard => (
            <tr key={festivalboard.fr_id}>
              <td className='board_id'>{festivalboard.fr_id}</td>
              <td className='board_cate'>{festivalboard.festival_name}</td>
              <td className='board_title'>{festivalboard.fr_title}</td>
              <td className='board_member'>{festivalboard.member_id}</td>
              <td className='board_date'>{festivalboard.fr_regdate}</td>
              <td className='board_delete'>
                <button className='boarddelete-button' onClick={() => deleteFestivalBoard(festivalboard.fr_id)}>삭제</button>
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

export default FestivalBoardManagement;