package com.example.service;

import java.util.List;

import com.example.domain.NewsVO;

public interface NewsService {
	
	// 지역별 뉴스 리스트
	public List<NewsVO> getNewsList(String area);
}
