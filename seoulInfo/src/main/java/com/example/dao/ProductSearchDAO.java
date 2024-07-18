package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductSearchVO;

@Mapper
public interface ProductSearchDAO {
	
	// 검색 키워드 insert
	public void insertProductSearch(ProductSearchVO psvo);

}
