package com.example.domain;

import lombok.Data;

@Data
public class FestRevImageVO {
    private Integer fr_imgId;       // 이미지 번호
    private String fr_imgName;      // 이미지 이름
    private String fr_imgAlias;     // 이미지 별명
    private String fr_imgUrl;       // 이미지 URL
    private Integer fr_id;          // 리뷰 ID (외래 키)
}

/*
	DB 내용
CREATE TABLE `fest_rev_image` (
  `fr_imgId` int NOT NULL AUTO_INCREMENT,
  `fr_imgName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fr_imgAlias` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fr_imgUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fr_id` int NOT NULL,
  PRIMARY KEY (`fr_imgNo`),
  KEY `fk_fest_rev_image_festival_review_idx` (`fr_Id`),
  CONSTRAINT `fk_fest_rev_image_festival_review` FOREIGN KEY (`fr_Id`) REFERENCES `festival_review` (`fr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/