package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NewsVO {
	private Integer 	news_id;			// 뉴스 번호
	private String 		news_area;			// 뉴스 구역
	private String 		news_title;			// 뉴스 제목
	private String 		news_imageurl;		// 뉴스 이미지 url
	private String 		news_link;			// 뉴스 url
	private String 		news_content;		// 뉴스 텍스트
	private Date 		news_date;			// 뉴스 날짜
}

/*
	[DB 내용]
CREATE TABLE IF NOT EXISTS `seoulinfo`.`news` (
  `news_id` INT NOT NULL AUTO_INCREMENT,
  `news_area` VARCHAR(50) NOT NULL,
  `news_title` VARCHAR(100) NOT NULL,
  `news_imageurl` VARCHAR(500) NOT NULL,
  `news_link` VARCHAR(500) NOT NULL,
  `news_content` TEXT,
  `news_date` DATE NOT NULL,
  PRIMARY KEY (`news_id`))
ENGINE = InnoDB;

*/