package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private 	Integer 	sale_id;			// 상품아이디
	private 	String		sale_cate;			// 카테고리 
	private		String		sale_name;			// 상품이름
	private		String		sale_descript;		// 상품설명
	private		Integer		sale_price;			// 상품가격
	private 	Date		sale_regdate;		// 등록일
	private		String		sale_status;		// 거래상태
	private 	String		member_id;			// 판매자 id
	private		String 		sale_area;			// 지역
	private		Integer		sale_viewcount;		// 조회수

	

}
