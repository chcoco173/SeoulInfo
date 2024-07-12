import '../css/InsertFestival.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';
import axios from 'axios';

function InsertFestival() {
    const [festivalName, setFestivalName] = useState('');
    const [festivalStartDate, setFestivalStartDate] = useState('');
    const [festivalEndDate, setFestivalEndDate] = useState('');
    const [festivalAddress, setFestivalAddress] = useState('');
    const [festivalArea, setFestivalArea] = useState('');
    const [festivalImage, setFestivalImage] = useState(null);
    const [festivalSiteUrl, setFestivalSiteUrl] = useState('');
    const [festivalContent, setFestivalContent] = useState('');
    const navigate = useNavigate();  
  

    const handleImageChange = (e) => {
        setFestivalImage(e.target.files[0]);
    };

    const handleInsertfestival = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        const data = {
            festival_name: festivalName,
            festival_area: festivalArea,
            festival_address: festivalAddress,
            festival_startdate: festivalStartDate,
            festival_enddate: festivalEndDate,
            festival_content: festivalContent,
            festival_siteurl: festivalSiteUrl
        };

        console.log(data);
        axios.post(
            'http://localhost:8000/data/insert-festival',
            data,
            {
                headers: {
                    'Content-Type': 'application/json'
                }
            }
        )
        .then(response => {
            if (response === 'success') {
                console.log(response.data);
                alert('축제 등록 완료');
                navigate('/dashboard/festival');
                
            } else {
                console.error('축제 등록 실패', response.statusText);
                alert('축제 등록 실패');
            }
        })
        .catch(error => {
            console.error('에러 발생:', error);
        });
    };
    
    return (
        <div className="insert-festival-container">
            <form className="insert-festival-form" onSubmit={handleInsertfestival}>
                <h3>축제 등록</h3>
                <input
                    type="text"
                    placeholder="축제 이름"
                    name='festival_name'
                    value={festivalName}
                    onChange={(e) => setFestivalName(e.target.value)}
                />
                <select
                    name='festival_area'
                    value={festivalArea}
                    onChange={(e) => setFestivalArea(e.target.value)}>
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
                    placeholder="축제 주소"
                    name='festival_address'
                    value={festivalAddress}
                    onChange={(e) => setFestivalAddress(e.target.value)}
                />
                <span>
                    축제 시작일 : <input
                        type="date"
                        name='festival_startdate'
                        value={festivalStartDate}
                        onChange={(e) => setFestivalStartDate(e.target.value)}
                    /></span>
                <span>
                    축제 종료일 : <input
                        type="date"
                        name='festival_enddate'
                        value={festivalEndDate}
                        onChange={(e) => setFestivalEndDate(e.target.value)}
                    /></span>
                <textarea
                    placeholder="축제 내용"
                    name='festival_content'
                    value={festivalContent}
                    onChange={(e) => setFestivalContent(e.target.value)}
                    rows="10"
                />
                <br />
                <input
                    type="text"
                    placeholder="축제 사이트 url"
                    name='festival_siteurl'
                    value={festivalSiteUrl}
                    onChange={(e) => setFestivalSiteUrl(e.target.value)}
                />
                <input
                    type="file"
                    name="festival_imageurl"
                    accept="image/*"
                    onChange={handleImageChange}
                />
                <button type="submit">축제등록</button>
            </form>
        </div>
    );
}


export default InsertFestival;