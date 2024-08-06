package com.example.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.EVAPIService;

@RestController
@RequestMapping()
public class APIController {

    private final EVAPIService kakaoMapService;

    public APIController(EVAPIService kakaoMapService) {
        this.kakaoMapService = kakaoMapService;
    }
    
    // 길찾기
    @GetMapping("/directions")
    public String getDirections(@RequestParam String origin, @RequestParam String destination) {
        return kakaoMapService.getDirections(origin, destination);
    }
    
    // 주소 연결 페이지
    @GetMapping("/search")
    public String search(@RequestParam String query) {
        return kakaoMapService.searchKeyword(query);
    }
}