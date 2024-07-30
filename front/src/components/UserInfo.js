import React, { useEffect, useState } from 'react';
import '../css/UserInfo.css';
import { useAuth } from './AuthContext';

function UserInfo() {
  const { instance } = useAuth(); // 인증 컨텍스트에서 Axios 인스턴스를 가져옴
  const [memberData, setMemberData] = useState([]); // 회원 데이터를 저장할 상태
  const [currentPage, setCurrentPage] = useState(0); // 현재 페이지 번호를 저장할 상태
  const [totalPages, setTotalPages] = useState(0); // 총 페이지 수를 저장할 상태
  const [searchCategory, setSearchCategory] = useState('member_name'); // 검색 카테고리를 저장할 상태
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드를 저장할 상태
  const [editIndex, setEditIndex] = useState(-1); // 수정 중인 회원의 인덱스를 저장할 상태
  const [editMember, setEditMember] = useState({}); // 수정 중인 회원 정보를 저장할 상태
  const [errors, setErrors] = useState({}); // 입력 값 검증 오류 메시지를 저장할 상태

  // 컴포넌트 마운트 시 회원 데이터를 가져옴
  useEffect(() => {
    memberView(currentPage);
  }, [currentPage]);

  // 현재 페이지에 따라 회원 데이터를 가져오는 함수
  const memberView = async (page) => {
    try {
      const response = await instance.get('/data/getallmember', {
        params: { page } // 페이지 번호를 서버에 전달
      });
      setMemberData(response.data.member); // 서버에서 가져온 회원 데이터를 상태에 저장
      setTotalPages(response.data.totalPages); // 서버에서 가져온 총 페이지 수를 상태에 저장
    } catch (error) {
    }
  };

  // 회원 상태를 업데이트하는 함수
  const updateMemberStatus = async (member_id, newStatus) => {
    try {
      await instance.post(`/data/update-member-status/${member_id}`, {
        status: newStatus // 새로운 회원 상태를 서버에 전달
      });
      memberView(currentPage); // 상태 변경 후 회원 데이터를 다시 가져옴
    } catch (error) {
    }
  };

  // 회원 상태 토글을 처리하는 함수
  const handleMemberStatus = (member_id, currentStatus) => {
    const newStatus = currentStatus === 'Y' ? 'N' : 'Y'; // 현재 상태에 따라 새로운 상태를 설정
    if (window.confirm('회원 상태를 변경하시겠습니까?')) {
      updateMemberStatus(member_id, newStatus);
    }
  };

  // 검색을 처리하는 함수
  const handleSearch = async () => {
    try {
      const res = await instance.get('/data/search-member', {
        params: {
          category: searchCategory, // 검색 카테고리를 서버에 전달
          keyword: searchKeyword // 검색 키워드를 서버에 전달
        }
      });
      setMemberData(res.data); // 서버에서 검색된 회원 데이터를 상태에 저장
    } catch (error) {
    }
  };

  // 검색 입력 필드에서 엔터 키를 눌렀을 때 검색을 실행하는 함수
  const handleKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  // 페이지 변경을 처리하는 함수
  const handlePageChange = (page) => {
    setCurrentPage(page); // 선택한 페이지 번호를 상태에 저장
  };

  // 수정 버튼 클릭 시 처리하는 함수
  const handleEditClick = (index, member) => {
    setEditIndex(index); // 수정 중인 회원의 인덱스를 상태에 저장
    setEditMember({ ...member }); // 수정 중인 회원 정보를 상태에 저장
    setErrors({}); // 오류 메시지 초기화
  };

  // 수정 입력 필드 변경 시 처리하는 함수
  const handleEditChange = (e) => {
    const { name, value } = e.target; // 입력 필드의 이름과 값을 가져옴
    setEditMember((prev) => ({
      ...prev,
      [name]: value // 수정 중인 회원 정보 상태를 업데이트
    }));
  };

  // 필드 값을 검증하는 함수
  const validateField = (name, value) => {
    let error = ''; // 오류 메시지 초기화
    switch (name) {
      case 'member_name':
        if (!/^[가-힣]{2,}$/.test(value)) {
          error = '이름은 한글 2자 이상이어야 합니다.';
        }
        break;
      case 'member_email':
        if (!/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/.test(value)) {
          error = '유효한 이메일 주소를 입력하세요.';
        }
        break;
      case 'member_tel':
        if (!/^[0-9]{10,15}$/.test(value)) {
          error = '전화번호는 숫자로 이루어진 10자 이상이어야 합니다.';
        }
        break;
      case 'member_area':
        if (value === '') {
          error = '지역을 입력하세요.';
        }
        break;
      default:
        break;
    }
    setErrors((prevErrors) => ({
      ...prevErrors,
      [name]: error // 오류 메시지 상태를 업데이트
    }));
    return error === ''; // 오류 메시지가 비어 있는지 여부를 반환
  };

  // 수정 제출 시 처리하는 함수
  const handleEditSubmit = async () => {
    let valid = true; // 유효성 검사 초기화
    for (const [name, value] of Object.entries(editMember)) { //editMember 객체의 모든 키-값 쌍을 배열 형태로 반환
      if (!validateField(name, value)) {
        valid = false;
      }
    }
    if (!valid) {
      return; // 유효성 검사를 통과하지 못하면 함수 종료
    }

    if (window.confirm('수정하시겠습니까?')) {
      try {
        const response = await instance.post('/data/update-member', editMember);
        if (response.status === 200) {
          alert('회원 정보 수정 완료');
          memberView(currentPage); // 수정 완료 후 회원 데이터를 다시 가져옴
          setEditIndex(-1); // 수정 모드 종료
        } else {
          alert('회원 정보 수정 실패');
        }
      } catch (error) {
      }
    }
  };

  // 페이지 번호를 렌더링하는 함수
  const renderPageNumbers = () => {
    const pageNumbers = [];
    const maxPagesToShow = 10; // 한 번에 보여줄 최대 페이지 수
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
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="member_name">이름</option>
          <option value="member_id">아이디</option>
          <option value="member_area">지역</option>
          <option value="member_tel">전화번호</option>
        </select>
        <input
          type="text"
          placeholder="검색"
          className="search-input"
          value={searchKeyword}
          onChange={(e) => setSearchKeyword(e.target.value)}
          onKeyUp={handleKeyUp}
        />
        <button className="search-button" onClick={handleSearch}>검색</button>
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
            <th className='member_update'>수정</th>
            <th className='memberstop'>정지</th>
          </tr>
        </thead>
        <tbody>
          {memberData.map((member, index) => (
            <tr key={member.member_id}>
              {editIndex === index ? (
                <>
                  <td className='member_name'>
                    <input
                      type="text"
                      name="member_name"
                      value={editMember.member_name}
                      onChange={handleEditChange}
                      onBlur={(e) => validateField(e.target.name, e.target.value)}
                    />
                    {errors.member_name && <div className="error-message">{errors.member_name}</div>}
                  </td>
                  <td className='member_id'>{member.member_id}</td>
                  <td className='member_area'>
                    <input
                      type="text"
                      name="member_area"
                      value={editMember.member_area}
                      onChange={handleEditChange}
                      onBlur={(e) => validateField(e.target.name, e.target.value)}
                    />
                    {errors.member_area && <div className="error-message">{errors.member_area}</div>}
                  </td>
                  <td className='member_email'>
                    <input
                      type="text"
                      name="member_email"
                      value={editMember.member_email}
                      onChange={handleEditChange}
                      onBlur={(e) => validateField(e.target.name, e.target.value)}
                    />
                    {errors.member_email && <div className="error-message">{errors.member_email}</div>}
                  </td>
                  <td className='member_tel'>
                    <input
                      type="text"
                      name="member_tel"
                      value={editMember.member_tel}
                      onChange={handleEditChange}
                      onBlur={(e) => validateField(e.target.name, e.target.value)}
                    />
                    {errors.member_tel && <div className="error-message">{errors.member_tel}</div>}
                  </td>
                  <td className='member_status'>{member.member_status}</td>
                  <td className='member_update'>
                    <button
                      className='memberupdate-button'
                      onClick={handleEditSubmit}
                    >완료
                    </button>
                  </td>
                  <td className='memberstop'>
                    <button
                      className='memberstop-button'
                      onClick={() => handleMemberStatus(member.member_id, member.member_status)}
                    >
                      {member.member_status === 'Y' ? '정지' : '취소'}
                    </button>
                  </td>
                </>
              ) : (
                <>
                  <td className='member_name'>{member.member_name}</td>
                  <td className='member_id'>{member.member_id}</td>
                  <td className='member_area'>{member.member_area}</td>
                  <td className='member_email'>{member.member_email}</td>
                  <td className='member_tel'>{member.member_tel}</td>
                  <td className='member_status'>{member.member_status}</td>
                  <td className='member_update'>
                    <button
                      className='memberupdate-button'
                      onClick={() => handleEditClick(index, member)}
                    >수정
                    </button>
                  </td>
                  <td className='memberstop'>
                    <button
                      className='memberstop-button'
                      onClick={() => handleMemberStatus(member.member_id, member.member_status)}
                    >
                      {member.member_status === 'Y' ? '정지' : '취소'}
                    </button>
                  </td>
                </>
              )}
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

/**
 * UserInfo 컴포넌트 흐름도
 *
 * 1. useEffect를 통해 memberView 함수를 호출하여 현재 페이지의 회원 데이터를 가져옴.
 * 2. handlePageChange 함수를 통해 currentPage 상태가 변경될 때마다 memberView 호출.
 * 3. handleMemberStatus 함수에서 회원 상태를 토글하고 updateMemberStatus 함수 호출.
 * 4. 검색 입력 필드에서 Enter 키를 누르거나 검색 버튼 클릭 시 handleSearch 함수 호출.
 * 5. 수정 버튼 클릭 시 handleEditClick 함수 호출로 수정 모드로 전환.
 * 6. 수정 완료 버튼 클릭 시 handleEditSubmit 함수 호출로 회원 정보 업데이트.
 */