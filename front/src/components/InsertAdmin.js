import '../css/InsertAdmin.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';

function InsertAdmin() {
    const [adminId, setAdminId] = useState('');
    const [adminPass, setAdminPass] = useState('');
    const [adminName, setAdminName] = useState('');
    const [adminTel, setAdminTel] = useState('');
    const [adminEmail, setAdminEmail] = useState('');
    const [adminImage, setAdminImage] = useState(null);
    const navigate = useNavigate();  
  
    const handleInsertAdmin = () => {
      // Logic to handle the admin registration can be added here

      navigate('/dashboard/admin-info/');
    };

    const handleImageChange = (e) => {
        setAdminImage(e.target.files[0]);
    };
  
    return (
        <div className="insert-admin-container">
            <div className="insert-admin-form">
                <h3>관리자 등록</h3>
                <input
                    type="text"
                    placeholder="아이디"
                    value={adminId}
                    onChange={(e) => setAdminId(e.target.value)}
                />
                <input
                    type="password"
                    placeholder="비밀번호"
                    value={adminPass}
                    onChange={(e) => setAdminPass(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="이름"
                    value={adminName}
                    onChange={(e) => setAdminName(e.target.value)}
                />
                <input
                    type="tel"
                    placeholder="전화번호"
                    value={adminTel}
                    onChange={(e) => setAdminTel(e.target.value)}
                />
                <input
                    type="email"
                    placeholder="이메일"
                    value={adminEmail}
                    onChange={(e) => setAdminEmail(e.target.value)}
                />
                <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageChange}
                />
                <button onClick={handleInsertAdmin}>관리자등록</button>
            </div>
        </div>
    );
}

export default InsertAdmin;