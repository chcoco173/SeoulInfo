import React, { useState, useEffect } from 'react';
import '../css/Charts.css';

function Charts() {
  const [query, setQuery] = useState('');
  const [activeTab, setActiveTab] = useState('중고거래');
  const [searchUrl, setSearchUrl] = useState('');
  const [renderKey, setRenderKey] = useState(0);

  const kibanaUrls = {
    중고거래: 'http://localhost:5601/app/dashboards#/view/3b7511b0-5092-11ef-8a59-db9d40d0c37d',
    축제: 'http://localhost:5601/app/dashboards#/view/c289ca40-53b9-11ef-b8bc-6959833928be',
    전기차: 'http://localhost:5601/app/dashboards#/view/a7b42a00-53d0-11ef-b8bc-6959833928be'
  };

  const getBaseUrl = (tab) => {
    return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&embed=true`;
  };

  const getSearchUrl = (tab, searchQuery) => {
    if (tab === '축제' && searchQuery.trim()) {
      return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'festival_area:"${searchQuery}"'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else if (tab === '전기차' && searchQuery.trim()) {
      return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'evc_area:"${searchQuery}" OR DISTRICT.keyword:"${searchQuery}" OR etc_area.keyword:"${searchQuery}"'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else if (searchQuery.trim()) {
      return `${kibanaUrls[tab]}?_g=(filters:!(),refreshInterval:(pause:!f,value:10000),time:(from:now-10y,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),query:(language:kuery,query:'${searchQuery}'),timeRestore:!f,title:'${tab} 차트',viewMode:!f)&embed=true`;
    } else {
      return getBaseUrl(tab);
    }
  };

  useEffect(() => {
    setSearchUrl(getBaseUrl(activeTab));
  }, [activeTab]);

  const handleSearch = (event) => {
    event.preventDefault();
    if (query.trim()) {
      setSearchUrl(getSearchUrl(activeTab, query));
    } else {
      setSearchUrl(getBaseUrl(activeTab));
      setRenderKey(prevKey => prevKey + 1);
    }
  };

  const handleKeyUp = (event) => {
    if (event.key === 'Enter') {
      handleSearch(event);
    }
  };

  const handleTabChange = (tab) => {
    setActiveTab(tab);
    setQuery('');
    setSearchUrl(getBaseUrl(tab));
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
            key={renderKey}
            title="Kibana Dashboard"
            src={searchUrl}
          ></iframe>
        )}
      </div>
    </div>
  );
}

export default Charts;
