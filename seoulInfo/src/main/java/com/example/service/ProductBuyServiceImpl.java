package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ProductBuyDAO;
import com.example.domain.ProductBuyVO;

@Service
public class ProductBuyServiceImpl implements ProductBuyService{

	@Autowired
	private ProductBuyDAO productBuyDAO;
	
	// 구매 상품 등록
	@Override
	public Integer insertProductBuy(ProductBuyVO pbvo) {
		return productBuyDAO.insertProductBuy(pbvo);

	}

}
