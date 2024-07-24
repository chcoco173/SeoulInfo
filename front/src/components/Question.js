import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import '../css/Question.css'; 

function Question() {

  const [QuestionData, setQuestionData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [searchCategory, setSearchCategory] = useState('member_id');
  const [searchKeyword, setSearchKeyword] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      fetchQuestionData(currentPage);
    }
  }, [currentPage]);

  const fetchQuestionData = async (page) => {
    try {
      const response = await axios.get('http://localhost:8000/data/getallquestion', {
        params: { page }
      });
      setQuestionData(response.data.questions);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching question data:', error);
    }
  };

  const Answer = (question_no) => {
    navigate(`/dashboard/answer/${question_no}`);
  };

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const handleSearch = async (page = 0) => {
    try {
      const res = await axios.get('http://localhost:8000/data/search-question', {
        params: {
          category: searchCategory,
          keyword: searchKeyword,
          page
        }
      });
      setQuestionData(res.data.questions);
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
    <div className="question">
      <h1>문의 관리</h1>
        
      <div className="search-section">
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="member_id">아이디</option>
          <option value="question_title">문의제목</option>
          <option value="question_cate">카테고리</option>
          <option value="question_status">처리상태</option>
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
      <table className="question-table">
        <thead>
          <tr>
            <th className='question_no'>문의번호</th>
            <th className='member_id'>작성자아이디</th>
            <th className='question_cate'>카테고리</th>
            <th className='question_title'>문의제목</th>
            <th className='question_status'>문의상태</th>
            <th className='question_date'>문의일자</th>
            <th className='answerbutton'>답변등록</th>
          </tr>
        </thead>
        <tbody>
        {QuestionData && QuestionData.length > 0 ? (
          QuestionData.map(question => (
            <tr key={question.question_no}>
              <td className='question_no'>{question.question_no}</td>
              <td className='member_id'>{question.member_id}</td>
              <td className='question_cate'>{question.question_cate}</td>
              <td className='question_title'>{question.question_title}</td>
              <td className='question_status'>{question.question_status}</td>
              <td className='question_date'>{question.question_date}</td>
              <td className='answerbutton'>
                <button className='answer-button' disabled={question.question_status === '처리완료'} onClick={() => Answer(question.question_no)}>답변등록</button>
              </td>
            </tr>
          ))
        ) : (
          <tr>
            <td colSpan="6">데이터가 없습니다.</td>
          </tr>
        )}
        </tbody>
      </table>
      <div className="pagination">
        {renderPageNumbers()}
      </div>
    </div>
  );
}

export default Question;