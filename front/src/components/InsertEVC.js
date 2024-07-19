import '../css/InsertEVC.css';
import { useNavigate } from 'react-router-dom'; 
import React, { useState } from 'react';
import axios from 'axios';

function InsertEVC() {
    const [evcId, setEvcId] = useState('');
    const [chargerNo, setChargerNo] = useState('');
    const [chargerType, setChargerType] = useState([]);
    const [chargerUserLimit, setChargerUserLimit] = useState('');
    const [chargerFacbig, setChargerFacbig] = useState('');
    const [chargerFacsmall, setChargerFacsmall] = useState('');
    const [chargerMechcine, setChargerMechcine] = useState('');
    const [chargerOpbig, setChargerOpbig] = useState('');
    const [chargerOpsmall, setChargerOpsmall] = useState('');
    const navigate = useNavigate();  

    const handleCheckboxChange = (e) => {
        const value = e.target.value;
        setChargerType((prev) => {
            if (prev.includes(value)) {
                return prev.filter((item) => item !== value);
            } else {
                if (prev.length === 2) {
                    return [...prev.slice(1), value];
                }
                return [...prev, value];
            }
        });
    };

    const handleInsertEv = async (e) => {
        e.preventDefault(); // 폼 제출 방지

        const formData = new FormData();
        formData.append('evc_id', evcId);
        formData.append('charger_no', chargerNo);
        formData.append('charger_type', chargerType.join(' + '));
        formData.append('charger_userlimit', chargerUserLimit);
        formData.append('charger_facbig', chargerFacbig);
        formData.append('charger_facsmall', chargerFacsmall);
        formData.append('charger_mechcine', chargerMechcine);
        formData.append('charger_opbig', chargerOpbig);
        formData.append('charger_opsmall', chargerOpsmall);

        try {
            const response = await axios.post('http://localhost:8000/data/insert-evc', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            if (response.status >= 200 && response.status < 300) {
                console.log(response.data);
                alert('충전기 등록 완료');
                navigate('/dashboard/ev');
            } else {
                console.error('충전기 등록 실패', response.statusText);
                alert('충전기 등록 실패');
            }
        } catch (error) {
            console.error('에러 발생:', error);
            alert('에러 발생: ' + error.message);
        }
    };

    return (
        <div className="insert-ev-container">
            <form className="insert-ev-form" onSubmit={handleInsertEv}>
                <h3>충전기 등록</h3>
                <input
                    type="text"
                    placeholder="충전소 아이디"
                    name='evc_id'
                    value={evcId}
                    onChange={(e) => setEvcId(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="충전기 번호"
                    name='charger_no'
                    value={chargerNo}
                    onChange={(e) => setChargerNo(e.target.value)}
                />
                <select
                    name='charger_userlimit'
                    value={chargerUserLimit}
                    onChange={(e) => setChargerUserLimit(e.target.value)}>
                    <option value="" disabled>이용가능여부</option>
                    <option value="이용가능">이용가능</option>
                    <option value="이용자제한">이용자제한</option>
                </select>
                 <label name="charging">충전기 타입</label><br/>
                <label>
                    <input
                        type="checkbox"
                        name="charging"
                        value="AC완속"
                        checked={chargerType.includes('AC완속')}
                        onChange={handleCheckboxChange}
                    /> AC완속
                </label><br/>
                <label>
                    <input
                        type="checkbox"
                        name="charging"
                        value="DC차데모"
                        checked={chargerType.includes('DC차데모')}
                        onChange={handleCheckboxChange}
                    /> DC차데모
                </label><br/>
                <label>
                    <input
                        type="checkbox"
                        name="charging"
                        value="AC3상"
                        checked={chargerType.includes('AC3상')}
                        onChange={handleCheckboxChange}
                    /> AC3상
                </label><br/>
                <label>
                    <input
                        type="checkbox"
                        name="charging"
                        value="DC콤보"
                        checked={chargerType.includes('DC콤보')}
                        onChange={handleCheckboxChange}
                    /> DC콤보
                </label><br/>
    <select
                    name='charger_facbig'
                    value={chargerFacbig}
                    onChange={(e) => setChargerFacbig(e.target.value)}>
                    <option value="" disabled>충전기시설대분류</option>
                    <option value="상업시설">상업시설</option>
                    <option value="주차시설">주차시설</option>
                    <option value="관광시설">주차시설</option>
                    <option value="공동주택시설">공동주택시설</option>
                    <option value="공공시설">공공시설</option>
                    <option value="근린생활시설">근린생활시설</option>
                    <option value="교육문화시설">교육문화시설</option>
                    <option value="차량정비시설">차량정비시설</option>
                    <option value="차량정비시설">휴게시설</option>
                    <option value="기타">기타</option>
                </select>
                <select
                    name='charger_facsmall'
                    value={chargerFacsmall}
                    onChange={(e) => setChargerFacsmall(e.target.value)}>
                    <option value="" disabled>충전기시설소분류</option>
                    <option value="마트(쇼핑몰)">마트(쇼핑몰)</option>
                    <option value="백화점">백화점</option>
                    <option value="일반주차장">일반주차장</option>
                    <option value="공영주차장">공영주차장</option>
                    <option value="환승주차장">환승주차장</option>
                    <option value="병원">병원</option>
                    <option value="서비스센터">서비스센터</option>
                    <option value="교육원">교육원</option>
                    <option value="관공서">관공서</option>
                    <option value="관람장">관람장</option>
                    <option value="공연장">공연장</option>
                    <option value="박물관">박물관</option>
                    <option value="주민센터">주민센터</option>
                    <option value="복지관">복지관</option>
                    <option value="경찰서">경찰서</option>
                    <option value="도서관">도서관</option>
                    <option value="관공서">관광지</option>
                    <option value="주유소">주유소</option>
                    <option value="공중전화부스">공중전화부스</option>
                    <option value="고속도로 휴게소">고속도로 휴게소</option>
                    <option value="숙박시설">숙박시설</option>
                    <option value="아파트">아파트</option>
                    <option value="연립주택">연립주택</option>
                    <option value="골프장(CC)">골프장(CC)</option>
                    <option value="공공기관">공공기관</option>
                    <option value="금융기관">금융기관</option>
                    <option value="지자체시설">지자체시설</option>
                    <option value="학교">학교</option>
                    <option value="오피스텔">오피스텔</option>
                    <option value="종교시설">종교시설</option>
                    <option value="영화관">영화관</option>
                    <option value="사업장(사옥)">사업장(사옥)</option>
                </select>
                <select
                    name='charger_mechcine'
                    value={chargerMechcine}
                    onChange={(e) => setChargerMechcine(e.target.value)}>
                    <option value="" disabled>충전기상태선택</option>
                    <option value="급속">급속</option>
                    <option value="완속">완속</option>
                </select>
                <select
                    name='charger_opbig'
                    value={chargerOpbig}
                    onChange={(e) => setChargerOpbig(e.target.value)}>
                    <option value="" disabled>기관대분류선택</option>
                    <option value="환경부">환경부</option>
                    <option value="타기관">타기관</option>
                    <option value="타기관(보조금)">타기관(보조금)</option>
                </select>
                <select
                    name='charger_opsmall'
                    value={chargerOpsmall}
                    onChange={(e) => setChargerOpsmall(e.target.value)}>
                    <option value="" disabled>기관소분류선택</option>
                    <option value="휴맥스이브이">휴맥스이브이</option>
                    <option value="현대자동차">현대자동차</option>
                    <option value="현대오일뱅크">현대오일뱅크</option>
                    <option value="현대엔지니어링">현대엔지니어링</option>
                    <option value="한국전자금융">한국전자금융</option>
                    <option value="한국전력">한국전력</option>
                    <option value="환경부(협회)">환경부(협회)</option>
                </select>
                <button type="submit">충전기등록</button>
            </form>
            {chargerType.length === 2 && (
                <div className="result">
                    {chargerType.join(' + ')}
                </div>
            )}
        </div>
    );
}

export default InsertEVC;