import React, { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import { format } from 'date-fns';
import '../css/FestivalManagement.css';
import { useAuth } from './AuthContext';

// 개별 행사 카드를 표시하는 컴포넌트
function FestivalCard({ festival, onClick }) {
  const imagePath = festival.festival_imageurl && festival.festival_imageurl.startsWith('http') 
    ? festival.festival_imageurl 
    : `http://localhost:8000${festival.festival_imageurl || ''}`; // 이미지 경로 설정
  const StartDate = format(new Date(festival.festival_startdate), 'yyyy-MM-dd');
  const EndDate = format(new Date(festival.festival_enddate), 'yyyy-MM-dd');

  return (
    <div className="festival-card" onClick={() => onClick(festival)}>
      <img src={imagePath} className="festival-photo" alt={festival.festival_name} />
      <p className="festival-name">{festival.festival_name}</p>
      <p className="festival-area">{festival.festival_area}</p>
      <span className="festival-start">{StartDate} ~ </span><span className="festival-end">{EndDate}</span>
    </div>
  );
}

// 개별 행사 정보를 수정 및 삭제할 수 있는 팝업 컴포넌트
function Festivalpopup({ festival, onClose }) {
  const { instance } = useAuth(); 
  const [editFestival, setEditFestival] = useState({ ...festival }); // 수정 행사 데이터 저장
  const [isEditing, setIsEditing] = useState(false); // 편집 모드
  const [selectedFile, setSelectedFile] = useState(null); // 선택된 파일 저장

  // 입력 필드 변경 시 호출되는 함수
  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditFestival((prevFestival) => ({
      ...prevFestival,
      [name]: value,
    }));
  };

  // 파일 선택 시 호출되는 함수
  const handleFileChange = (e) => {
    setSelectedFile(e.target.files[0]);
  };

  // 행사를 수정하는 함수
  const handleUpdateFestival = async () => {
    if (isEditing) {
      if (window.confirm('수정하시겠습니까?')) {
        const formData = new FormData();
        formData.append('festival_id', editFestival.festival_id);
        formData.append('festival_name', editFestival.festival_name);
        formData.append('festival_area', editFestival.festival_area);
        formData.append('festival_address', editFestival.festival_loc);
        formData.append('festival_host', editFestival.festival_host);
        formData.append('festival_fee', editFestival.festival_fee);
        formData.append('festival_target', editFestival.festival_target);
        formData.append('festival_type', editFestival.festival_type);
        formData.append('festival_startdate', editFestival.festival_startdate);
        formData.append('festival_enddate', editFestival.festival_enddate);
        formData.append('festival_siteurl', editFestival.festival_siteurl);
        if (selectedFile) {
          formData.append('festival_image', selectedFile);
        }

        try {
          const response = await instance.post('/data/update-festival', formData, {
            headers: {
              'Content-Type': 'multipart/form-data'
            }
          });
          if (response.status === 200) {
            alert('행사 수정 완료');
            onClose();
            window.location.reload();
          } else {
            alert('행사 수정 실패');
          }
        } catch (error) {
          alert('행사 수정 실패');
        }
      }
    } else {
      setIsEditing(true);
    }
  };

  // 행사 삭제
  const handleDeleteFestival = (festivalId) => {
    if (window.confirm('삭제하시겠습니까?')) {
      instance.delete(`/data/delete-festival/${festivalId}`, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(response => {
          if (response.status === 200) {
            alert('행사 정보 삭제 완료');
            onClose();
            window.location.reload();
          } else {
            alert('행사정보 삭제 실패');
          }
        })
        .catch();
    }
  };

  // 날짜를 형식에 맞게 변환
  const formatDate = (date) => {
    return date ? format(new Date(date), 'yyyy-MM-dd') : '';
  };

  const imagePath = festival.festival_imageurl && festival.festival_imageurl.startsWith('http') 
    ? festival.festival_imageurl 
    : `http://localhost:8000${festival.festival_imageurl || ''}`;
  const StartDate = formatDate(festival.festival_startdate);
  const EndDate = formatDate(festival.festival_enddate);
  
  return (
    <div className="popup">
      <div className="popup-content">
        <img src={imagePath} className="festival-photo" alt={festival.festival_name} />
        <span className="close-button" onClick={onClose}>&times;</span>
        <input
          type="hidden"
          name="festival_id"
          value={festival.festival_id}
        />
        <p><strong>행사 제목 : </strong>{isEditing ? (
          <input
            type="text"
            name="festival_name"
            value={editFestival.festival_name}
            onChange={handleChange}
          />
        ) : (
            festival.festival_name
        )}</p>
        <p><strong>행사 타입 : </strong>{isEditing ? (
          <input
            type="text"
            name="festival_type"
            value={editFestival.festival_type}
            onChange={handleChange}
          />
        ) : (
            festival.festival_type
        )}</p>
        <span><strong>행사 기간 : </strong>{isEditing ? (
          <input
            type="date"
            name="festival_startdate"
            value={formatDate(editFestival.festival_startdate)}
            onChange={handleChange}
          />
        ) : (
          StartDate
        )}</span><span> ~ </span>
        <span className="festival-end">{isEditing ? (
          <input
            type="date"
            name="festival_enddate"
            value={formatDate(editFestival.festival_enddate)}
            onChange={handleChange}
          />
        ) : (
          EndDate
        )}</span>
        <p><strong>지역 :</strong> {isEditing ? (
          <select             
            name="festival_area"
            value={editFestival.festival_area}
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
        <p><strong>주소 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_address"
            value={editFestival.festival_loc}
            onChange={handleChange}
          />
        ) : (
            festival.festival_loc
        )}</p>
        <p><strong>관람 대상 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_target"
            value={editFestival.festival_target}
            onChange={handleChange}
          />
        ) : (
            festival.festival_target
        )}</p>
        <p><strong>관람 요금 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_fee"
            value={editFestival.festival_fee}
            onChange={handleChange}
          />
        ) : (
            festival.festival_fee
        )}</p>
        <p><strong>주최 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_host"
            value={editFestival.festival_host}
            onChange={handleChange}
          />
        ) : (
            festival.festival_host
        )}</p>
        <p><strong>행사 사이트 :</strong> {isEditing ? (
          <input
            type="text"
            name="festival_siteurl"
            value={editFestival.festival_siteurl}
            onChange={handleChange}
          />
        ) : (
            <a href={festival.festival_siteurl}>행사 사이트로 이동</a>
        )}</p>
        {isEditing && (
          <div>
            <strong>대표 이미지:</strong> 
            <input type="file" name="festival_image" onChange={handleFileChange}/>
          </div>
        )}
        <button className="update-festival" onClick={handleUpdateFestival}>
          {isEditing ? '저장' : '수정'}
        </button>
        <button className="delete-festival" onClick={() => handleDeleteFestival(festival.festival_id)}>
          삭제
        </button>
      </div>
    </div>
  );
}

// 행사 관리 컴포넌트
function FestivalManagement() {
  const navigate = useNavigate();
  const { instance } = useAuth();
  const [selectedFestival, setSelectedFestival] = useState(null); // 선택된 행사 저장
  const [festivalView, setFestivalView] = useState([]); // 모든 행사 저장
  const [searchResults, setSearchResults] = useState([]); // 검색 결과 저장
  const [searching, setSearching] = useState(false); // 검색 중인지 여부 저장
  const [page, setPage] = useState(0); // 현재 페이지 저장
  const [isLoading, setIsLoading] = useState(false); // 로딩 여부 저장
  const [hasMore, setHasMore] = useState(true); // 더 많은 데이터를 로드할 수 있는지 여부 저장
  const loadingRef = useRef(null); // 무한 스크롤 ref
  const [searchCategory, setSearchCategory] = useState('festival_name'); // 검색 카테고리 저장
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드 저장

  // 초기 및 상태 변경 시 데이터를 불러오는 useEffect
  useEffect(() => {
    if (!searching) {
      const loadMoreFestivals = async () => {
        if (isLoading || !hasMore) return;
        setIsLoading(true);

        try {
          const response = await instance.get(`/data/getallfestival?page=${page}`);
          if (response.data.length < 15) {
            setHasMore(false);
          }
          setFestivalView(prev => [...prev, ...response.data]);
          setPage(prev => prev + 1);
        } catch (error) {
          setHasMore(false);
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

      return () => observer.disconnect();
    }
  }, [isLoading, hasMore, searching]);

  // 행사 등록 페이지로 이동하는 함수
  const handleInsertFestival = () => {
    navigate('/menubar/insert-festival/');
  };

  // 검색을 처리하는 함수
  const handleSearch = async () => {
    setSearching(true);
    try {
      const res = await instance.get('/data/search-festival', {
        params: {
          category: searchCategory,
          keyword: searchKeyword
        }
      });
      const processedResults = res.data.map(festival => {
        // 이미지 경로 처리
        if (festival.festival_imageurl && !festival.festival_imageurl.startsWith('http')) {
          festival.festival_imageurl = `http://localhost:8000${festival.festival_imageurl}`;
        }
        return festival;
      });
      setSearchResults(processedResults);
    } catch (error) {
    }
  };

  // 검색 입력 필드에서 엔터 키를 눌렀을 때 검색을 실행
  const handleEnter = (e) => {
    if (e.key === 'Enter') {
      handleSearch();
    }
  };

  // 행사 카드를 클릭했을 때 호출되는 함수
  const handleCardClick = (festival) => {
    setSelectedFestival(festival);
  };

  // 팝업을 닫는 함수
  const handleClosepopup = () => {
    setSelectedFestival(null);
  };

  // `searching` 상태에 따라 검색 결과 또는 전체 행사를 표시
  const searchOrNot = searching ? searchResults : festivalView;

  return (
    <div className="festival-info">
      <h1>행사 관리</h1>

      <div className="search-section">
        <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
          <option value="festival_name">제목</option>
          <option value="festival_area">지역</option>
        </select>
        <input 
          type="text" 
          placeholder="검색" 
          className="search-input" 
          value={searchKeyword} 
          onChange={(e) => setSearchKeyword(e.target.value)}
          onKeyUp={handleEnter}
        />
        <button className="search-button" onClick={handleSearch}>검색</button>
      </div>
      <div className="insert-festival-container" id='insert-festival-container'>
        <button className="insert-festival" id='insert-festival' onClick={handleInsertFestival}>행사 등록</button>
      </div>
      <div className="festival-cards">
        {searchOrNot.map(festival => (
          <FestivalCard key={festival.festival_id} festival={festival} onClick={handleCardClick} />
        ))}
        {!searching && <div ref={loadingRef} style={{ gridColumn: '1 / -1' }}></div>}
      </div>

      {selectedFestival && <Festivalpopup festival={selectedFestival} onClose={handleClosepopup} />}

    </div>
  );
}

export default FestivalManagement;

/*

1. 컴포넌트가 마운트시 useEffect를 통해 데이터를 불러옴
2. 무한 스크롤을 구현하기 위해 IntersectionObserver를 설정
3. 사용자가 페이지를 아래로 스크롤하면 데이터들을 로딩하고 데이터가 끝날때까지 반복함
4. 사용자가 검색어를 입력하고 엔터 키를 누르면 handleEnter 함수가 호출되어 handleSearch를 통해 검색이 수행됨 검색 결과는 searchResults 상태에 저장되며, searching 상태를 true로 설정하여 검색 결과를 보여줌.
5. 사용자가 행사 카드를 클릭하면 handleCardClick 함수가 호출되어 selectedFestival 상태에 해당 행사 정보를 저장. selectedFestival 상태가 설정되면 팝업 표시.
6. 팝업에서 사용자가 수정 버튼을 클릭하면 handleUpdateFestival 함수가 호출되어 행사 수정.
7. 사용자가 삭제 버튼을 클릭하면 handleDeleteFestival 함수가 호출되어 행사 삭제.
8. 사용자가 "행사 등록" 버튼을 클릭하면 handleInsertFestival 함수가 호출되어 행사 등록 페이지로 이동.

*/