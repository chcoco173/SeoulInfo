package com.example.service;

import com.example.domain.ReviewVO;

public interface ReviewService {
	// 구매리뷰 등록
	public Integer productReviewInsert(ReviewVO rvvo);

	// 구매리뷰 수정
	public Integer productReviewUpdate(ReviewVO rvvo);

	// 리뷰 보기
	public ReviewVO productReviewIdSelect(Integer buy_id);

	// 별점 계산
	public Integer reviewStarAvg(String member_id);

}
