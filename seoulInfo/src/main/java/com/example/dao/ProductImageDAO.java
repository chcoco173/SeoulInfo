package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductImageVO;

@Mapper
public interface ProductImageDAO {

	public void insertImage(ProductImageVO pivo);

	// sale_id에 해당하는 image들 들고오기
	public List<ProductImageVO> myProductSaleId(Integer sale_id);
	
	// productImageno에 해당하는 이미지 지우기
	public Integer deleteImage(Integer productimg_no);


}
