package com.example.domain;

import lombok.Data;

@Data
public class EVPlacesVO {
	
	private String etc_name;			// 편의시설 상호명
	private String etc_buildingName;	// 편의시설 건물명
	private String etc_category;		// 편의시설 상권업소분류
	private String etc_area;			// 편의시설 시군구명
	private String etc_address;			// 편의시설 도로명주소
	
	private double etc_lat;			// 편의시설 위도
	private double etc_long;			// 편의시설 경도
}
