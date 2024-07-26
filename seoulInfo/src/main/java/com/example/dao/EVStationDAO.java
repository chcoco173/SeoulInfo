package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;

@Mapper
public interface EVStationDAO {
	
	public List<EVStationVO> getStation();

	public List<EVchargerVO> getFilteredStation(HashMap map);
	
	public List<EVchargerVO> getStationDataInfo(String evc_id);

	public void insertEVInfo(@Param("evc_id")String evc_id, @Param("member_id")String member_id);

	public List<EVchargerVO> selectEVFav(String member_id);

}
