package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.dao.EVStationDAO;
import com.example.domain.EVPlacesVO;
import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;
import com.example.domain.MemberVO;

@Service
public class EVStationServiceImpl implements EVStationService{
	
	@Autowired
	private EVStationDAO evStationDAO;

	@Override
	public List<EVStationVO> getStation() {
		return evStationDAO.getStation();
	}
	
	@Override
	public List<EVchargerVO> getFilteredStation(HashMap map){
		return evStationDAO.getFilteredStation(map);
	}

	@Override
	public List<EVchargerVO> getStationDataInfo(String evc_id) {
		return evStationDAO.getStationDataInfo(evc_id);
	}

	@Override
	public void insertEVFav(HashMap favMap) {
		evStationDAO.insertEVFav(favMap);
	}

	@Override
	public List<EVchargerVO> selectEVFav(String member_id) {
		
		return evStationDAO.selectEVFav(member_id);
	}

	@Override
	public void deleteEVFav(HashMap delMap) {
		evStationDAO.deleteEVFav(delMap);
	}

	@Override
	public MemberVO getUserLocation(String member_id) {
		return evStationDAO.getUserLocation(member_id);
	}

	@Override
	public List<EVPlacesVO> getCircleInfo(HashMap<String, Object> cmap) {
		return evStationDAO.getCircleInfo(cmap);
	}

}
