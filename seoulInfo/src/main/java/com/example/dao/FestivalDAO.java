package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.FestivalVO;

@Mapper
public interface FestivalDAO {
	
	public List<FestivalVO> getFestivalList(String area);
	
	public List<FestivalVO> getFestivalPaging(HashMap map);
	
	public int countItems(HashMap map);

	
	
	

}
