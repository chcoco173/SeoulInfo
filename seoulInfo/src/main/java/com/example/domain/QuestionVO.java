package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	
	private int  		question_no;		// 문의번호
	private String 		question_cate;		// 카테고리
	private String 		question_title;		// 제목
	private String 		question_content;	// 내용
	private String 		question_status;	// 진행상태
	private Date 		question_date;		// 작성일	
	
	private String  	member_id;			// 아이디

}
