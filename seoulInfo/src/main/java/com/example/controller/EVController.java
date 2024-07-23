package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;
import com.example.service.EVStationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/ev")
public class EVController {
	
	@Autowired
	private EVStationService evStationService;
	
	// 충전소 지도 메인페이지 연결
	@RequestMapping("/{step}")
	public String EVMainPage(@PathVariable String step) {
		System.out.println("연결페이지"+step);
		return "/ev/"+step;
	}
	
	// 충전소 메인페이지 출력 시, DB에 저장된 정보 지도에 넘겨주기
	@RequestMapping("/evMain")
    public String getMapData(Model model) {
        List<EVStationVO> evStationList = evStationService.getStation();
        List<EVStationVO> DataInfo = evStationService.getStationDataInfo();
        //System.out.println(evStationList);
        
        model.addAttribute("evStationList", evStationList);
        model.addAttribute("evFilteredList", DataInfo);
        return "/ev/evMain";
    }
	
	// 1번 버튼 클릭 시, 충전기 출력 
	@RequestMapping("/filter1")
    public String getFilteredData(Model model) {
        
        
        
        return "/ev/evMain";
    }
	
	// 검색 결과
	 @GetMapping("/ev_search-filter")
	    public String findEVStation(
	        @RequestParam(name = "charger_type", required = true, defaultValue = "") String charger_type,
	        @RequestParam(name = "evc_area", required = true, defaultValue = "") String evc_area,
	        @RequestParam(name = "charger_opbig", required = true, defaultValue = "") String charger_opbig,
	        @RequestParam(name = "name", required = true, defaultValue = "") String name,
	        @RequestParam(name = "searchText", required = true, defaultValue = "") String searchText,
	        Model model
	    ) {
		 	HashMap map = new HashMap();
		 	map.put("charger_type", charger_type);
		 	map.put("evc_area", evc_area);
		 	map.put("charger_opbig", charger_opbig);
		 	map.put("name", name);
		 	map.put("searchText", searchText);
	        List<EVchargerVO> evo = evStationService.getFilteredStation(map);
	        
	        System.out.println("result : "+evo);
	        
	        return "/ev/evMain";
	    }
	
}