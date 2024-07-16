package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.domain.ProductVO;


@Mapper
public interface ProductDAO {
	
	public List<ProductVO> getProductList(String sale_area);
	public ProductVO getProduct(ProductVO vo);
    void insertProduct(ProductVO vo);
	void updateProduct(ProductVO vo);
	void deleteProduct(ProductVO vo);
}
