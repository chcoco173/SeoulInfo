package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.EVStationVO;
import com.example.service.EVStationService;

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
	
}