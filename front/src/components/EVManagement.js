import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../css/EVManagement.css';
import '../css/EVCManagement.css';
import { useAuth } from './AuthContext';

function EVManagement() {
  const { instance } = useAuth(); // AuthContext에서 axios 인스턴스 가져오기
  const [evData, setEvData] = useState([]);
  const [evcData, setEvcData] = useState([]);
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [searchCategory, setSearchCategory] = useState('evcName');
  const [searchKeyword, setSearchKeyword] = useState('');
  const [currentPage2, setCurrentPage2] = useState(0);
  const [totalPages2, setTotalPages2] = useState(0);
  const [editingEvId, setEditingEvId] = useState(null);
  const [editingEvcId, setEditingEvcId] = useState(null);
  const [editEvData, setEditEvData] = useState({});
  const [editEvcData, setEditEvcData] = useState({});
  const navigate = useNavigate();

  useEffect(() => {
    if (searchKeyword) {
      handleSearch(currentPage);
    } else {
      fetchEvData(currentPage);
    }
    fetchEvcData(currentPage2);
  }, [currentPage, currentPage2]);

  const fetchEvData = async (page) => {
    try {
      const response = await instance.get('/data/getallev', {
        params: { page }
      });
      setEvData(response.data.ev);
      setTotalPages(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching ev data:', error);
    }
  };

  const fetchEvcData = async (page) => {
    try {
      const response = await instance.get('/data/getallevc', {
        params: { page }
      });
      setEvcData(response.data.evc);
      setTotalPages2(response.data.totalPages);
    } catch (error) {
      console.error('Error fetching evc data:', error);
    }
  };

  const deleteEv = async (evc_id) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-ev/${evc_id}`);
        fetchEvData(currentPage); // 데이터만 새로고침
      } catch (error) {
        console.error('Error deleting ev:', error);
      }
    }
  };

  const deleteEvc = async (charger_id) => {
    const confirmDelete = window.confirm("삭제하시겠습니까?");
    if (confirmDelete) {
      try {
        await instance.delete(`/data/delete-evc/${charger_id}`);
        fetchEvcData(currentPage2);
      } catch (error) {
        console.error('Error deleting evc:', error);
      }
    }
  };

  const handleInsertEv = () => {
    navigate('/dashboard/insert-ev/');
  };

  const handleInsertEvc = () => {
    navigate('/dashboard/insert-evc/');
  };

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const handlePageChange2 = (page) => {
    setCurrentPage2(page);
  };

  const handleSearch = async (page = 0) => {
    try {
      const res = await instance.get('/data/search-ev', {
        params: {
          category: searchCategory,
          keyword: searchKeyword,
          page
        }
      });
      setEvData(res.data.ev);
      setTotalPages(res.data.totalPages);
      setCurrentPage(page); // 검색 후에도 페이지 번호를 유지
    } catch (error) {
      console.error('검색 실패:', error);
    }
  };

  const handleEditEv = (ev) => {
    setEditingEvId(ev.evc_id);
    setEditEvData(ev);
  };

  const handleEditEvc = (evc) => {
    setEditingEvcId(evc.charger_id);
    setEditEvcData(evc);
  };

  const handleChangeEv = (e) => {
    const { name, value } = e.target;
    setEditEvData({ ...editEvData, [name]: value });
  };

  const handleChangeEvc = (e) => {
    const { name, value } = e.target;
    setEditEvcData({ ...editEvcData, [name]: value });
  };

  const handleSaveEv = async () => {
    const confirmSave = window.confirm("수정하시겠습니까?");
    if (confirmSave) {
      try {
        await instance.post('/data/update-ev', editEvData);
        setEditingEvId(null);
        fetchEvData(currentPage);
      } catch (error) {
        console.error('Error saving ev:', error);
      }
    }
  };

  const handleSaveEvc = async () => {
    const confirmSave = window.confirm("수정하시겠습니까?");
    if (confirmSave) {
      try {
        await instance.post('/data/update-evc', editEvcData);
        setEditingEvcId(null);
        fetchEvcData(currentPage2);
      } catch (error) {
        console.error('Error saving evc:', error);
      }
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      handleSearch(0);
    }
  };

  const renderPageNumbers = () => {
    const pageNumbers = [];
    const maxPagesToShow = 10;
    const totalPageBlocks = Math.ceil(totalPages / maxPagesToShow);
    const currentBlock = Math.floor(currentPage / maxPagesToShow);
    
    const startPage = currentBlock * maxPagesToShow;
    const endPage = Math.min(startPage + maxPagesToShow, totalPages);

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

  const renderPageNumbers2 = () => {
    const pageNumbers2 = [];
    const maxPagesToShow2 = 10;
    const totalPageBlocks2 = Math.ceil(totalPages2 / maxPagesToShow2);
    const currentBlock2 = Math.floor(currentPage2 / maxPagesToShow2);
    
    const startPage2 = currentBlock2 * maxPagesToShow2;
    const endPage2 = Math.min(startPage2 + maxPagesToShow2, totalPages2);

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
            <option value="evcName">이름</option>
            <option value="evcArea">지역</option>
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
                  {editingEvId === ev.evc_id ? (
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
                  {editingEvId === ev.evc_id ? (
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
                  {editingEvId === ev.evc_id ? (
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
                  {editingEvId === ev.evc_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
                  {editingEvcId === evc.charger_id ? (
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
