package com.example.domain;

import lombok.Data;

@Data
public class EVchargerVO {
	private String  evc_id;				// 충전소 ID
	private String  evc_area;			// 충전소 군구
	private String  evc_address;		// 충전소 주소
	private String  evc_name;			// 충전소 명
	private String  evc_lat;			// 충전소 위도
	private String  evc_long;			// 충전소 경도
	
	private Integer charger_no;			// 충전소 번호
	private String  charger_type;		// 충전소 충전타입
	private String  charger_userlimit;	// 충전소 이용자제한
	private String  charger_mechine;	// 충전소 기종
	private String  charger_facsmall;	// 충전소 시설구분(소)
	private String  charger_opbig;		// 충전소 운영기관(대)
	private String  charger_opsmall;	// 충전소 운영기관(소)
}
