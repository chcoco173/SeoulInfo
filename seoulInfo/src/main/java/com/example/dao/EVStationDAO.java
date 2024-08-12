package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.EVPlacesVO;
import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;
import com.example.domain.MemberVO;

@Mapper
public interface EVStationDAO {
	
	public List<EVStationVO> getStation();

	public List<EVchargerVO> getFilteredStation(HashMap map);
	
	public List<EVchargerVO> getStationDataInfo(HashMap infomap);

	public List<EVchargerVO> selectEVFav(String member_id);

	public void insertEVFav(HashMap favMap);

	public void deleteEVFav(HashMap delMap);

	public MemberVO getUserLocation(String member_id);

	public List<EVPlacesVO> getCircleInfo(HashMap<String, Object> cmap);
	
	public List<EVStationVO> getEvMarkers(HashMap<String, Object> mmap);

	public List<EVStationVO> getNavMarker(HashMap<String, Object> tmap);

}
