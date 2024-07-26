package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;

public interface EVStationService {
	// 처음 지도 마커를 위한 좌표 select
	public List<EVStationVO> getStation();
	
	// 충전소 필터링을 위한 정보 hashmap
	public List<EVchargerVO> getFilteredStation(HashMap map);

	// 충전소의 충전기 상세정보를 가져오기 위한 evc_id
	public List<EVchargerVO> getStationDataInfo(String evc_id);

	// 즐겨찾기에 data를 넣기위한 hashmap
	// public void insertEVFav(HashMap favMap);
	public void insertEVFav(String evc_id, String member_id);
	
	// 즐겨찾기 list up을 위한 hashmap
	public List<EVchargerVO> selectEVFav(String member_id);

	

}
