import React, { useState, useEffect } from 'react';
import '../css/Charts.css';

function Charts() {
  const [query, setQuery] = useState('');
  const [activeTab, setActiveTab] = useState('중고거래');
  const [currentPage, setCurrentPage] = useState(0);
  const [searchUrl, setSearchUrl] = useState('');
  const [renderKey, setRenderKey] = useState(0); // renderKey 상태 추가

  const kibanaUrls = {
    중고거래: [
      'http://localhost:5601/app/dashboards#/view/3b7511b0-5092-11ef-8a59-db9d40d0c37d',
      'http://localhost:5601/app/dashboards#/view/other-dashboard-url-1'
    ],
    축제: [
      'http://localhost:5601/app/dashboards#/view/c289ca40-53b9-11ef-b8bc-6959833928be',
      'http://localhost:5601/app/dashboards#/view/other-dashboard-url-2'
    ],
    전기차: [
      'http://localhost:5601/app/dashboards#/view/a7b42a00-53d0-11ef-b8bc-6959833928be',
      'http://localhost:5601/app/dashboards#/view/other-dashboard-url-3'
    ]
  };

  const getBaseUrl = (tab, page) => {
    return `${kibanaUrls[tab][page]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&embed=true`;
  };

  const getSearchUrl = (tab, page, searchQuery) => {
    if (tab === '축제' && searchQuery.trim()) {
      return `${kibanaUrls[tab][page]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'festival_area:"${searchQuery}"'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else if (tab === '전기차' && searchQuery.trim()) {
      return `${kibanaUrls[tab][page]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'evc_area:"${searchQuery}" OR DISTRICT.keyword:"${searchQuery}"'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else if (searchQuery.trim()) {
      return `${kibanaUrls[tab][page]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'${searchQuery}'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else {
      return getBaseUrl(tab, page);
    }
  };

  useEffect(() => {
    setSearchUrl(getBaseUrl(activeTab, currentPage));
  }, [activeTab, currentPage]);

  const handleSearch = (event) => {
    event.preventDefault();
    if (query.trim()) {
      setSearchUrl(getSearchUrl(activeTab, currentPage, query));
    } else {
      setSearchUrl(getBaseUrl(activeTab, currentPage));
      setRenderKey(prevKey => prevKey + 1); // renderKey 업데이트 (검색어가 없을 때만)
    }
  };

  const handleKeyUp = (event) => {
    if (event.key === 'Enter') {
      handleSearch(event);
    }
  };

  const handlePageChange = (index) => {
    setCurrentPage(index);
    if (query.trim()) {
      setSearchUrl(getSearchUrl(activeTab, index, query));
    } else {
      setSearchUrl(getBaseUrl(activeTab, index));
    }
  };

  const handleTabChange = (tab) => {
    setActiveTab(tab);
    setQuery('');
    setCurrentPage(0);
    setSearchUrl(getBaseUrl(tab, 0));
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
      <div className="search-bar">
        <form onSubmit={handleSearch}>
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            onKeyUp={handleKeyUp}
            placeholder="검색어를 입력하세요"
          />
          <button type="submit">검색</button>
        </form>
      </div>
      <div className="iframe-container">
        {searchUrl && (
          <iframe
            key={renderKey} // renderKey 사용
            title="Kibana Dashboard"
            src={searchUrl}
          ></iframe>
        )}
      </div>
      <div className="pagination">
        {kibanaUrls[activeTab].map((url, index) => (
          <button
            key={index}
            className={`page-button ${currentPage === index ? 'active' : ''}`}
            onClick={() => handlePageChange(index)}
          >
            {index + 1}
          </button>
        ))}
      </div>
    </div>
  );
}

export default Charts;
