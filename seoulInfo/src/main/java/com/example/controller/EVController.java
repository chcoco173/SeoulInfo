package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        //System.out.println(evStationList);
        
        model.addAttribute("evStationList", evStationList);
        return "/ev/evMain";
    }
	
	 // 1번 버튼 클릭 시, 충전기 출력 
	 @PostMapping("/getChargerInfo")
	 @ResponseBody
	 public List<EVchargerVO> getChargerInfo(@RequestParam("evc_id") String evc_id) {
	    // id를 사용하여 데이터베이스에서 충전소 정보를 조회합니다.
	    // 예시: EVchargerVO chargerInfo = evStationService.getChargerById(id);
		 List<EVchargerVO> chargerInfo = evStationService.getStationDataInfo(evc_id);
		 System.out.println("evo = "+chargerInfo);
	    return chargerInfo;
	 }

	// 검색 결과
	@PostMapping("/ev_MapFilter")
	@ResponseBody
	public List<EVchargerVO> findEVStation(
	    @RequestParam(name = "charger_type", required = false) 	String charger_type,
	    @RequestParam(name = "evc_area", required = false) 		String evc_area,
	    @RequestParam(name = "charger_opbig", required = false) String charger_opbig,
	    @RequestParam(name = "name", required = false) 			String name,
	    @RequestParam(name = "searchText", required = false) 	String searchText
	) {
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("charger_type", charger_type);
	    map.put("evc_area", evc_area);
	    map.put("charger_opbig", charger_opbig);
	    map.put("name", name);
	    map.put("searchText", searchText);
	    
	    List<EVchargerVO> evo = evStationService.getFilteredStation(map);
	    System.out.println("evo = "+evo.toString());
	    return evo;
	}
	    

}