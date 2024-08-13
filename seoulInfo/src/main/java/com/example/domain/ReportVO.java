package com.example.domain;

import lombok.Data;

@Data
public class ReportVO {
    private Integer report_id;
    private String member_id;
    private String report_reason;
    private boolean is_processed = false;
    private String report_cate;		// 중고거래, 뉴스댓글, 축제댓글 중 하나
    private Integer sale_id;
    private Integer frc_id;
}


//CREATE TABLE `report` (
//		  `report_id` int NOT NULL AUTO_INCREMENT,
//		  `member_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
//		  `report_reason` varchar(500) NOT NULL,
//		  `is_processed` boolean DEFAULT '0',
//		  `report_cate` varchar(20) NOT NULL,
//		  `sale_id` int DEFAULT NULL,
//		  `frc_id` int DEFAULT NULL,
//		  PRIMARY KEY (`report_id`),
//		  KEY `fk_신고_회원1_idx` (`member_id`),
//		  KEY `report_product_sale_FK` (`sale_id`),
//		  KEY `report_fest_rev_comment_FK` (`frc_id`),
//		  CONSTRAINT `fk_신고_회원1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
//		  CONSTRAINT `report_fest_rev_comment_FK` FOREIGN KEY (`frc_id`) REFERENCES `fest_rev_comment` (`frc_id`),
//		  CONSTRAINT `report_product_sale_FK` FOREIGN KEY (`sale_id`) REFERENCES `product_sale` (`sale_id`)
//		) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;