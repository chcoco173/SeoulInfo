import '../css/InsertFestival.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';
import { useAuth } from './AuthContext';

function InsertFestival() {
    const [festivalName, setFestivalName] = useState('');
    const [festivalStartDate, setFestivalStartDate] = useState('');
    const [festivalEndDate, setFestivalEndDate] = useState('');
    const [festivalAddress, setFestivalAddress] = useState('');
    const [festivalArea, setFestivalArea] = useState('');
    const [festivalImage, setFestivalImage] = useState(null);
    const [festivalSiteUrl, setFestivalSiteUrl] = useState('');
    const [festivalType, setFestivalType] = useState('');
    const [festivalTarget, setFestivalTarget] = useState('');
    const [festivalFee, setFestivalFee] = useState('');
    const [festivalHost, setFestivalHost] = useState('');
    const [festivalAppdate, setFestivalAppdate] = useState('');
    const [festivalLat, setFestivalLat] = useState('');
    const [festivalLong, setFestivalLong] = useState('');
    const [festivalFree, setFestivalFree] = useState('');
    const [errors, setErrors] = useState({}); // 유효성 검사 오류 메시지를 저장할 상태
    const navigate = useNavigate();
    const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옵니다.

    const handleImageChange = (e) => {
        setFestivalImage(e.target.files[0]);
    };

    // 유효성 검사 함수
    const validate = () => {
        const newErrors = {};
        if (!festivalName) newErrors.festivalName = '행사 이름을 입력해주세요.';
        if (!festivalStartDate) newErrors.festivalStartDate = '행사 시작일을 선택해주세요.';
        if (!festivalEndDate) newErrors.festivalEndDate = '행사 종료일을 선택해주세요.';
        if (!festivalAddress) newErrors.festivalAddress = '주소를 입력해주세요.';
        if (!festivalArea) newErrors.festivalArea = '지역을 선택해주세요.';
        if (!festivalImage) newErrors.festivalImage = '이미지를 선택해주세요.';
        if (!festivalSiteUrl) newErrors.festivalSiteUrl = '축제 사이트 URL을 입력해주세요.';
        if (!festivalType) newErrors.festivalType = '행사 타입을 입력해주세요.';
        if (!festivalTarget) newErrors.festivalTarget = '대상을 입력해주세요.';
        if (!festivalFee) newErrors.festivalFee = '요금을 입력해주세요.';
        if (!festivalHost) newErrors.festivalHost = '주최를 입력해주세요.';
        if (!festivalAppdate) newErrors.festivalAppdate = '예매일을 입력해주세요.';
        if (!festivalLat) newErrors.festivalLat = '위도를 입력해주세요.';
        if (!festivalLong) newErrors.festivalLong = '경도를 입력해주세요.';
        if (!festivalFree) newErrors.festivalFree = '유료 여부를 선택해주세요.';
        setErrors(newErrors); // 오류 메시지를 상태에 저장
        return Object.keys(newErrors).length === 0;
    };

    const handleInsertFestival = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        if (!validate()){
            
            document.querySelector('.insert-festival-container').style.paddingTop = '160px';
            
            return;} // 유효성 검사 실패 시 제출 중단

        const formData = new FormData();
        formData.append('festival_name', festivalName);
        formData.append('festival_area', festivalArea);
        formData.append('festival_loc', festivalAddress);
        formData.append('festival_startdate', festivalStartDate);
        formData.append('festival_enddate', festivalEndDate);
        formData.append('festival_target', festivalTarget);
        formData.append('festival_type', festivalType);
        formData.append('festival_fee', festivalFee);
        formData.append('festival_host', festivalHost);
        formData.append('festival_siteurl', festivalSiteUrl);
        formData.append('festival_image', festivalImage);
        formData.append('festival_appdate', festivalAppdate);
        formData.append('festival_lat', festivalLat);
        formData.append('festival_long', festivalLong);
        formData.append('festival_free', festivalFree);

        try {
            const response = await instance.post('/data/insert-festival', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            if (response.status >= 200 && response.status < 300) {
                console.log(response.data);
                alert('축제 등록 완료');
                navigate('/menubar/festival');
            } else {
                console.error('축제 등록 실패', response.statusText);
                alert('축제 등록 실패');
            }
        } catch (error) {
            console.error('에러 발생:', error);
            alert('에러 발생: ' + error.message);
        }
    };

    return (
        <div className="insert-festival-container">
            <form className="insert-festival-form" onSubmit={handleInsertFestival}>
                <h3>축제 등록</h3>
                <input
                    type="text"
                    placeholder="행사 이름"
                    name='festival_name'
                    value={festivalName}
                    onChange={(e) => setFestivalName(e.target.value)}
                />
                {errors.festivalName && <span className="error">{errors.festivalName}</span>}
                <input
                    type="text"
                    placeholder="행사 타입"
                    name='festival_type'
                    value={festivalType}
                    onChange={(e) => setFestivalType(e.target.value)}
                />
                {errors.festivalType && <span className="error">{errors.festivalType}</span>}
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
                {errors.festivalArea && <span className="error">{errors.festivalArea}</span>}
                <input
                    type="text"
                    placeholder="주소"
                    name='festival_loc'
                    value={festivalAddress}
                    onChange={(e) => setFestivalAddress(e.target.value)}
                />
                {errors.festivalAddress && <span className="error">{errors.festivalAddress}</span>}
                <span>
                    행사 시작일 : <input
                        type="date"
                        name='festival_startdate'
                        value={festivalStartDate}
                        onChange={(e) => setFestivalStartDate(e.target.value)}
                    /></span>
                {errors.festivalStartDate && <span className="error">{errors.festivalStartDate}</span>}
                <span>
                    행사 종료일 : <input
                        type="date"
                        name='festival_enddate'
                        value={festivalEndDate}
                        onChange={(e) => setFestivalEndDate(e.target.value)}
                    /></span>
                {errors.festivalEndDate && <span className="error">{errors.festivalEndDate}</span>}
                <input
                    type="text"
                    placeholder="요금"
                    name='festival_fee'
                    value={festivalFee}
                    onChange={(e) => setFestivalFee(e.target.value)}
                />
                {errors.festivalFee && <span className="error">{errors.festivalFee}</span>}
                <select
                    name='festival_free'
                    value={festivalFree}
                    onChange={(e) => setFestivalFree(e.target.value)}>
                    <option value="" disabled>유료여부선택</option>
                    <option value="무료">무료</option>
                    <option value="유료">유료</option>
                </select>
                {errors.festivalFree && <span className="error">{errors.festivalFree}</span>}
                <input
                    type="text"
                    placeholder="대상"
                    name='festival_target'
                    value={festivalTarget}
                    onChange={(e) => setFestivalTarget(e.target.value)}
                />
                {errors.festivalTarget && <span className="error">{errors.festivalTarget}</span>}
                <input
                    type="text"
                    placeholder="주최"
                    name='festival_host'
                    value={festivalHost}
                    onChange={(e) => setFestivalHost(e.target.value)}
                />
                {errors.festivalHost && <span className="error">{errors.festivalHost}</span>}
                <input
                    type="date"
                    placeholder="예매일"
                    name='festival_appdate'
                    value={festivalAppdate}
                    onChange={(e) => setFestivalAppdate(e.target.value)}
                />
                {errors.festivalAppdate && <span className="error">{errors.festivalAppdate}</span>}
                <input
                    type="text"
                    placeholder="위도"
                    name='festival_Lat'
                    value={festivalLat}
                    onChange={(e) => setFestivalLat(e.target.value)}
                />
                {errors.festivalLat && <span className="error">{errors.festivalLat}</span>}
                <input
                    type="text"
                    placeholder="경도"
                    name='festival_long'
                    value={festivalLong}
                    onChange={(e) => setFestivalLong(e.target.value)}
                />
                {errors.festivalLong && <span className="error">{errors.festivalLong}</span>}
                <input
                    type="text"
                    placeholder="축제 사이트 url"
                    name='festival_siteurl'
                    value={festivalSiteUrl}
                    onChange={(e) => setFestivalSiteUrl(e.target.value)}
                />
                {errors.festivalSiteUrl && <span className="error">{errors.festivalSiteUrl}</span>}
                <input
                    type="file"
                    name="festival_image"
                    accept="image/*"
                    onChange={handleImageChange}
                />
                {errors.festivalImage && <span className="error">{errors.festivalImage}</span>}
                <button type="submit">행사등록</button>
            </form>
        </div>
    );
}

export default InsertFestival;