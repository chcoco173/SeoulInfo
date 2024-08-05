package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.FestivalVO;

public interface FestivalService {

	// 지역별 축제 리스트
	public List<FestivalVO> getFestivalList(String area);

	public List<FestivalVO> getFestivalPaging(HashMap map);

	public int countItems(HashMap map);
	
	public Integer festivalViewCountUpdate(Integer festival_id);
	
	public Integer viewCountFestivalId(Integer festival_id);
	

}
