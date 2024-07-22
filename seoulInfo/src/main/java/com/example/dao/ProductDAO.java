package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductVO;

@Mapper
public interface ProductDAO {

	// 상품등록
	public void insertProduct(ProductVO pvo);

	// 상품등록한 최근 상품pk 값 가져오기d
	public Integer productNum();

	// 상품 리스트 출력 (검색 + 카테고리 + main)
	public List<Map<String, Object>> productCateList(HashMap map);

	// id 값에 해당하는 상품 list
	public List<Map<String, Object>> myProductList(String member_id);

	// sale_id에 해당하는 상품 정보
	public ProductVO myProductSaleId(Integer sale_id);

	// 상품수정
	public void updateProduct(ProductVO pvo);

	// 상품 상태 수정
	public Integer updateStatus(ProductVO pvo);

	// 상품 삭제
	public Integer deleteProduct(ProductVO pvo);
}
