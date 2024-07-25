import '../css/InsertAdmin.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';
import { useAuth } from './AuthContext';

function InsertAdmin() {
    const [adminId, setAdminId] = useState('');
    const [adminPass, setAdminPass] = useState('');
    const [adminName, setAdminName] = useState('');
    const [adminTel, setAdminTel] = useState('');
    const [adminEmail, setAdminEmail] = useState('');
    const [adminImage, setAdminImage] = useState(null);
    const navigate = useNavigate();
    const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.

    const handleImageChange = (e) => {
        setAdminImage(e.target.files[0]);
    };

    const handleInsertAdmin = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        const formData = new FormData();
        formData.append('admin_id', adminId);
        formData.append('admin_pw', adminPass);
        formData.append('admin_name', adminName);
        formData.append('admin_tel', adminTel);
        formData.append('admin_email', adminEmail);
        formData.append('admin_image', adminImage);

        try {
            const response = await instance.post(
                '/data/insert-admin',
                formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }
            );
            if (response.status >= 200 && response.status < 300) {
                console.log(response.data);
                alert('관리자 등록 완료');
                navigate('/dashboard/admin-info/');
            } else {
                console.error('관리자 등록 실패', response.statusText);
                alert('관리자 등록 실패');
            }
        } catch (error) {
            console.error('에러 발생:', error);
        }
    };

    return (
        <div className="insert-admin-container">
            <form className="insert-festival-form" onSubmit={handleInsertAdmin}>
                <h3>관리자 등록</h3>
                <input
                    type="text"
                    placeholder="아이디"
                    name='adminId'
                    value={adminId}
                    onChange={(e) => setAdminId(e.target.value)}
                />
                <input
                    type="password"
                    placeholder="비밀번호"
                    name='adminPass'
                    value={adminPass}
                    onChange={(e) => setAdminPass(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="이름"
                    name='adminName'
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
                    name='adminEmail'
                    value={adminEmail}
                    onChange={(e) => setAdminEmail(e.target.value)}
                />
                <input
                    type="file"
                    accept="image/*"
                    name='adminImage'
                    onChange={handleImageChange}
                />
                <button type="submit">관리자등록</button>
            </form>
        </div>
    );
}

export default InsertAdmin;