package com.example.domain;

import lombok.Data;

@Data
public class EVStationVO {
	
	private String evc_id;			// 충전소 ID
	private String evc_area;		// 충전소 군구
	private String evc_address;		// 충전소 주소
	private String evc_name;		// 충전소 명
	private String evc_lat;			// 충전소 위도
	private String evc_long;		// 충전소 경도
	
}