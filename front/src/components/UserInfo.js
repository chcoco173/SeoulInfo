import React, { useEffect, useState } from 'react';
import '../css/UserInfo.css';
import { useAuth } from './AuthContext';

function UserInfo() {
  const { instance } = useAuth();
  const [memberData, setMemberData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [searchCategory, setSearchCategory] = useState('member_name');
  const [searchKeyword, setSearchKeyword] = useState('');
  const [editIndex, setEditIndex] = useState(-1);
  const [editMember, setEditMember] = useState({});
  const [errors, setErrors] = useState({});

  useEffect(() => {
    fetchMemberData(currentPage);
  }, [currentPage]);

  const fetchMemberData = async (page) => {
    try {
      const response = await instance.get('/data/getallmember', {
        params: { page }
      });
      setMemberData(response.data.member);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching member data:', error);
    }
  };

  const updateMemberStatus = async (member_id, newStatus) => {
    try {
      await instance.post(`/data/update-member-status/${member_id}`, {
        status: newStatus
      });
      fetchMemberData(currentPage);
    } catch (error) {
    }
  };

  const handleStatusToggle = (member_id, currentStatus) => {
    const newStatus = currentStatus === 'Y' ? 'N' : 'Y';
    if (window.confirm('회원 상태를 변경하시겠습니까?')) {
      updateMemberStatus(member_id, newStatus);
    }
  };

  const handleSearch = async () => {
    try {
      const res = await instance.get('/data/search-member', {
        params: {
          category: searchCategory,
          keyword: searchKeyword
        }
      });
      setMemberData(res.data);
    } catch (error) {
      console.error('검색 실패:', error);
    }
  };

  const handleKeyUp = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const handleEditClick = (index, member) => {
    setEditIndex(index);
    setEditMember({ ...member });
    setErrors({});
  };

  const handleEditChange = (e) => {
    const { name, value } = e.target;
    setEditMember((prev) => ({
      ...prev,
      [name]: value
    }));
  };

  const validateField = (name, value) => {
    let error = '';
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
      [name]: error
    }));
    return error === '';
  };

  const handleEditSubmit = async () => {
    let valid = true;
    for (const [name, value] of Object.entries(editMember)) {
      if (!validateField(name, value)) {
        valid = false;
      }
    }
    if (!valid) {
      return;
    }

    if (window.confirm('수정하시겠습니까?')) {
      try {
        const response = await instance.post('/data/update-member', editMember);
        if (response.status === 200) {
          alert('회원 정보 수정 완료');
          fetchMemberData(currentPage);
          setEditIndex(-1);
        } else {
          alert('회원 정보 수정 실패');
        }
      } catch (error) {
        console.error('회원 정보 수정 실패:', error);
      }
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
                      onClick={() => handleStatusToggle(member.member_id, member.member_status)}
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
                      onClick={() => handleStatusToggle(member.member_id, member.member_status)}
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