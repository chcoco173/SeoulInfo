package com.example.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private 	Integer 	review_id;
	private 	Integer		review_star;
	private		String		product_review;
	private		String		chat_review;
	private		String		commitment_review;
	private		String		etc_review;
	private		Integer		buy_id;

}
