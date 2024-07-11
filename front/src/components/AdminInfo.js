import React, { useState } from 'react';
import '../css/AdminInfo.css';
import { useNavigate } from 'react-router-dom';

const adminData = [
  { id: 'imningning', name: '닝닝', photo: '/images/admin/닝닝.jpeg', email: 'admin1@naver.com', tel: '010-1111-1111' },
  { id: 'yujinan', name: '안유진', photo: '/images/admin/안유진.jpg', email: 'admin2@naver.com', tel: '010-2222-2222' },
  { id: 'seasonwinter', name: '윈터', photo: '/images/admin/윈터.jpeg', email: 'admin3@naver.com', tel: '010-3333-3333' },
  { id: 'oneyoungj', name: '장원영', photo: '/images/admin/장원영.jpg', email: 'admin4@naver.com', tel: '010-4444-4444' },
  { id: 'blackswan', name: '지젤', photo: '/images/admin/지젤.jpg', email: 'admin5@naver.com', tel: '010-5555-5555' },
  { id: 'mynikarina', name: '카리나', photo: '/images/admin/카리나.jpeg', email: 'admin6@naver.com', tel: '010-6666-6666' }
];

function AdminCard({ admin, onClick }) {
  return (
    <div className="admin-card" onClick={() => onClick(admin)}>
      <img src={admin.photo} className="admin-photo" alt={admin.name} />
      <p className="admin-name">{admin.name}</p>
    </div>
  );
}

function Adminpopup({ admin, onClose }) {
  const [editableAdmin, setEditableAdmin] = useState({ ...admin });
  const [isEditing, setIsEditing] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditableAdmin((prevAdmin) => ({
      ...prevAdmin,
      [name]: value,
    }));
  };

  const handleUpdateAdmin = () => {
    if (isEditing) {
      if (window.confirm('수정하시겠습니까?')) {
        // Update admin logic here
        onClose();
      }
    } else {
      setIsEditing(true);
    }
  };

  return (
    <div className="popup">
      <div className="popup-content">
        <img src={admin.photo} className="admin-photo" alt={admin.name} />
        <span className="close-button" onClick={onClose}>&times;</span>
        <h2>{isEditing ? (
          <input
            type="text"
            name="name"
            value={editableAdmin.name}
            onChange={handleChange}
          />
        ) : (
          admin.name
        )}</h2>
        <p><strong>아이디:</strong> {admin.id}</p>
        <p><strong>이메일:</strong> {isEditing ? (
          <input
            type="email"
            name="email"
            value={editableAdmin.email}
            onChange={handleChange}
          />
        ) : (
          admin.email
        )}</p>
        <p><strong>전화번호:</strong> {isEditing ? (
          <input
            type="tel"
            name="tel"
            value={editableAdmin.tel}
            onChange={handleChange}
          />
        ) : (
          admin.tel
        )}</p>
        <button className="update-admin" onClick={handleUpdateAdmin}>
          {isEditing ? '저장' : '수정'}
        </button>
      </div>
    </div>
  );
}

function AdminInfo() {
  const navigate = useNavigate();
  const [selectedAdmin, setSelectedAdmin] = useState(null);

  const handleInsertAdmin = () => {
    navigate('/dashboard/insert-admin/');
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
        <select className="search-select">
          <option value="name">이름</option>
          <option value="id">아이디</option>
          <option value="email">이메일</option>
          <option value="tel">전화번호</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>
     
      <div className="admin-cards-container">
        <div className="admin-cards">
          {adminData.map(admin => (
            <AdminCard key={admin.id} admin={admin} onClick={handleCardClick} />
          ))}
        </div>
        <div className="insert-admin-container" id='insert-admin-container'>
        <button className="insert-admin" onClick={handleInsertAdmin}>관리자 등록</button>
      </div>
      </div>
      {selectedAdmin && <Adminpopup admin={selectedAdmin} onClose={handleClosepopup} />}
    </div>
  );
}

export default AdminInfo;