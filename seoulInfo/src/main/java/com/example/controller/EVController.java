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
        model.addAttribute("evStationList", evStationList);
        return "/ev/evMain";
    }
	
	 // 충전소의 충전기 내역 및 상세정보 출력 
	 @GetMapping("/ev_info")
	 @ResponseBody
	 public List<EVchargerVO> getChargerInfo(@RequestParam("evc_id") String evc_id) {
		 List<EVchargerVO> chargerInfo = evStationService.getStationDataInfo(evc_id);
	    return chargerInfo;
	 }
	 
	// 즐겨찾기 설정 - list 불러오기
	 @GetMapping("/ev_Favorite")
	 @ResponseBody
	 public List<EVchargerVO> stroageChargerFav(String member_id ){
		 System.out.println("insert : "+member_id);
		 
		 List<EVchargerVO> chargerlike = evStationService.selectEVFav(member_id);
		 System.out.println("send : "+ chargerlike);
		 return chargerlike;
	 }
	 
	 @GetMapping("/ev_FavoriteInsert")
	 public String showChargerInfo(String evc_id, String member_id ){
		 System.out.println("insert : "+evc_id+","+member_id);
		 //HashMap favMap = new HashMap();
		 //favMap.put("evc_id",evc_id);
		 //favMap.put("member_id",member_id);
		 evStationService.insertEVFav(evc_id,member_id);
		 System.out.println("fav data inserted");
		 return "ev/ev_Favorite";
	 }

	 
	 
	 
	 
	// 충전소 검색 결과
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
	    return evo;
	}
	    

}