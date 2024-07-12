package com.example.service;

import java.util.List;

import com.example.domain.FestivalVO;

public interface FestivalService {
	
	// 지역별 축제 리스트
	public List<FestivalVO> getFestivalList(String area);

}
