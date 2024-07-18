import React, { useState, useEffect } from 'react';
import '../css/AdminInfo.css';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function AdminCard({ admin, onClick }) {
  const imagePath = `http://localhost:8000${admin.admin_image}`; // 이미지 경로 설정
  
  return (
    <div className="admin-card" onClick={() => onClick(admin)}>
      <img src={imagePath} className="admin-photo" alt={admin.admin_name} />
      <p className="admin-name">{admin.admin_name}</p>
    </div>
  );
}

function Adminpopup({ admin, onClose }) {
  const [editableAdmin, setEditableAdmin] = useState({ ...admin });
  const [isEditing, setIsEditing] = useState(false);
  const [selectedFile, setSelectedFile] = useState(null);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditableAdmin((prevAdmin) => ({
      ...prevAdmin,
      [name]: value,
    }));
  };

  const handleFileChange = (e) => {
    setSelectedFile(e.target.files[0]);
  };

  const handleDeleteAdmin = (adminId) => {
    if (window.confirm('삭제하시겠습니까?')) {
      axios.delete(
        `http://localhost:8000/data/delete-admin/${adminId}`,
        {
          headers: {
            'Content-Type': 'application/json'
          }
        }
      )
        .then(response => {
          if (response.status === 200) {
            console.log(response.data);
            alert('관리자 삭제 완료');
            onClose();
            window.location.reload();
          } else {
            console.error('관리자 삭제 실패', response.statusText);
            alert('관리자 삭제 실패');
          }
        })
        .catch(error => {
          console.error('에러 발생:', error);
        });
    } else {
      console.log('삭제 취소');
    }
  };

  const handleUpdateAdmin = async () => {
    if (isEditing) {
      if (window.confirm('수정하시겠습니까?')) {
        const formData = new FormData();
        formData.append('admin_id', editableAdmin.admin_id);
        formData.append('admin_name', editableAdmin.admin_name);
        formData.append('admin_email', editableAdmin.admin_email);
        formData.append('admin_tel', editableAdmin.admin_tel);
        if (selectedFile) {
          formData.append('admin_image', selectedFile);
        }

        try {
          const response = await axios.post('http://localhost:8000/data/update-admin', formData, {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          });
          if (response.status === 200) {
            alert('관리자 수정 완료');
            onClose();
            window.location.reload();
          } else {
            alert('관리자 수정 실패');
          }
        } catch (error) {
          console.error('에러 발생:', error);
          alert('관리자 수정 실패');
        }
      }
    } else {
      setIsEditing(true);
    }
  };

  const imagePath = `http://localhost:8000${admin.admin_image}`; // 이미지 경로 설정

  return (
    <div className="popup">
      <div className="popup-content">
        <img src={imagePath} className="admin-photo" alt={admin.admin_name} />
        <span className="close-button" onClick={onClose}>&times;</span>
        <p><strong>이름 : </strong>{isEditing ? (
          <input
            type="text"
            name="admin_name"
            value={editableAdmin.admin_name}
            onChange={handleChange}
          />
        ) : (
            admin.admin_name
        )}</p>
        <p><strong>아이디:</strong> {isEditing ? (
          <input
            type="text"
            name="admin_id"
            value={editableAdmin.admin_id}
            onChange={handleChange}
            readOnly // 아이디는 수정 불가
          />
        ) : (
            admin.admin_id
        )}</p>
        <p><strong>이메일:</strong> {isEditing ? (
          <input
            type="text"
            name="admin_email"
            value={editableAdmin.admin_email}
            onChange={handleChange}
          />
        ) : (
            admin.admin_email
        )}</p>
        <p><strong>전화번호:</strong> {isEditing ? (
          <input
            type="tel"
            name="admin_tel"
            value={editableAdmin.admin_tel}
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
  const navigate = useNavigate();
  const [selectedAdmin, setSelectedAdmin] = useState(null);
  const [viewContent, setViewContent] = useState([]);
  const [searchCategory, setSearchCategory] = useState('name');
  const [searchKeyword, setSearchKeyword] = useState('');


  useEffect(() => { adminList() }, [])

  const adminList = async () => {
    await axios.get('http://localhost:8000/data/getalladmin')
      .then((res) => {
        console.log(res);
        setViewContent(res.data);
      })
  }

  const handleSearch = async () => {
    try {
      const res = await axios.get('http://localhost:8000/data/search-admin', {
        params: {
          category: searchCategory,
          keyword: searchKeyword
        }
      });
      setViewContent(res.data);
    } catch (error) {
      console.error('검색 실패:', error);
    }
  };

  const handleInsertAdmin = () => {
    navigate('/dashboard/insert-admin');
};

  const handleCardClick = (admin) => {
    setSelectedAdmin(admin);
  };

  const handleClosepopup = () => {
    setSelectedAdmin(null);
  };

  return (
    <div className="admin-info">
      <h1>관리자 정보</h1>
      <div className="search-section">
      <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="name">이름</option>
          <option value="id">아이디</option>
          <option value="email">이메일</option>
          <option value="tel">전화번호</option>
        </select>

        <input type="text" placeholder="검색" className="search-input" value={searchKeyword} onChange={(e) => setSearchKeyword(e.target.value)}/>
        <button className="search-button" onClick={handleSearch}>검색</button>
      </div>
      <div className="insert-admin-container" id='insert-admin-container'>
          <button className="insert-admin" onClick={handleInsertAdmin}>관리자 등록</button>
        </div>
      <div className="admin-cards-container">
        <div className="admin-cards">
          {viewContent.map(admin => (
            <AdminCard key={admin.admin_id} admin={admin} onClick={handleCardClick} />
          ))}
        </div>
        
      </div>
      {selectedAdmin && <Adminpopup admin={selectedAdmin} onClose={handleClosepopup} />}
    </div>
  );
}

export default AdminInfo;