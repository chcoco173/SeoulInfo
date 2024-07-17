package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.ProductDAO;
import com.example.dao.ProductImageDAO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductImageDAO productImageDAO;

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

	@Override
	public List<Map<String, Object>> productList(String area) {
		return productDAO.productList(area);
	}

	@Override
	public List<Map<String, Object>> productCateList(HashMap map) {
		return productDAO.productCateList(map);
	}

	



	

}
