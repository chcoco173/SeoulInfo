package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.FavoriteProductVO;

@Mapper
public interface FavoriteProductDAO {
	// 관심상품 등록
	public Integer insertFavProduct(FavoriteProductVO fpvo);

	// 관심상품 삭제
	public Integer deleteFavProduct(FavoriteProductVO fpvo);

	// member_id + sale_id 관심상품 있는지 없는지 확인
	public Boolean wishCheck(FavoriteProductVO fpvo);

}
