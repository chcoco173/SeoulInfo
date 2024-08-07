package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MypageProductVO {
	
	private 	Integer 	favproduct_id;
	private 	Integer 	sale_id;			// 관심상품아이디
	private 	String 		member_id;		    // 로그인 회원아이디

	private 	String		sale_cate;			// 카테고리 
	private		String		sale_name;			// 상품이름
	private		String		sale_descript;		// 상품설명
	private		Integer		sale_price;			// 상품가격
	private 	Date		sale_regdate;		// 등록일
	private		String		sale_status;		// 거래상태
	private		String 		sale_area;			// 지역
	private		Integer		sale_viewcount;		// 조회수
	
	private 	Integer 	productimg_no; 		// 이미지번호 pk
	private 	String		productimg_url;		// 이미지 path
	private 	String		productimg_name;	// 이미지 실제 이름
	private 	String		productimg_alias;	// 이미지 저장 경로 : /static/productImage/ + productimg_alias

	

}
