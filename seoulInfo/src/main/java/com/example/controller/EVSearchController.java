package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.EVStationVO;
import com.example.service.EVStationService;

//import com.example.service.EVStationService;

@RestController
@RequestMapping("/ev")
public class EVSearchController {
	
	@Autowired
	private EVStationService evStationService;
	
	@GetMapping("/ev_MapFilter")
		public String findEVStation(
			@RequestParam(name = "type", required = true, defaultValue = "all") String type,
			@RequestParam(name = "area", required = true, defaultValue = "all") String area,
			@RequestParam(name = "loc", required = true, defaultValue = "all") String loc,
			@RequestParam(name = "name", required = true, defaultValue = "all") String name,
			@RequestParam(name = "name_detail", required = true, defaultValue = "null") String nameDetail
		) {
	       // 여기서는 간단히 로그를 출력하여 파라미터가 정상적으로 전달되는지 확인
	       System.out.println("type: " + type);
	       System.out.println("area: " + area);
	       System.out.println("loc: " + loc);
	       System.out.println("name: " + name);
	       System.out.println("name_detail: " + nameDetail);
	        
	       // 여기에 검색 로직을 구현하고, 검색 결과를 이용해 적절한 뷰로 리다이렉트하거나 포워드합니다.
	       HashMap<String, Object> map = new HashMap<>();
	       map.put("type", type);
	       map.put("area", area);
	       map.put("loc", loc);
	       map.put("name", name);
	       map.put("name_detail", nameDetail);
	       
	       
	       
	       EVStationVO evo = evStationService.getStation(map);
	       System.out.println(evo.toString());
	       
	       return "result = "+type+","+area+","+loc+","+name+","+nameDetail+"..";
	   }
}
