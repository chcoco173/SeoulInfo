package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;

public interface EVStationService {

	public List<EVStationVO> getStation();

	public List<EVchargerVO> getFilteredStation(HashMap map);

	public List<EVStationVO> getStationDataInfo();

}
