package com.example.domain;

import lombok.Data;

@Data
public class EVchargerVO {
	private Integer charger_id;			// 충전소 등록번호
	private Integer charger_no;			// 충전소 번호
	private String  charger_status;		// 충전소	상태
	private String  charger_type;		// 충전소 충전타입
	private String 	charger_userlimit;	// 충전소 이용자제한
	private String evc_facbig;			// 충전소 시설구분(대)
	private String evc_facsmall;		// 충전소 시설구분(소)
	private String evc_mbig;			// 충전소 기종(대)
	private String evc_msmall;			// 충전소 기종(소)
	private String evc_opbig;			// 충전소 운영기관(대)
	private String evc_opsmall;			// 충전소 운영기관(소)
}
