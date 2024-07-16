package com.example.domain;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
    private Integer sale_id;
    private String sale_cate;
    private String sale_name;
    private String sale_descript;
    private Integer sale_price;
    private Date sale_regdate;
    private String sale_status;
    private String member_id;
    private String sale_area;
    private Integer productimg_no;
}

/*
sale_id
sale_cate
sale_name
sale_descript
sale_price
sale_regdate
sale_status
member_id
sale_area
*/