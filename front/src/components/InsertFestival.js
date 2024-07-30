import '../css/InsertFestival.css';
import { useNavigate } from 'react-router-dom';
import React, { useState } from 'react';
import { useAuth } from './AuthContext';

function InsertFestival() {
  const [festivalName, setFestivalName] = useState(''); // 축제 이름 상태
  const [festivalStartDate, setFestivalStartDate] = useState(''); // 축제 시작일 상태
  const [festivalEndDate, setFestivalEndDate] = useState(''); // 축제 종료일 상태
  const [festivalAddress, setFestivalAddress] = useState(''); // 축제 주소 상태
  const [festivalArea, setFestivalArea] = useState(''); // 축제 지역 상태
  const [festivalImage, setFestivalImage] = useState(null); // 축제 이미지 파일 상태
  const [festivalSiteUrl, setFestivalSiteUrl] = useState(''); // 축제 사이트 URL 상태
  const [festivalType, setFestivalType] = useState(''); // 축제 타입 상태
  const [festivalTarget, setFestivalTarget] = useState(''); // 축제 대상 상태
  const [festivalFee, setFestivalFee] = useState(''); // 축제 요금 상태
  const [festivalHost, setFestivalHost] = useState(''); // 축제 주최 상태
  const [festivalAppdate, setFestivalAppdate] = useState(''); // 축제 예매일 상태
  const [festivalLat, setFestivalLat] = useState(''); // 축제 위도 상태
  const [festivalLong, setFestivalLong] = useState(''); // 축제 경도 상태
  const [festivalFree, setFestivalFree] = useState(''); // 축제 유료/무료 상태
  const [errors, setErrors] = useState({}); // 유효성 검사 오류 메시지 상태
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옴

  // 이미지 파일 선택 시 상태 업데이트 함수
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

  // 축제 등록 처리 함수
  const handleInsertFestival = async (e) => {
    e.preventDefault(); // 폼 제출 방지

    if (!validate()) {
      document.querySelector('.insert-festival-container').style.paddingTop = '160px';
      return; // 유효성 검사 실패 시 제출 중단
    }

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
        alert('축제 등록 완료');
        navigate('/menubar/festival');
      } else {
        alert('축제 등록 실패');
      }
    } catch (error) {
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

/*
 * 1. useState를 통해 입력된 축제 정보와 유효성 검사 오류 메시지를 상태로 저장.
 * 2. handleImageChange 함수에서 이미지 파일 선택 시 상태를 업데이트.
 * 3. validate 함수에서 각 입력 필드에 대한 유효성 검사를 수행하고 오류 메시지를 설정.
 * 4. handleInsertFestival 함수에서 유효성 검사를 통과한 경우 축제 등록을 위한 데이터를 서버에 전송.
 * 5. 축제 정보 입력 폼과 오류 메시지를 렌더링.
 */