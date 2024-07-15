package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.FestivalVO;

@Mapper
public interface FestivalDAO {
	
	public List<FestivalVO> getFestival(String area);
	

}
