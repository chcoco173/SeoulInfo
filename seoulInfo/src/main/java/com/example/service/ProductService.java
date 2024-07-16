package com.example.service;

import java.util.List;

import com.example.domain.ProductImageVO;
import com.example.domain.ProductVO;

public interface ProductService {
	// 지역별 중고 상품 조회
	public List<ProductVO> getProductList(String sale_area);
	// 해당 상품 조회
	ProductVO getProduct(ProductVO vo);
	// 상품(상품 이미지와) 등록
	void insertProduct(ProductVO vo, ProductImageVO pivo);
	// 상품 글 수정
	void updateProduct(ProductVO vo);
	// 상품 글 삭제
	void deleteProduct(ProductVO vo);


}
