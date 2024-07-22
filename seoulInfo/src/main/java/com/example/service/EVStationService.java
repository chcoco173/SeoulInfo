package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.EVStationVO;

public interface EVStationService {

	public List<EVStationVO> getStation();

	public List<EVStationVO> getFilteredStation(HashMap map);

	public List<EVStationVO> getStationDataInfo();

}
