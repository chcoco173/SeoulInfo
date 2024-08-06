package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FavoriteProductDAO;
import com.example.dao.ProductDAO;
import com.example.dao.ProductImageDAO;
import com.example.dao.ProductSearchDAO;
import com.example.domain.FavoriteProductVO;
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
	
	@Autowired
	private FavoriteProductDAO favoriteProductDAO;
	

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
	
	@Override
	public List<Map<String, Object>> productMainList(HashMap map) {
		// TODO Auto-generated method stub
		return productDAO.productMainList(map);
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

	// sale_id에 해당하는 상품상세 들고오기
	@Override
	public ProductVO myProductSaleId(Integer sale_id) {
		// TODO Auto-generated method stub
		return productDAO.myProductSaleId(sale_id);
	}

	
	// 상품 수정
	@Override
	public void updateProduct(ProductVO pvo) {
		productDAO.updateProduct(pvo);	
	}

	// 상품 상태 수정
	@Override
	public Integer updateStatus(ProductVO pvo) {
		return productDAO.updateStatus(pvo);
		
	}

	@Override
	public Integer deleteProduct(ProductVO pvo) {
		return productDAO.deleteProduct(pvo);
	}
	// 관심상품 등록
	@Override
	public Integer insertFavProduct(FavoriteProductVO fpvo) {
		
		return favoriteProductDAO.insertFavProduct(fpvo);
	}
	
	// member_id + sale_id 관심상품 있는지 없는지 확인
	@Override
	public Boolean wishCheck(FavoriteProductVO fpvo) {
		return favoriteProductDAO.wishCheck(fpvo);
	}

	// 관심상품 제거
	@Override
	public Integer deleteFavProduct(FavoriteProductVO fpvo) {
		// TODO Auto-generated method stub
		return favoriteProductDAO.deleteFavProduct(fpvo);
	}
	// 찜 상품 출력
	@Override
	public List<Map<String, Object>> wishList(String member_id) {
		// TODO Auto-generated method stub
		return productDAO.wishList(member_id);
	}

	@Override
	public List<Map<String, Object>> similarList(int[] prediction) {
		// TODO Auto-generated method stub
		return productDAO.similarList(prediction);
	}

	@Override
	public int countItems(HashMap map) {
		// TODO Auto-generated method stub
		return productDAO.countItems(map);
	}

	// 조회수 증가
	@Override
	public Integer productViewCountUpdate(Integer festival_id) {
		// TODO Auto-generated method stub
		return productDAO.productViewCountUpdate(festival_id);
	}

	@Override
	public List<Map<String, Object>> productReview(String member_id) {
		return productDAO.productReview(member_id);
	}
	
	

	


	
	
	
	
	
	

}
