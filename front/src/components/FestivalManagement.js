import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { format } from 'date-fns';
import '../css/FestivalManagement.css';

function FestivalCard({ festival, onClick }) {
  const StartDate = format(new Date(festival.festival_startdate), 'yyyy-MM-dd');
  const EndDate = format(new Date(festival.festival_enddate), 'yyyy-MM-dd');

  return (
    <div className="festival-card" onClick={() => onClick(festival)}>
      <img src={festival.festival_imageurl} className="festival-photo"/>
      <p className="festival-name">{festival.festival_name}</p>
      <p className="festival-area">{festival.festival_area}</p>
      <span className="festival-start">{StartDate} ~ </span><span className="festival-end">{EndDate}</span>
    </div>
  );
}
function Festivalpopup({ festival, onClose }) {
  const [editableFestival, setEditableFestival] = useState({ ...festival });
  const [isEditing, setIsEditing] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditableFestival((prevFestival) => ({
      ...prevFestival,
      [name]: value,
    }));
  };

  const handleUpdateFestival = () => {
    if (isEditing) {
      if (window.confirm('수정하시겠습니까?')) {
        // Update Festival logic here
        onClose();
      }
    } else {
      setIsEditing(true);
    }
  };

  const formatDate = (date) => {
    return date ? format(new Date(date), 'yyyy-MM-dd') : '';
  };

  const StartDate = formatDate(festival.festival_startdate);
  const EndDate = formatDate(festival.festival_enddate);
  

  return (
    
    <div className="popup">
      <div className="popup-content">
        <img src={festival.festival_imageurl} className="festival-photo" />
        <span className="close-button" onClick={onClose}>&times;</span>
        <p><strong>축제 제목 : </strong>{isEditing ? (
          <input
            type="text"
            name="name"
            value={editableFestival.festival_name}
            onChange={handleChange}
          />
        ) : (
            festival.festival_name
        )}</p>
        <span><strong>축제 기간 : </strong>{isEditing ? (
          <input
            type="date"
            name="festival_startdate"
            value={formatDate(editableFestival.festival_startdate)}
            onChange={handleChange}
          />
        ) : (
          StartDate
        )}</span><span> ~ </span>
        <span className="festival-end">{isEditing ? (
          <input
            type="date"
            name="festival_enddate"
            value={formatDate(editableFestival.festival_enddate)}
            onChange={handleChange}
          />
        ) : (
          EndDate
        )}</span>
        <p><strong>축제 지역 :</strong> {isEditing ? (
          <select             
          name="festival_address"
          value={editableFestival.festival_area}
          onChange={handleChange}>
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
        ) : (
            festival.festival_area
        )}</p>
        <p><strong>축제 주소 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_address"
            value={editableFestival.festival_address}
            onChange={handleChange}
          />
        ) : (
            festival.festival_address
        )}</p>
        <p><strong>축제 내용 :</strong> {isEditing ? (
          <textarea
            name="festival_content"
            value={editableFestival.festival_content}
            onChange={handleChange}
            rows="10"
          />
        ) : (
            festival.festival_content
        )}</p>
        <p><strong>축제 사이트 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_siteurl"
            value={editableFestival.festival_siteurl}
            onChange={handleChange}
          />
        ) : (
            <a href={festival.festival_siteurl}>축제 사이트로 이동</a>
        )}</p>
        <button className="update-festival" onClick={handleUpdateFestival}>
          {isEditing ? '저장' : '수정'}
        </button>
      </div>
    </div>
  );
}

function FestivalManagement() {
  const navigate = useNavigate();
  const [selectedFestival, setSelectedFestival] = useState(null);
  const [viewContent, setViewContent] = useState([]);
  const [page, setPage] = useState(0);
  const [isLoading, setIsLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const loadingRef = useRef(null);

  useEffect(() => {
    const loadMoreFestivals = async () => {
      if (isLoading || !hasMore) return;
      setIsLoading(true);

      try {
        const response = await axios.get(`http://localhost:8000/data/getallfestival?page=${page}`);
        if (response.data.length < 15) {
          setHasMore(false); // 데이터가 더 이상 없으면 추가 로드 중지
        }
        setViewContent(prev => [...prev, ...response.data]);
        setPage(prev => prev + 1);
      } catch (error) {
        console.error('Error fetching data:', error);
        setHasMore(false); // 에러 발생 시 데이터 로드 중단
      }
      setIsLoading(false);
    };

    const observer = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting && !isLoading && hasMore) {
        loadMoreFestivals();
      }
    }, { threshold: 1.0 });

    if (loadingRef.current) {
      observer.observe(loadingRef.current);
    }

    return () => observer.disconnect(); // 컴포넌트 언마운트 시 옵저버 해제
  }, [isLoading, hasMore]);

  const handleInsertFestival = () => {
    navigate('/dashboard/insert-festival/');
  };

  const handleCardClick = (festival) => {
    setSelectedFestival(festival);
  };

  const handleClosepopup = () => {
    setSelectedFestival(null);
  };


  return (
    <div className="festival-info">
      <h1>축제 관리</h1>
      <div className="search-section">
        <select className="search-select">
          <option value="festival_name">제목</option>
          <option value="festival_area">지역</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>

      <div className="festival-cards">
        {viewContent.map(festival => (
          <FestivalCard key={festival.festival_id} festival={festival} onClick={handleCardClick} />
        ))}
        <div ref={loadingRef} style={{ gridColumn: '1 / -1' }}></div>
      </div>

      {selectedFestival && <Festivalpopup festival={selectedFestival} onClose={handleClosepopup} />}

      <div className="insert-festival-container" id='insert-festival-container'>
        <button className="insert-festival" id='insert-festival' onClick={handleInsertFestival}>축제 등록</button>
      </div>
    </div>
  );
}

export default FestivalManagement;