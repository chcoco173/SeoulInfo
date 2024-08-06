package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductBuyVO;

@Mapper
public interface ProductBuyDAO {
	// 구매 상품 등록
	public Integer insertProductBuy(ProductBuyVO pbvo);

}
