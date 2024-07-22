package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EVStationDAO;
import com.example.domain.EVStationVO;

@Service
public class EVStationServiceImpl implements EVStationService{
	
	@Autowired
	private EVStationDAO evStationDAO;

	@Override
	public List<EVStationVO> getStation() {
		
		return evStationDAO.getStation();
	}
	
	@Override
	public List<EVStationVO> getFilteredStation(HashMap map){
		
		return evStationDAO.getFilteredStation(map);
		
	}

	@Override
	public List<EVStationVO> getStationDataInfo() {
		return evStationDAO.getStationDataInfo();
	}


}
