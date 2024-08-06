package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ReviewVO;

@Mapper
public interface ReviewDAO {

	// 구매리뷰 등록
	public Integer productReviewInsert(ReviewVO rvvo);

	// 구매리뷰 업데이트
	public Integer productReviewUpdate(ReviewVO rvvo);

	// 리뷰 보기
	public ReviewVO productReviewIdSelect(Integer buy_id);
	
	// 별점 계산
	public Integer reviewStarAvg(String member_id);
}
