import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../css/EVManagement.css';
import '../css/EVCManagement.css';
import { useAuth } from './AuthContext';

function EVManagement() {
  const { instance } = useAuth();
  const [evData, setEvData] = useState([]); // 전기차 충전소 데이터 저장
  const [evcData, setEvcData] = useState([]); // 전기차 충전기 데이터 저장
  const [currentPage, setCurrentPage] = useState(0); // 전기차 충전소의 현재 페이지 번호 저장
  const [totalPages, setTotalPages] = useState(0); // 전기차 충전소 총 페이지 수 저장
  const [searchCategory, setSearchCategory] = useState('evc_name'); // 검색 카테고리 저장
  const [searchKeyword, setSearchKeyword] = useState(''); // 검색 키워드 저장
  const [currentPage2, setCurrentPage2] = useState(0); // 전기차 충전기 현재 페이지 번호 저장
  const [totalPages2, setTotalPages2] = useState(0); // 전기차 충전기 총 페이지 수 저장
  const [editEvId, setEditEvId] = useState(null); // 수정 중인 전기차 충전소 ID를 저장하는 상태
  const [editEvcId, setEditEvcId] = useState(null); // 수정 중인 전기차 충전기 ID를 저장하는 상태
  const [editEvData, setEditEvData] = useState({}); // 수정 중인 전기차 충전소 데이터를 저장하는 상태
  const [editEvcData, setEditEvcData] = useState({}); // 수정 중인 전기차 충전기 데이터를 저장하는 상태
  const navigate = useNavigate();

  useEffect(() => { // 컴포넌트가 마운트될 때 혹은 currentPage 또는 currentPage2가 변경될 때 호출
    getEVData(currentPage);
    getEvcData(currentPage2);
  }, [currentPage, currentPage2]);

  const getEVData = async (page) => { // 전기차 충전소 데이터를 가져오는 함수
    try {
      const params = { page };
      if (searchKeyword.trim() !== '') {
        params.category = searchCategory;
        params.keyword = searchKeyword;
      }

      const response = await instance.get('/data/getallev', { params });
      setEvData(response.data.ev);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('데이터 불러오기 에러:', error);
    }
  };

  const getEvcData = async (page) => { // 전기차 충전기 데이터를 가져오는 함수
    try {
      const response = await instance.get('/data/getallevc', {
        params: { page }
      });
      setEvcData(response.data.evc);
      setTotalPages2(response.data.totalPages2);
    } catch (error) {
      console.error('데이터 불러오기 에러:', error);
    }
  };

  const deleteEv = async (evc_id) => { // 전기차 충전소 데이터를 삭제하는 함수
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-ev/${evc_id}`);
        getEVData(currentPage); // 데이터만 새로고침
      } catch (error) {
        console.error('데이터 삭제 에러:', error);
      }
    }
  };

  const deleteEvc = async (charger_id) => { // 전기차 충전기 데이터를 삭제하는 함수
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-evc/${charger_id}`);
        getEvcData(currentPage2); // 데이터만 새로고침
      } catch (error) {
        console.error('데이터 삭제 에러:', error);
      }
    }
  };

  const handleInsertEv = () => { // 전기차 충전소 등록 페이지로 이동하는 함수
    navigate('/menubar/insert-ev/');
  };

  const handleInsertEvc = () => { // 전기차 충전기 등록 페이지로 이동하는 함수
    navigate('/menubar/insert-evc/');
  };

  const handlePageChange = (page) => { // 전기차 충전소 페이지 변경을 처리하는 함수
    setCurrentPage(page);
  };

  const handlePageChange2 = (page) => { // 전기차 충전기 페이지 변경을 처리하는 함수
    setCurrentPage2(page);
  };

  const handleSearch = async (page = 0) => { // 검색을 처리하는 함수
    try {
      const params = {
        category: searchCategory,
        keyword: searchKeyword,
        page
      };

      const res = await instance.get('/data/getallev', { params });
      setEvData(res.data.ev);
      setTotalPages(res.data.totalPages);
      setCurrentPage(page); // 검색 후에도 페이지 번호를 유지
    } catch (error) {
      console.error('검색 에러:', error);
    }
  };

  const handleEditEv = (ev) => { // 전기차 충전소 데이터를 수정 모드로 변경하는 함수
    setEditEvId(ev.evc_id);
    setEditEvData(ev);
  };

  const handleEditEvc = (evc) => { // 전기차 충전기 데이터를 수정 모드로 변경하는 함수
    setEditEvcId(evc.charger_id);
    setEditEvcData(evc);
  };

  const handleChangeEv = (e) => { // 전기차 충전소 데이터 수정 시 호출되는 함수
    const { name, value } = e.target;
    setEditEvData({ ...editEvData, [name]: value });
  };

  const handleChangeEvc = (e) => { // 전기차 충전기 데이터 수정 시 호출되는 함수
    const { name, value } = e.target;
    setEditEvcData({ ...editEvcData, [name]: value });
  };

  const handleSaveEv = async () => { // 전기차 충전소 데이터를 저장하는 함수
    const confirmSave = window.confirm("수정하시겠습니까?");
    if (confirmSave) {
      try {
        await instance.post('/data/update-ev', editEvData);
        setEditEvId(null);
        getEVData(currentPage);
      } catch (error) {
        console.error('데이터 저장 에러:', error);
      }
    }
  };

  const handleSaveEvc = async () => { // 전기차 충전기 데이터를 저장하는 함수
    const confirmSave = window.confirm("수정하시겠습니까?");
    if (confirmSave) {
      try {
        await instance.post('/data/update-evc', editEvcData);
        setEditEvcId(null);
        getEvcData(currentPage2);
      } catch (error) {
        console.error('데이터 저장 에러:', error);
      }
    }
  };

  const handleKeyPress = (e) => { // 검색 엔터 키를 눌렀을 때 검색 실행
    if (e.key === 'Enter') {
      handleSearch(0);
    }
  };

  const renderPageNumbers = () => { // 전기차 충전소의 페이지 번호 렌더링
    const pageNumbers = [];
    const maxPage = 10;
    const totalPageBlocks = Math.ceil(totalPages / maxPage);
    const currentBlock = Math.floor(currentPage / maxPage);
    
    const startPage = currentBlock * maxPage;
    const endPage = Math.min(startPage + maxPage, totalPages);

    if (currentBlock > 0) {
      pageNumbers.push(<button key="prev-block" onClick={() => handlePageChange(startPage - 1)}>&lt;</button>);
    }

    for (let i = startPage; i < endPage; i++) {
      pageNumbers.push(
        <button
          key={i}
          onClick={() => handlePageChange(i)}
          className={i === currentPage ? 'active' : ''}
        >
          {i + 1}
        </button>
      );
    }

    if (currentBlock < totalPageBlocks - 1) {
      pageNumbers.push(<button key="next-block" onClick={() => handlePageChange(endPage)}>&gt;</button>);
    }

    return pageNumbers;
  };

  const renderPageNumbers2 = () => { // 전기차 충전기 페이지 번호를 렌더링
    const pageNumbers2 = [];
    const maxPage2 = 10;
    const totalPageBlocks2 = Math.ceil(totalPages2 / maxPage2);
    const currentBlock2 = Math.floor(currentPage2 / maxPage2);
    
    const startPage2 = currentBlock2 * maxPage2;
    const endPage2 = Math.min(startPage2 + maxPage2, totalPages2);

    if (currentBlock2 > 0) {
      pageNumbers2.push(<button key="prev-block" onClick={() => handlePageChange2(startPage2 - 1)}>&lt;</button>);
    }

    for (let i = startPage2; i < endPage2; i++) {
      pageNumbers2.push(
        <button
          key={i}
          onClick={() => handlePageChange2(i)}
          className={i === currentPage2 ? 'active' : ''}
        >
          {i + 1}
        </button>
      );
    }

    if (currentBlock2 < totalPageBlocks2 - 1) {
      pageNumbers2.push(<button key="next-block" onClick={() => handlePageChange2(endPage2)}>&gt;</button>);
    }

    return pageNumbers2;
  };

  return (
    <div>
      <div className="ev-info">
        <h1>전기차 충전소 관리</h1>
        
        <div className="search-section">
          <select className="search-select" value={searchCategory} onChange={(e) => setSearchCategory(e.target.value)}>
            <option value="evc_name">이름</option>
            <option value="evc_area">지역</option>
          </select>
          <input 
            type="text" 
            placeholder="검색" 
            className="search-input" 
            value={searchKeyword} 
            onChange={(e) => setSearchKeyword(e.target.value)} 
            onKeyUp={handleKeyPress} // onKeyUp 이벤트 추가
          />
          <button className="search-button" onClick={() => handleSearch(0)}>검색</button>
        </div>
        <div className="insert-ev-container" id='insert-ev-container'>
          <button className="insert-ev" id='insert-ev' onClick={handleInsertEv}>충전소 등록</button>
        </div>
        <table className="ev-table">
          <thead>
            <tr>
              <th className='evc_name'>이름</th>
              <th className='evc_area'>지역</th>
              <th className='evc_address'>주소</th>
              <th className='evupdate'>수정</th>
              <th className='evdelete'>삭제</th>
            </tr>
          </thead>
          <tbody>
            {evData.map(ev => (
              <tr key={ev.evc_id}>
                <td className='evc_name'>
                  {editEvId === ev.evc_id ? (
                    <input
                      type="text"
                      name="evc_name"
                      value={editEvData.evc_name}
                      onChange={handleChangeEv}
                    />
                  ) : (
                    ev.evc_name
                  )}
                </td>
                <td className='evc_area'>
                  {editEvId === ev.evc_id ? (
                    <input
                      type="text"
                      name="evc_area"
                      value={editEvData.evc_area}
                      onChange={handleChangeEv}
                    />
                  ) : (
                    ev.evc_area
                  )}
                </td>
                <td className='evc_address'>
                  {editEvId === ev.evc_id ? (
                    <input
                      type="text"
                      name="evc_address"
                      value={editEvData.evc_address}
                      onChange={handleChangeEv}
                    />
                  ) : (
                    ev.evc_address
                  )}
                </td>
                <td className='evupdate'>
                  {editEvId === ev.evc_id ? (
                    <button className='evupdate-button' onClick={handleSaveEv}>확인</button>
                  ) : (
                    <button className='evupdate-button' onClick={() => handleEditEv(ev)}>수정</button>
                  )}
                </td>
                <td className='evdelete'>
                  <button className='evdelete-button' onClick={() => deleteEv(ev.evc_id)}>삭제</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <div className="pagination">
          {renderPageNumbers()}
        </div>
      </div>
      <br />
      <br />
      <br />
      <div className="charger-info">
        <h1>전기차 충전기 관리</h1>
        <div className="insert-ev-container" id='insert-ev-container'>
          <button className="insert-ev" id='insert-ev' onClick={handleInsertEvc}>충전기 등록</button>
        </div>
        <table className="charger-table">
          <thead>
            <tr>
              <th className='evc_name'>충전소이름</th>
              <th className='charger_id'>충전기번호</th>
              <th className='charger_type'>충전기타입</th>
              <th className='charger_userlimit'>충전기상태</th>
              <th className='charger_facsmall'>시설구분</th>
              <th className='charger-update'>수정</th>
              <th className='charger-delete'>삭제</th>
            </tr>
          </thead>
          <tbody>
            {evcData.map(evc => (
              <tr key={evc.charger_id}>
                <td className='evc_name'>
                  {editEvcId === evc.charger_id ? (
                    <input
                      type="text"
                      name="evc_name"
                      value={editEvcData.evc_name}
                      onChange={handleChangeEvc}
                      readOnly
                    />
                  ) : (
                    evc.evc_name
                  )}
                </td>
                <td className='charger_id'>
                  {editEvcId === evc.charger_id ? (
                    <input
                      type="text"
                      name="charger_id"
                      value={editEvcData.charger_id}
                      onChange={handleChangeEvc}
                    />
                  ) : (
                    evc.charger_id
                  )}
                </td>
                <td className='charger_type'>
                  {editEvcId === evc.charger_id ? (
                    <input
                      type="text"
                      name="charger_type"
                      value={editEvcData.charger_type}
                      onChange={handleChangeEvc}
                    />
                  ) : (
                    evc.charger_type
                  )}
                </td>
                <td className='charger_userlimit'>
                  {editEvcId === evc.charger_id ? (
                    <input
                      type="text"
                      name="charger_userlimit"
                      value={editEvcData.charger_userlimit}
                      onChange={handleChangeEvc}
                    />
                  ) : (
                    evc.charger_userlimit
                  )}
                </td>
                <td className='charger_facsmall'>
                  {editEvcId === evc.charger_id ? (
                    <input
                      type="text"
                      name="charger_facsmall"
                      value={editEvcData.charger_facsmall}
                      onChange={handleChangeEvc}
                    />
                  ) : (
                    evc.charger_facsmall
                  )}
                </td>
                <td className='charger-update'>
                  {editEvcId === evc.charger_id ? (
                    <button className='charger-update-button' onClick={handleSaveEvc}>확인</button>
                  ) : (
                    <button className='charger-update-button' onClick={() => handleEditEvc(evc)}>수정</button>
                  )}
                </td>
                <td className='charger-delete'>
                  <button className='charger-delete-button' onClick={() => deleteEvc(evc.charger_id)}>삭제</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <div className="pagination">
          {renderPageNumbers2()}
        </div>
      </div>
    </div>
  );
}

export default EVManagement;

/* 

1. EVManagement 컴포넌트 렌더링 시 useEffect를 통해 getEVData와 getEvcData 함수를 호출하여 데이터를 가져오고 상태에 저장
2. 사용자가 검색어를 입력한 뒤 검색 버튼을 클릭하거나 엔터키를 누를 시 handleSearch 함수 호출, 검색 결과에 따른 목록을 상태에 저장
3. 각 충전소 또는 충전기 데이터의 수정 버튼 클릭 시 handleEditEv 또는 handleEditEvc 함수 호출, 수정 모드로 전환
4. 수정 모드에서 데이터 변경 시 handleChangeEv 또는 handleChangeEvc 함수 호출, 변경된 데이터 상태에 저장
5. 수정 완료 후 확인 버튼 클릭 시 handleSaveEv 또는 handleSaveEvc 함수 호출, 변경된 데이터를 서버에 저장하고 상태 업데이트
6. 각 충전소 또는 충전기 데이터의 삭제 버튼 클릭 시 deleteEv 또는 deleteEvc 함수 호출, 해당 데이터를 서버에서 삭제하고 상태 업데이트
7. 페이지 번호 클릭 시 handlePageChange 또는 handlePageChange2 함수 호출, 해당 페이지의 데이터를 가져와 상태에 저장

*/