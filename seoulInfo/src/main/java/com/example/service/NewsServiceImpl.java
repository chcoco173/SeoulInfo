package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NewsDAO;
import com.example.domain.NewsVO;

@Service
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDAO newsDAO;
	
	// 지역별 뉴스 리스트
	@Override
	public List<NewsVO> getNewsList(String area) {
		return newsDAO.getNews(area);
	}
	
	// 해당 기사 상세 조회
    @Override
    public NewsVO getNewsById(Integer news_id) {
        return newsDAO.getNewsById(news_id);
    }
}
