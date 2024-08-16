package com.example.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
import com.example.service.EVAPIService;

@RestController
@RequestMapping("/ev")
@CrossOrigin(origins="http://localhost:8080")
public class APIController {

	// 충전소 실시간 정보
    @GetMapping("/getTest")
    public ResponseEntity<String> getTest(){
    	System.out.println("insert getTest - Public API data ");
    	 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/EvCharger/getChargerStatus"); /*URL*/
    	 StringBuilder sb = new StringBuilder();
    	 String responseData = sb.toString();
    	 try {
	         urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=kAJ2C7P882QkBX3GKJDyW7LWEZ5jSgryOknlWTsdqByd3Y0ol4UExSd1GTmrIeGpq2PYdyDaouJ%2FXqj%2BaXJ00Q%3D%3D"); /*Service Key*/
	         urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 		 /*페이지 번호*/
	         urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("9999", "UTF-8")); /*한 페이지 결과 수 (최소 10, 최대 9999)*/
	         urlBuilder.append("&" + URLEncoder.encode("period","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); 		 /*상태갱신 조회 범위(분) (기본값 5, 최소 1, 최대 10)*/
	         urlBuilder.append("&" + URLEncoder.encode("zcode","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); 		 /*시도 코드 (행정구역코드 앞 2자리)*/
	         URL url = new URL(urlBuilder.toString());
	         
	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");
	         conn.setRequestProperty("Content-type", "application/json");
	         System.out.println("Response code: " + conn.getResponseCode());
	         BufferedReader rd;
	         
	         if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	             rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         } else {
	             rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	         }
	         
	         String line;
	         while ((line = rd.readLine()) != null) {
	             sb.append(line);
	             responseData = sb.toString();	             
	         }
	         System.out.println("toString : "+sb.toString());
	         rd.close();
             conn.disconnect();
    	 }catch(Exception e) {
    		 e.getMessage();
    	 }
    	 responseData = sb.toString();
    	 return ResponseEntity.ok().body(responseData);
    }    
}