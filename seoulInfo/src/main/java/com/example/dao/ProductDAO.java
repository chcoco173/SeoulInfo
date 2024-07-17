package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ProductVO;

@Mapper
public interface ProductDAO {
	
	public void insertProduct(ProductVO pvo);
	
	public Integer productNum();
	
	public List<Map<String, Object>> productList(String area);
	
	public List<Map<String, Object>> productCateList(HashMap map);

}
