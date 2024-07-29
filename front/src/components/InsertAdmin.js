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
    const [errors, setErrors] = useState({}); // 유효성 검사 오류 메시지를 저장할 상태
    const navigate = useNavigate();
    const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.

    const handleImageChange = (e) => {
        setAdminImage(e.target.files[0]);
    };

    // 비밀번호 유효성 검사 함수
    const validatePassword = (password) => {
        const lengthValid = /^.{8,15}$/.test(password);
        const specialCharValid = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        const noFourSameDigits = !/(.)\1{3,}/.test(password);
        const noThreeConsecutiveDigits = !/(\d)\1\1/.test(password); // 동일한 숫자가 세 번 연속되는 경우 방지

        if (!lengthValid) return '비밀번호는 8에서 15글자 사이여야 합니다.';
        if (!specialCharValid) return '비밀번호는 특수문자 1개 이상 포함해야 합니다.';
        if (!noFourSameDigits) return '비밀번호에 같은 숫자를 4개 이상 사용할 수 없습니다.';
        if (!noThreeConsecutiveDigits) return '비밀번호에 동일한 숫자가 연속으로 세 번 이상 포함될 수 없습니다.';
        return null;
    };

    // 유효성 검사 함수
    const validate = () => {
        const newErrors = {};
        if (!adminId) newErrors.adminId = '아이디를 입력해주세요.';
        if (adminId && !/^[a-zA-Z0-9._-]{5,12}$/.test(adminId)) newErrors.adminId = '아이디는 5글자에서 12글자 사이여야 하며, 특수문자는 - _ . 만 사용할 수 있습니다.';
        if (!adminPass) {
            newErrors.adminPass = '비밀번호를 입력해주세요.';
        } else {
            const passwordError = validatePassword(adminPass);
            if (passwordError) newErrors.adminPass = passwordError;
        }
        if (!adminName) newErrors.adminName = '이름을 입력해주세요.';
        if (adminName && !/^[가-힣]{3,5}$/.test(adminName)) newErrors.adminName = '이름은 3글자에서 5글자 사이의 한글로 입력해주세요.';
        if (!adminTel) newErrors.adminTel = '전화번호를 입력해주세요.';
        if (adminTel && !/^\d{3}-\d{4}-\d{4}$/.test(adminTel)) newErrors.adminTel = '전화번호는 3글자-4글자-4글자 형식으로 입력해주세요.';
        if (!adminEmail) newErrors.adminEmail = '이메일을 입력해주세요.';
        if (adminEmail && !/\S+@\S+\.\S+/.test(adminEmail)) newErrors.adminEmail = '유효한 이메일을 입력해주세요.';
        if (!adminImage) newErrors.adminImage = '이미지를 선택해주세요.';
        setErrors(newErrors); // 오류 메시지를 상태에 저장
        return Object.keys(newErrors).length === 0;
    };

    const handleInsertAdmin = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        if (!validate()) return; // 유효성 검사 실패 시 제출 중단

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
                navigate('/menubar/admin-info/');
            } else {
                console.error('관리자 등록 실패', response.statusText);
                alert('관리자 등록 실패');
            }
        } catch (error) {
            console.error('에러 발생:', error);
            alert('에러 발생');
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
                {errors.adminId && <span className="error">{errors.adminId}</span>}
                <br/>
                <input
                    type="password"
                    placeholder="비밀번호"
                    name='adminPass'
                    value={adminPass}
                    onChange={(e) => setAdminPass(e.target.value)}
                />
                {errors.adminPass && <span className="error">{errors.adminPass}</span>}
                <br/>
                <input
                    type="text"
                    placeholder="이름"
                    name='adminName'
                    value={adminName}
                    onChange={(e) => setAdminName(e.target.value)}
                />
                {errors.adminName && <span className="error">{errors.adminName}</span>}
                <br/>
                <input
                    type="tel"
                    placeholder="전화번호"
                    value={adminTel}
                    onChange={(e) => setAdminTel(e.target.value)}
                />
                {errors.adminTel && <span className="error">{errors.adminTel}</span>}
                <br/>
                <input
                    type="email"
                    placeholder="이메일"
                    name='adminEmail'
                    value={adminEmail}
                    onChange={(e) => setAdminEmail(e.target.value)}
                />
                {errors.adminEmail && <span className="error">{errors.adminEmail}</span>}
                <br/>
                <input
                    type="file"
                    accept="image/*"
                    name='adminImage'
                    onChange={handleImageChange}
                />
                {errors.adminImage && <span className="error">{errors.adminImage}</span>}
                <br/>
                <button type="submit">관리자등록</button>
            </form>
        </div>
    );
}

export default InsertAdmin;