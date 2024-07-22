package com.example.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.domain.ProductImageVO;
import com.example.domain.ProductSearchVO;
import com.example.domain.ProductVO;

public interface ProductService {

	// 상품등록
	public Integer insertProduct(ProductVO pvo);

	// 상품 이미지 등록
	public void insertProductImage(ProductImageVO pivo);

	// 상품 리스트 출력 (검색 + 카테고리 + main)
	public List<Map<String, Object>> productCateList(HashMap map);

	// 검색 키워드 insert
	public void insertProductSearch(ProductSearchVO psvo);

	// id 값에 해당하는 상품 list
	public List<Map<String, Object>> myProductList(String member_id);

	// sale_id에 해당하는 상품 정보
	public ProductVO myProductSaleId(Integer sale_id);
	
	// 상품 수정
	public void updateProduct(ProductVO pvo);
	
	// 상품 상태 수정
	public Integer updateStatus(ProductVO pvo);
	
	// 상품 삭제
	public Integer deleteProduct(ProductVO pvo);



}
