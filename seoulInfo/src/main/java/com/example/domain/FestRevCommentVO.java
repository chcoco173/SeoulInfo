package com.example.domain;

import lombok.Data;

@Data
public class FestRevCommentVO {
    private Integer frc_id;         // 축제 후기 댓글 ID
    private String frc_regdate;     // 등록 날짜
    private String frc_content;     // 댓글 내용
    private Integer fr_id;          // 축제 후기 ID (외래 키)
    private String member_id;       // 로그인한 회원 ID (외래 키)
}

/*
	DB 내용
CREATE TABLE `fest_rev_comment` (
  `frc_id` int NOT NULL AUTO_INCREMENT,
  `frc_regdate` date NOT NULL,
  `frc_content` varchar(1000) NOT NULL,
  `fr_id` int NOT NULL,
  `member_id` varchar(15) NOT NULL,
  PRIMARY KEY (`frc_id`),
  KEY `fk_fest_rev_comment_festival_review_idx` (`fr_id`),
  KEY `fk_fest_rev_comment_member_idx` (`member_id`),
  CONSTRAINT `fk_fest_rev_comment_festival_review` FOREIGN KEY (`fr_id`) REFERENCES `festival_review` (`fr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fest_rev_comment_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
*/