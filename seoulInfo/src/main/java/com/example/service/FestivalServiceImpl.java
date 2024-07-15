package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FestivalDAO;
import com.example.domain.FestivalVO;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private FestivalDAO festivalDAO;
	
	// 지역별 축제 리스트
	@Override
	public List<FestivalVO> getFestivalList(String area) {
		
		return festivalDAO.getFestival(area);
	}

}
