package com.example.service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpEntity;

@Service
public class EVAPIService {

    @Value("${kakao.api.key}")
    private String kakaoApiKey;

    private final RestTemplate restTemplate;

    public EVAPIService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String getDirections(String origin, String destination) {
        String url = String.format("https://dapi.kakao.com/v2/maps/reversegeocode?query=%s", origin);
        return restTemplate.getForObject(url, String.class);
    }
    
    public String searchKeyword(String query) {
        String url = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + query;

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + kakaoApiKey);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return response.getBody();
    }
}