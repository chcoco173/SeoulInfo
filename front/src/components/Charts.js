import React, { useState, useEffect, useRef } from 'react';
import '../css/Charts.css';

function Charts() {
  const [activeTab, setActiveTab] = useState('중고거래');
  const [selectedArea, setSelectedArea] = useState('전체');
  const [searchUrl, setSearchUrl] = useState('');
  const [renderKey, setRenderKey] = useState(0); // iframe을 새로 렌더링할 때 사용할 키
  const iframeRef = useRef(null);

  const areas = [
    '전체', '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', 
    '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', 
    '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'
  ];

  const kibanaUrls = {
    중고거래: 'http://localhost:5601/app/dashboards#/view/3b7511b0-5092-11ef-8a59-db9d40d0c37d',
    축제: 'http://localhost:5601/app/dashboards#/view/c289ca40-53b9-11ef-b8bc-6959833928be',
    전기차: 'http://localhost:5601/app/dashboards#/view/a7b42a00-53d0-11ef-b8bc-6959833928be'
  };

  const getBaseUrl = (tab) => {
    return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&embed=true`;
  };

  const getSearchUrl = (tab, area) => {
    if (area === '전체') {
      return getBaseUrl(tab);
    }

    let query = '';
    if (tab === '축제') {
      query = `festival_area:"${area}"`;
    } else if (tab === '전기차') {
      query = `evc_area:"${area}" OR DISTRICT.keyword:"${area}" OR etc_area.keyword:"${area}"`;
    } else {
      query = `${area}`;
    }

    return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'${query}'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
  };

  useEffect(() => {
    setSearchUrl(getBaseUrl(activeTab));
    setRenderKey(prevKey => prevKey + 1); // 탭을 변경할 때 iframe을 새로 렌더링
  }, [activeTab]);

  const handleSearch = () => {
    const newUrl = getSearchUrl(activeTab, selectedArea);
    if (selectedArea === '전체') {
      setSearchUrl(newUrl);
      setRenderKey(prevKey => prevKey + 1); // "전체" 선택 시 key 값을 변경하여 iframe을 새로 렌더링
    } else {
      setSearchUrl(newUrl);
      if (iframeRef.current) {
        iframeRef.current.src = newUrl; // 구 선택 시 src 속성만 업데이트
      }
    }
  };

  const handleTabChange = (tab) => {
    setActiveTab(tab);
    setSelectedArea('전체');
  };

  return (
    <div className="container">
      <header className="header">
        <h1>차트</h1>
      </header>
      <div className="tabs">
        {['중고거래', '축제', '전기차'].map((tab) => (
          <button
            key={tab}
            className={`tab ${activeTab === tab ? 'active' : ''}`}
            onClick={() => handleTabChange(tab)}
          >
            {tab}
          </button>
        ))}
      </div>
      <div className="search-bar" id="search-bar">
        <select
          value={selectedArea}
          onChange={(e) => setSelectedArea(e.target.value)}
        >
          {areas.map((area) => (
            <option key={area} value={area}>
              {area}
            </option>
          ))}
        </select>
        <button onClick={handleSearch}>검색</button>
      </div>
      <div className="iframe-container">
        {searchUrl && (
          <iframe
            key={renderKey} // renderKey 값을 사용하여 iframe을 새로 렌더링
            ref={iframeRef}
            title="Kibana Dashboard"
            src={searchUrl}
          ></iframe>
        )}
      </div>
    </div>
  );
}

export default Charts;