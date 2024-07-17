package com.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.EVStationDAO;
import com.example.domain.EVStationVO;

@Service
public class EVStationServiceImpl implements EVStationService{
	
	@Autowired
	private EVStationDAO evStationDAO;

	@Override
	public EVStationVO getStation(HashMap<String, Object> map) {
		
		return evStationDAO.getStation(map);
	}

}
