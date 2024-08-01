package com.example.domain;

import lombok.Data;

@Data
public class ReportVO {
    private Integer report_id;
    private String member_id;
    private String report_reason;
    private boolean is_processed = false;
    private String report_cate;		// 중고거래, 뉴스댓글, 축제댓글 중 하나
}


//CREATE TABLE `report` (
//		  `report_id` int NOT NULL AUTO_INCREMENT,
//		  `member_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
//		  `report_reason` varchar(500) NOT NULL,
//		  `is_processed` tinyint(1) DEFAULT '0',
//		  `report_cate` varchar(20) NOT NULL,
//		  PRIMARY KEY (`report_id`),
//		  KEY `fk_신고_회원1_idx` (`member_id`),
//		  CONSTRAINT `fk_신고_회원1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
//		) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;