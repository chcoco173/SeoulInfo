package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.EVStationVO;

@Mapper
public interface EVStationDAO {
	
	public List<EVStationVO> getStation();

	public List<EVStationVO> getFilteredStation(HashMap map);
	
	public List<EVStationVO> getStationDataInfo();


}
