package com.example.domain;

import java.util.Date;
import lombok.Data;

@Data
public class FestivalReviewVO {
    private Integer fr_id;          // 리뷰 ID
    private String fr_content;      // 리뷰 내용
    private Date fr_regdate;        // 리뷰 작성일
    private Integer festival_id;    // 축제 ID
    private String member_id;       // 로그인된 회원 ID
    private String fr_title;        // 리뷰 제목
}

/*
	DB 내용
CREATE TABLE festival_review (
  fr_id int NOT NULL AUTO_INCREMENT,
  fr_content varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  fr_regdate date NOT NULL,
  festival_id int NOT NULL,
  member_id varchar(15) NOT NULL,
  fr_title varchar(100) NOT NULL,
  PRIMARY KEY (fr_id),
  KEY fk_festival_review_festival_idx (festival_id),
  KEY fk_festival_review_member_idx (member_id),
  CONSTRAINT fk_festival_review_festival FOREIGN KEY (festival_id) REFERENCES festival (festival_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_festival_review_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
*/