package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ProductImageDAO;
import com.example.domain.ProductImageVO;

@Service
public class ProductImageServiceImpl implements ProductImageService{

	@Autowired
	private ProductImageDAO productImageDAO;
	
	
	// sale_id에 해당하는 image들 들고오기
	@Override
	public List<ProductImageVO> myProductSaleId(Integer sale_id) {
		// TODO Auto-generated method stub
		return productImageDAO.myProductSaleId(sale_id);
	}

	// productImageno에 해당하는 이미지 지우기
	@Override
	public Integer deleteImage(Integer productimg_no) {
		return productImageDAO.deleteImage(productimg_no);
	}


	

}
