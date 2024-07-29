import React, { useState, useEffect } from 'react';
import '../css/AdminInfo.css';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './AuthContext';

function AdminCard({ admin, onClick }) { // 관리자의 정보를 카드 형식으로 표시 관리자 이미지 + 이름
  const imagePath = `http://localhost:8000${admin.admin_image}`; 
  
  return (
    <div className="admin-card" onClick={() => onClick(admin)}>
      <img src={imagePath} className="admin-photo" alt={admin.admin_name} />
      <p className="admin-name">{admin.admin_name}</p>
    </div>
  );
}
 // back에 저장된 이미지 경로로 불러옴


function Adminpopup({ admin, onClose }) { // 선택된 관리자의 상세 정보를 팝업으로 표시. 수정 및 삭제
  const { instance } = useAuth();
  const [editAdmin, seteditAdmin] = useState({ ...admin }); // 관리자 수정시 수정 중인 관리자 정보 저장
  const [isEditing, setIsEditing] = useState(false); // 일반모드 / 수정모드
  const [selectedFile, setSelectedFile] = useState(null); // 업로드 된 사진 파일 저장

  const handleChange = (e) => { // 입력값이 변경될때 호출되어 editAdmin 상태 업데이트
    const { name, value } = e.target;
    seteditAdmin((prevAdmin) => ({
      ...prevAdmin,
      [name]: value,
    }));
  };

  const handleFileChange = (e) => { // 파일 선택시 호출되어 selectedFile 상태를 업데이트
    setSelectedFile(e.target.files[0]);
  };

  const handleDeleteAdmin = (adminId) => { // 관리자 삭제
    if (window.confirm('삭제하시겠습니까?')) {
      instance.delete(`/data/delete-admin/${adminId}`)
        .then(response => {
          if (response.status === 200) {
            alert('관리자 삭제 완료');
            onClose(); // 삭제 완료 후 팝업 닫기
            window.location.reload(); // 삭제 완료 후 페이지 새로고침
          } else {
            alert('관리자 삭제 실패');
          }
        })
    } else {
    }
  };

  const handleUpdateAdmin = async () => { // 관리자 수정
    if (isEditing) {
      if (window.confirm('수정하시겠습니까?')) {
        const formData = new FormData();
        formData.append('admin_id', editAdmin.admin_id);
        formData.append('admin_name', editAdmin.admin_name);
        formData.append('admin_email', editAdmin.admin_email);
        formData.append('admin_tel', editAdmin.admin_tel);
        if (selectedFile) {
          formData.append('admin_image', selectedFile);
        }

        try {
          const response = await instance.post('/data/update-admin', formData, {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          });
          if (response.status === 200) {
            alert('관리자 수정 완료');
            onClose(); // 수정 완료 후 팝업창 닫기
            window.location.reload(); // 수정 완료 후 페이지 새로고침
          } else {
            alert('관리자 수정 실패');
          }
        } catch (error) {
          alert('관리자 수정 실패');
        }
      }
    } else {
      setIsEditing(true);
    }
  };

  const imagePath = `http://localhost:8000${admin.admin_image}`;

  return (
    <div className="popup">
      <div className="popup-content">
        <img src={imagePath} className="admin-photo" alt={admin.admin_name} />
        <span className="close-button" onClick={onClose}>&times;</span>
        <p><strong>이름 : </strong>{isEditing ? (
          <input
            type="text"
            name="admin_name"
            value={editAdmin.admin_name}
            onChange={handleChange}
          />
        ) : (
            admin.admin_name
        )}</p>
        <p><strong>아이디:</strong> {isEditing ? (
          <input
            type="text"
            name="admin_id"
            value={editAdmin.admin_id}
            onChange={handleChange}
            readOnly
          />
        ) : (
            admin.admin_id
        )}</p>
        <p><strong>이메일:</strong> {isEditing ? (
          <input
            type="text"
            name="admin_email"
            value={editAdmin.admin_email}
            onChange={handleChange}
          />
        ) : (
            admin.admin_email
        )}</p>
        <p><strong>전화번호:</strong> {isEditing ? (
          <input
            type="tel"
            name="admin_tel"
            value={editAdmin.admin_tel}
            onChange={handleChange}
          />
        ) : (
          admin.admin_tel
        )}</p>
        {isEditing && (
          <div>
            <strong>프로필 이미지:</strong> 
            <input type="file" name="admin_image" onChange={handleFileChange}/>
          </div>
        )}
        <button className="update-admin" onClick={handleUpdateAdmin}>
          {isEditing ? '저장' : '수정'}
        </button>
        <button className="delete-admin" onClick={() => handleDeleteAdmin(admin.admin_id)}>
          삭제
        </button>
      </div>
    </div>
  );
}

function AdminInfo() {
  const { instance } = useAuth();
  const navigate = useNavigate();
  const [selectedAdmin, setSelectedAdmin] = useState(null); // 관리자 선택시 선택된 관리자 정보 저장
  const [adminView, setAdminView] = useState([]); // 화면에 띄워줄 관리자 목록 저장
  const [searchCategory, setSearchCategory] = useState('admin_name'); // 검색 시 선택한 카테고리
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 시 입력한 키워드

  useEffect(() => { adminList() }, []) // 랜더링 될 때 마다 adminList를 호출하여 관리자 목록 가져오기

  const adminList = async () => { // 전체 관리자 목록
    await instance.get('/data/getalladmin')
      .then((res) => {
        setAdminView(res.data);
      })
  }

  const handleSearch = async () => { // 검색어에 맞는 관리자 목록
    try {
      const res = await instance.get('/data/search-admin', {
        params: {
          category: searchCategory,
          keyword: searchKeyword
        }
      });
      setAdminView(res.data); // 검색 내용에 맞는 데이터들을 adminView에 저장해서 화면에 띄워줌
    } catch (error) {
      console.error(error);
    }
  };

  const handleEnter = (e) => { // 엔터키 입력 시 검색
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  const handleInsertAdmin = () => { // 관리자 등록 페이지로 이동
    navigate('/menubar/insert-admin');
  };

  const handleCardClick = (admin) => { // 관리자 카드 클릭 시 팝업 열기
    setSelectedAdmin(admin);
  };

  const handleClosepopup = () => { // 팝업 닫기
    setSelectedAdmin(null);
  };

  return (
    <div className="admin-info">
      <h1>관리자 정보</h1>
      <div className="search-section">
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="admin_name">이름</option>
          <option value="admin_id">아이디</option>
          <option value="admin_email">이메일</option>
          <option value="admin_tel">전화번호</option>
        </select>
        <input 
          type="text" 
          placeholder="검색" 
          className="search-input" 
          value={searchKeyword} 
          onChange={(e) => setSearchKeyword(e.target.value)} 
          onKeyUp={handleEnter}
        />
        <button className="search-button" onClick={handleSearch}>검색</button>
      </div>
      <div className="insert-admin-container" id='insert-admin-container'>
        <button className="insert-admin" onClick={handleInsertAdmin}>관리자 등록</button>
      </div>
      <div className="admin-cards-container">
        <div className="admin-cards">
          {adminView.map(admin => (
            <AdminCard key={admin.admin_id} admin={admin} onClick={handleCardClick} />
          ))}
        </div>
      </div>
      {selectedAdmin && <Adminpopup admin={selectedAdmin} onClose={handleClosepopup} />}
    </div>
  );
}

export default AdminInfo;

/* 

   1. AdminInfo 컴포넌트 렌더링 시 useEffect를 통해 adminList 함수 호출, 관리자 목록이 viewContent에 저장
   2. 사용자가 검색어를 입력한 뒤 검색 버튼을 클릭하거나 엔터키 누를 시 handleSearch 함수 호출, 검색 결과에 따른 목록이 viewContent에 저장
   3. 관리자 카드 클릭시 handleCardClick 함수 호출 selectedAdmin에 해당 관리자의 정보가 저장되고 팝업 띄움
   4. 팝업 내에서 수정버튼을 클릭한 경우 isEditing 상태가 true로 변경되며 입력 활성화
   5. 저장버튼 클릭 시 handleUpdateAdmin 함수가 호출되어 관리자 수정
   6. 삭제버튼 클릭 시 handleDeleteAdmin 함수가 호출되어 관리자 삭제
   7. 팝업에서 닫기 버튼 클릭시 handleClosepopup 함수 호출되어 팝업이 닫히고 selectedAdmin이 null로 바뀜

*/