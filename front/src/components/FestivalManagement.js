import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { format } from 'date-fns';
import '../css/FestivalManagement.css';

function FestivalCard({ festival, onClick }) {
  const StartDate = format(new Date(festival.fStartDate), 'yyyy-MM-dd');
  const EndDate = format(new Date(festival.fEndDate), 'yyyy-MM-dd');

  return (
    <div className="festival-card" onClick={() => onClick(festival)}>
      <img src={festival.fImageUrl} className="festival-photo"/>
      <p className="festival-name">{festival.fName}</p>
      <p className="festival-area">{festival.fArea}</p>
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

  const StartDate = format(new Date(festival.fStartDate), 'yyyy-MM-dd');
  const EndDate = format(new Date(festival.fEndDate), 'yyyy-MM-dd');
  

  return (
    
    <div className="popup">
      <div className="popup-content">
        <img src={festival.fImageUrl} className="festival-photo" />
        <span className="close-button" onClick={onClose}>&times;</span>
        <h2><strong>축제 제목 : </strong>{isEditing ? (
          <input
            type="text"
            name="name"
            value={editableFestival.fName}
            onChange={handleChange}
          />
        ) : (
            festival.fName
        )}</h2>
        <span><strong>축제 기간 : </strong>{isEditing ? (
          <input
            type="date"
            name="fStartDate"
            value={editableFestival.fStartDate}
            onChange={handleChange}
          />
        ) : (
          StartDate
        )}</span><span> ~ </span>
        <span className="festival-end">{isEditing ? (
          <input
            type="date"
            name="fEndDate"
            value={editableFestival.fEndDate}
            onChange={handleChange}
          />
        ) : (
          EndDate
        )}</span>
        <p><strong>축제 주소 :</strong> {isEditing ? (
          <input
            type="text"
            name="fAddress"
            value={editableFestival.fAddress}
            onChange={handleChange}
          />
        ) : (
            festival.fAddress
        )}</p>
        <p><strong>축제 내용 :</strong> {isEditing ? (
          <textarea
            name="fContent"
            value={editableFestival.fContent}
            onChange={handleChange}
            rows="10"
          />
        ) : (
            festival.fContent
        )}</p>
        <p><strong>축제 사이트 :</strong> {isEditing ? (
          <input
            type="text"
            name="fSiteUrl"
            value={editableFestival.fSiteUrl}
            onChange={handleChange}
          />
        ) : (
            <a href={festival.fSiteUrl}>축제 사이트로 이동</a>
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
          <option value="fName">제목</option>
          <option value="fArea">지역</option>
        </select>
        <input type="text" placeholder="검색" className="search-input" />
        <button className="search-button">검색</button>
      </div>

      <div className="festival-cards">
        {viewContent.map(festival => (
          <FestivalCard key={festival.fId} festival={festival} onClick={handleCardClick} />
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