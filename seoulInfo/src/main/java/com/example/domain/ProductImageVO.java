package com.example.domain;

import lombok.Data;

@Data
public class ProductImageVO {
	private Integer productimg_no;	// auto increment
	private String  productimg_name;	// 파일 원래 이름
	private String  productimg_alias;	// 파일 생성된 새 이름
	private String  productimg_url;
	private String sale_id;
}

/*
productimg_no
productimg_url
sale_id
productimg_name
productimg_alias
*/