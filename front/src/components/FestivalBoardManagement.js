import React, { useEffect, useState } from 'react';
import '../css/FestivalBoardManagement.css';
import { useAuth } from './AuthContext'; 

function FestivalBoardManagement() {
  const { instance } = useAuth(); 
  const [festivalBoardData, setFestivalBoardData] = useState([]); // 게시판 데이터를 저장
  const [areaNames, setAreaNames] = useState([]); // 지역 이름 저장
  const [typeNames, setTypeNames] = useState([]); // 유형 이름 저장
  const [festivalNames, setFestivalNames] = useState([]); // 행사 이름 저장
  const [currentPage, setCurrentPage] = useState(0); // 현재 페이지 번호 저장
  const [totalPages, setTotalPages] = useState(0); // 총 페이지 수 저장
  const [selectAreaCategory, setSelectAreaCategory] = useState('all'); // 선택된 지역 카테고리 저장
  const [selectTypeCategory, setSelectTypeCategory] = useState('all'); // 선택된 유형 카테고리 저장
  const [selectFestivalCategory, setSelectFestivalCategory] = useState('all'); // 선택된 행사 카테고리 저장
  const [searchCategory, setSearchCategory] = useState('title'); // 검색 카테고리 저장
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드 저장

  useEffect(() => {
    getAreaNames(); // 컴포넌트 마운트 시 지역 이름 데이터를 가져옴
    getTypeNames(); // 컴포넌트 마운트 시 유형 이름 데이터를 가져옴
  }, []);

  useEffect(() => {
    getFestivalNames(selectAreaCategory, selectTypeCategory); // 선택된 지역과 유형에 따라 행사 이름 데이터 가져옴
    setCurrentPage(0); // 카테고리가 변경되면 페이지 1로
  }, [selectAreaCategory, selectTypeCategory]);

  useEffect(() => {
    getFestivalBoardData(currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory); // 선택된 카테고리와 현재 페이지에 따라 게시판 데이터를 가져옴
  }, [currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory]);

  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage); // 검색어가 있을 경우 검색
    } else {
      getFestivalBoardData(currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory); // 검색어가 없을 경우 게시판 데이터 가져옴
    }
  }, [currentPage, selectAreaCategory, selectTypeCategory, selectFestivalCategory]);

  const getAreaNames = async () => { // 지역 이름 데이터 가져오는 함수
    try {
      const response = await instance.get('/data/get-area-names');
      setAreaNames(response.data);
    } catch (error) {
    }
  };

  const getTypeNames = async () => { // 유형 이름 데이터 가져오는 함수
    try {
      const response = await instance.get('/data/get-type-names');
      setTypeNames(response.data);
    } catch (error) {
    }
  };

  const getFestivalNames = async (area, type) => { // 지역과 유형에 따른 행사 이름 데이터 가져오는 함수
    try {
      const response = await instance.get('/data/get-festival-names', {
        params: { area, type }
      });
      setFestivalNames(response.data);
    } catch (error) {
    }
  };

  const getFestivalBoardData = async (page, area, type, festival) => { // 페이지, 지역, 유형, 행사에 따른 게시판 데이터 가져오는 함수
    try {
      const response = await instance.get('/data/getallfestivalboard', {
        params: { page, area, type, festival }
      });
      setFestivalBoardData(response.data.festivalboard);
      setTotalPages(response.data.totalPages);
    } catch (error) {
    }
  };

  const deleteFestivalBoard = async (fr_id) => { // 게시판 데이터 삭제
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-festivalboard/${fr_id}`);
        window.location.reload(); // 삭제 후 페이지 새로고침
      } catch (error) {
        console.error('Error deleting festival board:', error);
      }
    }
  };

  const handlePageChange = (page) => { // 페이지 변경 처리
    setCurrentPage(page);
  };

  const handleSearch = async (page = 0) => { // 검색 처리
    try {
      const res = await instance.get('/data/search-festivalboard', {
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

  const handleKeyUp = (e) => { // 검색 입력 필드에서 엔터 키를 눌렀을 때 검색을 실행하는 함수
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  const renderPageNumbers = () => { // 페이지 번호를 렌더링하는 함수
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

/* 

1. FestivalBoardManagement 컴포넌트 렌더링 시 useEffect를 통해 getAreaNames와 getTypeNames 함수를 호출하여 데이터를 가져와 상태에 저장
2. 선택된 지역과 유형에 따라 행사 이름 데이터를 가져오고 상태에 저장
3. 선택된 카테고리와 현재 페이지에 따라 게시판 데이터를 가져와 상태에 저장
4. 검색어가 입력되면 handleSearch 함수를 호출하여 검색 결과를 상태에 저장
5. 각 게시판 데이터의 삭제 버튼 클릭 시 deleteFestivalBoard 함수 호출, 해당 데이터를 서버에서 삭제하고 페이지를 새로고침
6. 페이지 번호 클릭 시 handlePageChange 함수 호출, 해당 페이지의 데이터를 가져와 상태에 저장

*/
