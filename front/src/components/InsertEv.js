import '../css/InsertEV.css';
import { useNavigate } from 'react-router-dom';
import React, { useState } from 'react';
import { useAuth } from './AuthContext';

function InsertEv() {
  const [evId, setEvId] = useState(''); // 충전소 아이디 상태
  const [evArea, setEvArea] = useState(''); // 지역 상태
  const [evAddress, setEvAddress] = useState(''); // 충전소 주소 상태
  const [evName, setEvName] = useState(''); // 충전소 이름 상태
  const [evLat, setEvLat] = useState(''); // 위도 상태
  const [evLong, setEvLong] = useState(''); // 경도 상태
  const [errors, setErrors] = useState({}); // 유효성 검사 오류 메시지 상태
  const navigate = useNavigate(); // 페이지 이동을 위한 navigate 함수
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스를 가져옴

  // 유효성 검사 함수
  const validate = () => {
    const newErrors = {};
    if (!evId) newErrors.evId = '충전소 아이디를 입력해주세요.';
    if (!evArea) newErrors.evArea = '지역을 선택해주세요.';
    if (!evAddress) newErrors.evAddress = '충전소 주소를 입력해주세요.';
    if (!evName) newErrors.evName = '충전소 이름을 입력해주세요.';
    if (!evLat) newErrors.evLat = '위도를 입력해주세요.';
    if (!evLong) newErrors.evLong = '경도를 입력해주세요.';
    setErrors(newErrors); // 오류 메시지를 상태에 저장
    return Object.keys(newErrors).length === 0;
  };

  // 충전소 등록 처리 함수
  const handleInsertEv = async (e) => {
    e.preventDefault(); // 폼 제출 방지

    if (!validate()) return; // 유효성 검사 실패 시 제출 중단

    try {
      const response = await instance.post('/data/insert-ev', {
        evc_id: evId,
        evc_area: evArea,
        evc_address: evAddress,
        evc_name: evName,
        evc_lat: evLat,
        evc_long: evLong
      }, {
        headers: {
          'Content-Type': 'application/json'
        }
      });
      if (response.status >= 200 && response.status < 300) {
        alert('충전소 등록 완료');
        navigate('/menubar/ev');
      } else {
        alert('충전소 등록 실패');
      }
    } catch (error) {
      console.error(error);
      alert('충전소 등록 중 오류가 발생했습니다.');
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
        {errors.evId && <span className="error">{errors.evId}</span>}
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
        {errors.evArea && <span className="error">{errors.evArea}</span>}
        <input
          type="text"
          placeholder="충전소 주소"
          name='evc_address'
          value={evAddress}
          onChange={(e) => setEvAddress(e.target.value)}
        />
        {errors.evAddress && <span className="error">{errors.evAddress}</span>}
        <input
          type="text"
          placeholder="충전소 이름"
          name='evc_name'
          value={evName}
          onChange={(e) => setEvName(e.target.value)}
        />
        {errors.evName && <span className="error">{errors.evName}</span>}
        <input
          type="text"
          placeholder="위도"
          name='evc_lat'
          value={evLat}
          onChange={(e) => setEvLat(e.target.value)}
        />
        {errors.evLat && <span className="error">{errors.evLat}</span>}
        <input
          type="text"
          placeholder="경도"
          name='evc_long'
          value={evLong}
          onChange={(e) => setEvLong(e.target.value)}
        />
        {errors.evLong && <span className="error">{errors.evLong}</span>}
        <button type="submit">충전소 등록</button>
      </form>
    </div>
  );
}

export default InsertEv;

/*
 * 1. useState를 통해 입력된 충전소 정보와 유효성 검사 오류 메시지를 상태로 저장합니다.
 * 2. validate 함수에서 각 입력 필드에 대한 유효성 검사를 수행하고 오류 메시지를 설정합니다.
 * 3. handleInsertEv 함수에서 유효성 검사를 통과한 경우 충전소 등록을 위한 데이터를 서버에 전송합니다.
 * 4. 충전소 정보 입력 폼과 오류 메시지를 렌더링합니다.
 */