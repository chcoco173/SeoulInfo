package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductSearchVO {
	private int 	prductsearch_no;
	private String	productsearch_keyword;
	private Date	productsearch_date;
	private	String	member_id;
	private String	productsearch_area;

}
