import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../css/NewsManagement.css';

function NewsManagement() {
  const [newsData, setNewsData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);

  useEffect(() => {
    fetchNewsData(currentPage);
  }, [currentPage]);

  const fetchNewsData = async (page) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallnews', {
        params: { page }
      });
      setNewsData(response.data.news);
      setTotalPages(response.data.totalPages); // 서버에서 전체 페이지 수를 받아옵니다.
    } catch (error) {
      console.error('Error fetching news data:', error);
    }
  };

  const deleteNews = async (newsId) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await axios.delete(`http://localhost:8000/data/delete-news/${newsId}`);
        fetchNewsData(currentPage); // 현재 페이지의 데이터를 다시 불러옵니다.
      } catch (error) {
        console.error('Error deleting news:', error);
      }
    }
  };
  
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
    <div className="news-info">
      <h1>뉴스 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="nId">번호</option>
          <option value="nTitle">제목</option>
          <option value="nArea">지역</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
      <table className="news-table">
        <thead>
          <tr>
            <th className='newsnum'>번호</th>
            <th className='newsarea'>지역</th>
            <th className='newstitle'>제목</th>
            <th className='newslink'>링크</th>
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