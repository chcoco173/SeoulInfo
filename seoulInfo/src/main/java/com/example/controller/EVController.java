package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.EVPlacesVO;
import com.example.domain.EVStationVO;
import com.example.domain.EVchargerVO;
import com.example.domain.MemberVO;
import com.example.service.EVStationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/ev")
public class EVController {
	
	@Autowired
	private EVStationService evStationService;
	
	// 충전소 페이지 연결
	@RequestMapping("/{step}")
	public String EVMainPage(@PathVariable String step) {
		System.out.println("연결페이지"+step);
		return "/ev/"+step;
	}
	
	// 충전소 메인페이지 - DB에 저장된 위치정보 지도에 넘겨주기
	@RequestMapping("/evMain")
    public String getMapData(Model model) {
        List<EVStationVO> evStationList = evStationService.getStation();
        model.addAttribute("evStationList", evStationList);
        return "/ev/evMain";
    }
	
	// 회원 위치정보 받아오기 
	@GetMapping("/getUserLocation")
	@ResponseBody
	public MemberVO getUserLocation(String member_id){
		MemberVO mvo = evStationService.getUserLocation(member_id);
		return mvo;
	}
	
	// 충전소 - 상세정보 출력 
	@GetMapping("/ev_info")
	@ResponseBody
	public List<EVchargerVO> getChargerInfo(@RequestParam("evc_id") String evc_id) {
		System.out.println("to getChargerInfo : "+evc_id);
		List<EVchargerVO> chargerInfo = evStationService.getStationDataInfo(evc_id);
		System.out.println("from getChargerInfo : "+chargerInfo);
		return chargerInfo;
	}
	 
	// 즐겨찾기 - list 불러오기
	 @GetMapping("/ev_Favorite")
	 @ResponseBody
	 public List<EVchargerVO> stroageChargerFav(String member_id ){
		 System.out.println("to favorite : "+member_id);
		 List<EVchargerVO> chargerlike = evStationService.selectEVFav(member_id);
		 System.out.println("from favorite : "+chargerlike);
		 return chargerlike;
	 }
	 
	 // 즐겨찾기 - 등록
	 @GetMapping("/ev_FavoriteInsert")
	 public String FavoriteInsert(String evc_id, String member_id ){
		 HashMap favMap = new HashMap();
		 favMap.put("evc_id", evc_id);
		 favMap.put("member_id", member_id);
		 evStationService.insertEVFav(favMap);
		 return "ev/ev_Favorite";
	 }

	 // 즐겨찾기 - 삭제
	 @GetMapping("/ev_FavoriteDelete")
	 public String FavoriteDelete(String evc_id, String member_id ){
		 HashMap delMap = new HashMap();
		 delMap.put("evc_id", evc_id);
		 delMap.put("member_id", member_id);
		 evStationService.deleteEVFav(delMap);
		 return "ev/ev_Favorite";
	 }

	// 충전소 검색 - 결과
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
	
	//원 반경 안의 편의시설 정보
	@GetMapping("/getCircleLocation")
	@ResponseBody
	public List<EVPlacesVO> getCircleInfo(double centerLat, double centerLng, double radius, String category){
		System.out.println("insert getCircleInfo : "+centerLat+","+centerLng+","+radius+category);
		HashMap<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("centerLat", centerLat);
		cmap.put("centerLng", centerLng);
		cmap.put("radius", radius);
		cmap.put("category", category);
		List<EVPlacesVO> pvo = evStationService.getCircleInfo(cmap);
		System.out.println("sent from getCircleInfo: " + pvo);
		return pvo;
	}
	
	//충전소 필터 정보
	@PostMapping("/getEvMarkers")
	@ResponseBody
	public List<EVStationVO> getEvMarkers(String operators, String types){
		System.out.println("insert getEvMarkers : "+operators+", "+types);
		HashMap<String, Object> mmap = new HashMap<String, Object>();
		mmap.put("operators", operators);
		mmap.put("types", types);
		List<EVStationVO> svo = evStationService.getEvMarkers(mmap);
		//System.out.println("sent from getEvMarkers: " + svo);
		return svo;
	}
	
	@PostMapping("/getNavMarker")
	@ResponseBody
	public List<EVStationVO> getNavMarker(double lat, double lon, double radius){
		System.out.println("insert getNavMarker : "+lat+", "+lon+", "+radius);
		HashMap<String, Object> tmap = new HashMap<String, Object>();
		tmap.put("lat", lat);
		tmap.put("lon", lon);
		tmap.put("radius", radius);
		List<EVStationVO> svo = evStationService.getNavMarker(tmap);
		System.out.println("sent from getNavMarker: " + svo);
		return svo;
	}
}