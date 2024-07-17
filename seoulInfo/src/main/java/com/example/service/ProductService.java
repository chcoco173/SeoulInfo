package com.example.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.domain.ProductImageVO;
import com.example.domain.ProductVO;

public interface ProductService {
	
	// 상품등록
	public Integer insertProduct(ProductVO pvo);
	// 상품 이미지 등록
	public void insertProductImage(ProductImageVO pivo);
	
	// 상품 리스트 출력
	public List<Map<String, Object>> productList(String area);
	
	// 상품 리스트 출력
	public List<Map<String, Object>> productCateList(HashMap map);
		

	

}
