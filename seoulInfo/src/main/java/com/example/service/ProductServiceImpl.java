package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.ProductDAO;
import com.example.dao.ProductImageDAO;
import com.example.dao.ProductSearchDAO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductSearchVO;
import com.example.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductImageDAO productImageDAO;
	
	@Autowired 
	private ProductSearchDAO productSearchDAO;

	// 상품 등록
	@Override
	public Integer insertProduct(ProductVO pvo) {
		productDAO.insertProduct(pvo);
		return productDAO.productNum();
		
	}

	// 상품 이미지 등록
	@Override
	public void insertProductImage(ProductImageVO pivo) {
		productImageDAO.insertImage(pivo);
		
	}
	
	// 상품 리스트 출력
	@Override
	public List<Map<String, Object>> productCateList(HashMap map) {
		return productDAO.productCateList(map);
	}
	
	// 검색 키워드 insert
	@Override
	public void insertProductSearch(ProductSearchVO psvo) {
		productSearchDAO.insertProductSearch(psvo);
		
	}
	
	// id 값에 해당하는 상품 list
	@Override
	public List<Map<String, Object>> myProductList(String member_id) {
		return productDAO.myProductList(member_id);
	}

	



	

}
