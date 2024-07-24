package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EVStationDAO;
import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;

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


}
