package com.example.domain;

import lombok.Data;

@Data
public class ProductImageVO {

	private 	Integer 	productimg_no; 		// 이미지번호 pk
	private 	String		productimg_url;		// 이미지 path
	private 	String		productimg_name;	// 이미지 실제 이름
	private 	String		productimg_alias;	// 이미지 저장 이름
	private 	Integer 	sale_id;			// 상품아이디
	
	
}
