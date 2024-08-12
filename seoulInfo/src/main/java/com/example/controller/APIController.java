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
    
    // 
    
    @GetMapping("path")
    public ResponseEntity<String> getParking(@RequestParam String param) {
    	StringBuilder sb = new StringBuilder();
   	 	String responseData = sb.toString();
    	try {
            StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_prkplce_info_api"); /*URL*/
            urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=서비스키"); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
            urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
            urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*XML/JSON 여부*/
            urlBuilder.append("&" + URLEncoder.encode("prkplceNo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차장관리번호*/
            urlBuilder.append("&" + URLEncoder.encode("prkplceNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차장명*/
            urlBuilder.append("&" + URLEncoder.encode("prkplceSe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차장구분*/
            urlBuilder.append("&" + URLEncoder.encode("prkplceType","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차장유형*/
            urlBuilder.append("&" + URLEncoder.encode("rdnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지도로명주소*/
            urlBuilder.append("&" + URLEncoder.encode("lnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지지번주소*/
            urlBuilder.append("&" + URLEncoder.encode("prkcmprt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차구획수*/
            urlBuilder.append("&" + URLEncoder.encode("feedingSe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*급지구분*/
            urlBuilder.append("&" + URLEncoder.encode("enforceSe","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*부제시행구분*/
            urlBuilder.append("&" + URLEncoder.encode("operDay","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*운영요일*/
            urlBuilder.append("&" + URLEncoder.encode("weekdayOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평일운영시작시각*/
            urlBuilder.append("&" + URLEncoder.encode("weekdayOperColseHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*평일운영종료시각*/
            urlBuilder.append("&" + URLEncoder.encode("satOperOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*토요일운영시작시각*/
            urlBuilder.append("&" + URLEncoder.encode("satOperCloseHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*토요일운영종료시각*/
            urlBuilder.append("&" + URLEncoder.encode("holidayOperOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공휴일운영시작시각*/
            urlBuilder.append("&" + URLEncoder.encode("holidayCloseOpenHhmm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*공휴일운영종료시각*/
            urlBuilder.append("&" + URLEncoder.encode("parkingchrgeInfo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*요금정보*/
            urlBuilder.append("&" + URLEncoder.encode("basicTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차기본시간*/
            urlBuilder.append("&" + URLEncoder.encode("basicCharge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차기본요금*/
            urlBuilder.append("&" + URLEncoder.encode("addUnitTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*추가단위시간*/
            urlBuilder.append("&" + URLEncoder.encode("addUnitCharge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*추가단위요금*/
            urlBuilder.append("&" + URLEncoder.encode("dayCmmtktAdjTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*1일주차권요금적용시간*/
            urlBuilder.append("&" + URLEncoder.encode("dayCmmtkt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*1일주차권요금*/
            urlBuilder.append("&" + URLEncoder.encode("monthCmmtkt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*월정기권요금*/
            urlBuilder.append("&" + URLEncoder.encode("metpay","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*결제방법*/
            urlBuilder.append("&" + URLEncoder.encode("spcmnt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*특기사항*/
            urlBuilder.append("&" + URLEncoder.encode("institutionNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*관리기관명*/
            urlBuilder.append("&" + URLEncoder.encode("phoneNumber","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전화번호*/
            urlBuilder.append("&" + URLEncoder.encode("latitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*위도*/
            urlBuilder.append("&" + URLEncoder.encode("longitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*경도*/
            urlBuilder.append("&" + URLEncoder.encode("pwdbsPpkZoneYn","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*장애인전용주차구역보유여부*/
            urlBuilder.append("&" + URLEncoder.encode("referenceDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*데이터기준일자*/
            urlBuilder.append("&" + URLEncoder.encode("instt_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관코드*/
            urlBuilder.append("&" + URLEncoder.encode("instt_nm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관기관명*/
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
            sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            System.out.println(sb.toString());
            
    	}catch(Exception e) {
    		e.getMessage();
    	}        
        return ResponseEntity.ok().body(responseData);
    }
    
}