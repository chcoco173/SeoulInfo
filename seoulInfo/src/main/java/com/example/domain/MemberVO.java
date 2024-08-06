package com.example.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String  	member_id;			// 아이디
	private String 		member_pw;			// 비밀번호
	private String 		member_name;		// 이름
	private String 		member_tel;			// 전화번호
	private String 		member_email;		// 이메일
	private String 		member_area;		// 지역구
	private String 		member_imageOrigin;	// 회원이미지(오리지널)
	private String 		member_imageName;	// 회원이미지(이름)
	private String 		member_imagePath;	// 회원이미지(경로)
	private String 		member_status;		// 회원상태
	private int 		member_reportcount;	// 회원신고회수

}

/*
	DB 내용
CREATE TABLE member(
   member_id   			 VARCHAR(15)  NOT NULL,         -- 아이디
   member_pw   			 VARCHAR(100) NOT NULL,         -- 비밀번호
   member_name  		 VARCHAR(10)  NOT NULL,         -- 이름
   member_tel   		 VARCHAR(13)  NOT NULL,         -- 전화번호
   member_email  		 VARCHAR(100) NOT NULL,         -- 이메일
   member_area    		 VARCHAR(100) NOT NULL,         -- 지역구
   member_imageOrigin  	 VARCHAR(300) NULL,        	 	-- 회원이미지(오리지널)
   member_imageName    	 VARCHAR(300) NULL,         	-- 회원이미지(이름)
   member_imagePath  	 VARCHAR(300) NULL,         	-- 회원이미지(경로)
   member_status Boolean NOT NULL DEFAULT TRUE,   		-- 회원상태
   CONSTRAINT pk_member_id PRIMARY KEY (member_id)
);

*/