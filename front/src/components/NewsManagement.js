import React, { useEffect, useState } from 'react';
import axios from 'axios';
import '../css/NewsManagement.css';

function NewsManagement() {
  const [newsData, setNewsData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [searchCategory, setSearchCategory] = useState('title');
  const [searchKeyword, setSearchKeyword] = useState('');

  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      fetchNewsData(currentPage);
    }
  }, [currentPage]);

  const fetchNewsData = async (page) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallnews', {
        params: { page }
      });
      setNewsData(response.data.news);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching news data:', error);
    }
  };

  const deleteNews = async (newsId) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await axios.delete(`http://localhost:8000/data/delete-news/${newsId}`);
        window.location.reload(); // 페이지 새로고침
      } catch (error) {
        console.error('Error deleting news:', error);
      }
    }
  };
  
  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const handleSearch = async (page = 0) => {
    try {
      const res = await axios.get('http://localhost:8000/data/search-news', {
        params: {
          category: searchCategory,
          keyword: searchKeyword,
          page
        }
      });
      setNewsData(res.data.news);
      setTotalPages(res.data.totalPages);
      setCurrentPage(page); // 검색 후에도 페이지 번호를 유지
    } catch (error) {
      console.error('검색 실패:', error);
    }
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
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="title">제목</option>
          <option value="area">지역</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" value={searchKeyword} onChange={(e) => setSearchKeyword(e.target.value)} />
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