package com.example.domain;

import lombok.Data;

@Data
public class EVchargerVO {
	private Integer charger_id;			// 충전소 등록번호
	private Integer charger_no;			// 충전소 번호
	private String  charger_status;		// 충전소	상태
	private String  charger_type;		// 충전소 충전타입
	private String 	charger_userlimit;	// 충전소 이용자제한
}
