package com.example.domain;

import java.util.Date;
import lombok.Data;

@Data
public class ProductBuyVO {
    private Integer buyId;		// 구매 id
    private Date buyDate;		// 판매완료된 날짜
    private Integer saleId;		// 해당 상품 id
    private String memberId;	// 구매자 id
}

//CREATE TABLE product_buy (
//		  buy_id int NOT NULL AUTO_INCREMENT,
//		  buy_date datetime NOT NULL,
//		  sale_id int NOT NULL,
//		  member_id varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
//		  PRIMARY KEY (buy_id),
//		  KEY fk_구매상품_판매상품1_idx (sale_id),
//		  KEY fk_구매상품_회원1_idx (member_id),
//		  CONSTRAINT fk_구매상품_판매상품1 FOREIGN KEY (sale_id) REFERENCES product_sale (sale_id) ON DELETE CASCADE ON UPDATE CASCADE,
//		  CONSTRAINT fk_구매상품_회원1 FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
//		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;