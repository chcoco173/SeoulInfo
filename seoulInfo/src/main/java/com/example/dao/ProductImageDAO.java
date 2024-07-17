package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductImageVO;

@Mapper
public interface ProductImageDAO {
	
	public void insertImage(ProductImageVO pivo);
	

}
