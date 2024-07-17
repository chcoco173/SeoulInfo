package com.example.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.EVStationVO;

@Mapper
public interface EVStationDAO {
	public EVStationVO getStation(HashMap<String, Object> map);

}
