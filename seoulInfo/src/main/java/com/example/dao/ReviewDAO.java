package com.example.dao;

import java.util.HashMap;

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

	// 리뷰 ( 상품 리뷰 )
	public HashMap mostProduct_review(String member_id);

	// 리뷰 ( 채팅 리뷰 )
	public HashMap mostChat_review(String member_id);

	// 리뷰 ( 약속 리뷰 )
	public HashMap mostCommitment_review(String member_id);




}
