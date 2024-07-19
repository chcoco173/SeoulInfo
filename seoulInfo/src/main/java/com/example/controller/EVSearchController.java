package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.EVStationDAO;
import com.example.domain.EVStationVO;
import com.example.service.EVStationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/ev")
public class EVSearchController {
	
	@Autowired
	private EVStationService evStationService;
	
	  
    @GetMapping("/ev_MapFilter")
    public String findEVStation(
        @RequestParam(name = "type", required = true, defaultValue = "all") String type,
        @RequestParam(name = "area", required = true, defaultValue = "all") String area,
        @RequestParam(name = "loc", required = true,  defaultValue = "all") String loc,
        @RequestParam(name = "name", required = true, defaultValue = "all") String name,
        @RequestParam(name = "name_detail", required = true, defaultValue = "null") String nameDetail,
        Model model
    ) {
        // ... (기존 코드)
        
        List<EVStationVO> evo = evStationService.getStation();
        
        // JSON으로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String evStationsJson;
		try {
			evStationsJson = objectMapper.writeValueAsString(evo);
			 model.addAttribute("evStationsJson", evStationsJson);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "evmain";
    }
}