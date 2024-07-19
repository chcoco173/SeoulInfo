import '../css/InsertEV.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';
import axios from 'axios';

function InsertEv() {
    const [evId, setEvId] = useState('');
    const [evArea, setEvArea] = useState('');
    const [evAddress, setEvAddress] = useState('');
    const [evName, setEvName] = useState('');
    const [evLat, setEvLat] = useState('');
    const [evLong, setEvLong] = useState('');
    const navigate = useNavigate();  


    const handleInsertEv = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        const formData = new FormData();
        formData.append('evc_id', evId);
        formData.append('evc_area', evArea);
        formData.append('evc_address', evAddress);
        formData.append('evc_name', evName);
        formData.append('evc_lat', evLat);
        formData.append('evc_long', evLong);

        try {
            const response = await axios.post('http://localhost:8000/data/insert-ev', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            if (response.status >= 200 && response.status < 300) {
                console.log(response.data);
                alert('충전소 등록 완료');
                navigate('/dashboard/ev');
            } else {
                console.error('충전소 등록 실패', response.statusText);
                alert('충전소 등록 실패');
            }
        } catch (error) {
            console.error('에러 발생:', error);
            alert('에러 발생: ' + error.message);
        }
    };

    return (
        <div className="insert-ev-container">
            <form className="insert-ev-form" onSubmit={handleInsertEv}>
                <h3>충전소 등록</h3>
                <input
                    type="text"
                    placeholder="충전소 아이디"
                    name='evc_id'
                    value={evId}
                    onChange={(e) => setEvId(e.target.value)}
                />
                <select
                    name='evc_area'
                    value={evArea}
                    onChange={(e) => setEvArea(e.target.value)}>
                    <option value="" disabled>지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강동구">강동구</option>
                    <option value="강북구">강북구</option>
                    <option value="강서구">강서구</option>
                    <option value="관악구">관악구</option>
                    <option value="광진구">광진구</option>
                    <option value="구로구">구로구</option>
                    <option value="금천구">금천구</option>
                    <option value="노원구">노원구</option>
                    <option value="도봉구">도봉구</option>
                    <option value="동대문구">동대문구</option>
                    <option value="동작구">동작구</option>
                    <option value="마포구">마포구</option>
                    <option value="서대문구">서대문구</option>
                    <option value="서초구">서초구</option>
                    <option value="성동구">성동구</option>
                    <option value="성북구">성북구</option>
                    <option value="송파구">송파구</option>
                    <option value="양천구">양천구</option>
                    <option value="영등포구">영등포구</option>
                    <option value="용산구">용산구</option>
                    <option value="은평구">은평구</option>
                    <option value="종로구">종로구</option>
                    <option value="중구">중구</option>
                    <option value="중랑구">중랑구</option>
                </select>
                <input
                    type="text"
                    placeholder="충전소 주소"
                    name='evc_address'
                    value={evAddress}
                    onChange={(e) => setEvAddress(e.target.value)}
                />
                  <input
                    type="text"
                    placeholder="충전소 이름"
                    name='evc_name'
                    value={evName}
                    onChange={(e) => setEvName(e.target.value)}
                />
                  <input
                    type="text"
                    placeholder="위도"
                    name='evc_lat'
                    value={evLat}
                    onChange={(e) => setEvLat(e.target.value)}
                />
                  <input
                    type="text"
                    placeholder="경도"
                    name='evc_long'
                    value={evLong}
                    onChange={(e) => setEvLong(e.target.value)}
                />
                <button type="submit">충전소등록</button>
            </form>
        </div>
    );
}

export default InsertEv;