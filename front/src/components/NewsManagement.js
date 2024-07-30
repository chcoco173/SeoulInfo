import React, { useEffect, useState } from 'react';
import '../css/NewsManagement.css';
import { useAuth } from './AuthContext';

function NewsManagement() {
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.
  const [newsData, setNewsData] = useState([]); // 뉴스 데이터를 저장할 상태
  const [currentPage, setCurrentPage] = useState(0); // 현재 페이지 번호를 저장할 상태
  const [totalPages, setTotalPages] = useState(0); // 총 페이지 수를 저장할 상태
  const [searchCategory, setSearchCategory] = useState('news_title'); // 검색 카테고리를 저장할 상태
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드를 저장할 상태

  // 컴포넌트 마운트 시 및 currentPage 또는 searchKeyword 변경 시 데이터 로드
  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      newsView(currentPage);
    }
  }, [currentPage]);

  // 서버에서 뉴스 데이터를 가져오는 함수
  const newsView = async (page) => {
    try {
      const response = await instance.get('/data/getallnews', {
        params: { page } // 페이지 번호를 서버에 전달
      });
      setNewsData(response.data.news); // 뉴스 데이터를 상태에 저장
      setTotalPages(response.data.totalPages); // 총 페이지 수를 상태에 저장
    } catch (error) {
    }
  };

  // 뉴스 삭제를 처리하는 함수
  const deleteNews = async (newsId) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-news/${newsId}`);
        window.location.reload(); // 페이지 새로고침
      } catch (error) {
      }
    }
  };

  // 페이지 변경을 처리하는 함수
  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  // 검색을 처리하는 함수
  const handleSearch = async (page = 0) => {
    try {
      const res = await instance.get('/data/search-news', {
        params: {
          category: searchCategory, // 검색 카테고리를 서버에 전달
          keyword: searchKeyword, // 검색 키워드를 서버에 전달
          page // 페이지 번호를 서버에 전달
        }
      });
      setNewsData(res.data.news); // 검색 결과를 상태에 저장
      setTotalPages(res.data.totalPages); // 총 페이지 수를 상태에 저장
      setCurrentPage(page); // 검색 후에도 페이지 번호를 유지
    } catch (error) {
    }
  };

  // 검색 입력 필드에서 Enter 키를 눌렀을 때 검색을 실행하는 함수
  const handleKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  // 페이지 번호를 렌더링하는 함수
  const renderPageNumbers = () => {
    const pageNumbers = [];
    const maxPagesToShow = 10; // 한 번에 보여줄 최대 페이지 수
    const totalPageBlocks = Math.ceil(totalPages / maxPagesToShow); // 총 페이지 블록 수
    const currentBlock = Math.floor(currentPage / maxPagesToShow); // 현재 페이지 블록

    const startPage = currentBlock * maxPagesToShow; // 시작 페이지
    const endPage = Math.min(startPage + maxPagesToShow, totalPages); // 종료 페이지

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
    <div className="news-info">
      <h1>뉴스 관리</h1>
      <div className="search-section">
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="news_title">제목</option>
          <option value="news_area">지역</option>
        </select>
        <input
          type="text"
          placeholder="검색"
          className="search-input"
          value={searchKeyword}
          onChange={(e) => setSearchKeyword(e.target.value)}
          onKeyUp={handleKeyUp} // onKeyUp 이벤트 추가
        />
        <button className="search-button" onClick={() => handleSearch(0)}>검색</button>
      </div>
      <table className="news-table">
        <thead>
          <tr>
            <th className='newsnum'>번호</th>
            <th className='newsarea'>지역</th>
            <th className='newstitle'>제목</th>
            <th className='newslink'>링크</th>
            <th className='newsdate'>업로드날짜</th>
            <th className='newsdelete'>삭제</th>
          </tr>
        </thead>
        <tbody>
          {newsData.map(news => (
            <tr key={news.news_id}>
              <td className='newsnum'>{news.news_id}</td>
              <td className='newsarea'>{news.news_area}</td>
              <td className='newstitle'>{news.news_title}</td>
              <td className='newslink'>
                <a href={news.news_link} target="_blank" rel="noopener noreferrer">
                  {news.news_link}
                </a>
              </td>
              <td className='newsdate'>{news.news_date}</td>
              <td className='newsdelete'>
                <button className='newsdelete-button' onClick={() => deleteNews(news.news_id)}>삭제</button>
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

export default NewsManagement;

/*
 * 1. useEffect를 통해 newsView 또는 handleSearch 함수를 호출하여 현재 페이지의 뉴스 데이터를 가져옴.
 * 2. setCurrentPage 함수를 통해 currentPage 상태가 변경될 때마다 newsView 또는 handleSearch 호출.
 * 3. 뉴스 항목의 삭제 버튼 클릭 시 deleteNews 함수 호출로 뉴스 삭제 처리.
 * 4. 검색 입력 필드에서 Enter 키를 누르거나 검색 버튼 클릭 시 `handleSearch` 함수 호출.
 * 5. renderPageNumbers 함수를 통해 페이지 번호를 렌더링하고 페이지 변경을 처리.
 */