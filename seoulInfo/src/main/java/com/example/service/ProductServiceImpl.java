package com.example.service;

import java.util.List;

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
	private ProductImageDAO piDAO;
	
	// 지역별 상품 리스트
	public List<ProductVO> getProductList(String area) {		
		return productDAO.getProductList(area);
	}
	
	public ProductVO getProduct(ProductVO vo) {
		return productDAO.getProduct(vo);
	}
	
	// 상품(이미지와) 등록
	@Transactional
	public void insertProduct(ProductVO vo, ProductImageVO pivo) {		
		piDAO.insertProductImage(pivo);
		vo.setProductimg_no(piDAO.selectMember_id());		
		productDAO.insertProduct(vo);
	}
	
	// 상품 글 수정
	public void updateProduct(ProductVO vo) {
		productDAO.updateProduct(vo);
	}
	
	// 상품 글 삭제
	public void deleteProduct(ProductVO vo) {
		productDAO.deleteProduct(vo);
	}

}
