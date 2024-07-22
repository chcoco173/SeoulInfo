package com.example.domain;

import lombok.Data;

@Data
public class FestivalVO {
	private Integer 	festival_id;			// 축제번호
	private String 		festival_name;			// 축제이름
	private String 		festival_startDate;		// 축제시작일
	private String 		festival_endDate;		// 축제종료일
	private String 		festival_area;			// 축제구
	private String 		festival_loc;			// 축제주소
	private String 		festival_imageurl;		// 축제이미지url
	private String 		festival_siteurl;		// 축제사이트url
	private String		festival_type;
	private String		festival_target;
	private String		festival_fee;
	private String		festival_appdate;
	private String		festival_lat;
	private String		festival_long;
	private String		festival_free;
	private String		festival_host;
	
	
}

/*
	DB 내용
	CREATE TABLE festival (
  	fId	 		INT 			NOT NULL AUTO_INCREMENT,	-- 축제번호
  	fName	 	VARCHAR(50) 	NOT NULL,					-- 축제이름
  	fContent	VARCHAR(2000)	NOT NULL,					-- 축제내용
  	fStartDate 	DATE 			NOT NULL,					-- 축제시작일
  	fEndDate	DATE 			NOT NULL,					-- 축제종료일
  	fArea	 	VARCHAR(100) 	NOT NULL,					-- 축제구
  	fAddress	 	VARCHAR(100) 	NOT NULL,				-- 축제주소
  	fImageUrl	VARCHAR(500) 	NOT NULL,					-- 축제이미지url
  	fSiteUrl	VARCHAR(500) 	NOT NULL,					-- 축제사이트url
  	CONSTRAINT pk_festival_fId PRIMARY KEY (fId)
);

*/