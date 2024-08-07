import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../css/Question.css';
import { useAuth } from './AuthContext';

function Question() {
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.
  const [QuestionData, setQuestionData] = useState([]); // 문의 데이터를 저장할 상태
  const [currentPage, setCurrentPage] = useState(0); // 현재 페이지 번호를 저장할 상태
  const [totalPages, setTotalPages] = useState(0); // 총 페이지 수를 저장할 상태
  const [searchCategory, setSearchCategory] = useState('member_id'); // 검색 카테고리를 저장할 상태
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드를 저장할 상태
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수

  // 컴포넌트 마운트 시 및 currentPage 또는 searchKeyword 변경 시 데이터 로드
  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      questionView(currentPage);
    }
  }, [currentPage]);

  // 서버에서 문의 데이터를 가져오는 함수
  const questionView = async (page) => {
    try {
      const response = await instance.get('/data/getallquestion', {
        params: { page } // 페이지 번호를 서버에 전달
      });
      setQuestionData(response.data.questions); // 문의 데이터를 상태에 저장
      setTotalPages(response.data.totalPages); // 총 페이지 수를 상태에 저장
    } catch (error) {
    }
  };

  // 문의 처리 상태에 따라 다른 페이지로 이동하는 함수
  const handleButtonClick = (question_no, status) => {
    if (status === '처리완료') {
      navigate(`/menubar/alreadyanswer/${question_no}`);
    } else {
      navigate(`/menubar/answer/${question_no}`);
    }
  };

  // 페이지 변경을 처리하는 함수
  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  // 검색을 처리하는 함수
  const handleSearch = async (page = 0) => {
    try {
      const res = await instance.get('/data/search-question', {
        params: {
          category: searchCategory, // 검색 카테고리를 서버에 전달
          keyword: searchKeyword, // 검색 키워드를 서버에 전달
          page // 페이지 번호를 서버에 전달
        }
      });
      setQuestionData(res.data.questions); // 검색 결과를 상태에 저장
      setTotalPages(res.data.totalPages); // 총 페이지 수를 상태에 저장
      setCurrentPage(page); // 현재 페이지를 상태에 저장
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
    <div className="question" id='question'>
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
            <th className='answerbutton'>답변등록/보기</th>
          </tr>
        </thead>
        <tbody>
          {QuestionData && QuestionData.length > 0 && QuestionData.map(question => (
            <tr key={question.question_no}>
              <td className='question_no'>{question.question_no}</td>
              <td className='member_id'>{question.member_id}</td>
              <td className='question_cate'>{question.question_cate}</td>
              <td className='question_title'>{question.question_title}</td>
              <td className='question_status'>{question.question_status}</td>
              <td className='question_date'>{question.question_date}</td>
              <td className='answerbutton'>
                <button 
                  className='answer-button' 
                  onClick={() => handleButtonClick(question.question_no, question.question_status)}>
                  {question.question_status === '처리완료' ? '답변보기' : '답변등록'}
                </button>
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

export default Question;

/*
 * 1. useEffect를 통해 questionView 또는 handleSearch 함수를 호출하여 현재 페이지의 문의 데이터를 가져옴.
 * 2. setPage 함수를 통해 currentPage 상태가 변경될 때마다 questionView 또는 handleSearch 호출.
 * 3. 문의 상태에 따라 handleButtonClick 함수가 호출되어 다른 페이지로 이동.
 * 4. 검색 입력 필드에서 Enter 키를 누르거나 검색 버튼 클릭 시 handleSearch 함수 호출.
 * 5. renderPageNumbers 함수를 통해 페이지 번호를 렌더링하고 페이지 변경을 처리.
 */