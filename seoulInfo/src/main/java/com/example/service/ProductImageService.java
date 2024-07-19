package com.example.service;

import java.util.List;

import com.example.domain.ProductImageVO;

public interface ProductImageService {


	// sale_id에 해당하는 image들 들고오기
	public List<ProductImageVO> myProductSaleId(Integer sale_id);


	// productImageno에 해당하는 이미지 지우기
	public Integer deleteImage(Integer productimg_no);


}
