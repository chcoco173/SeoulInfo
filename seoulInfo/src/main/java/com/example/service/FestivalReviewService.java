package com.example.service;

import com.example.domain.FestivalReviewVO;

import java.util.List;
import java.util.Map;

import com.example.domain.FestRevImageVO;

public interface FestivalReviewService {
	// 리뷰 등록
	public Integer insertReview(FestivalReviewVO frVO);
    // 리뷰 이미지 등록
	public void insertImage(FestRevImageVO friVO);
	// festival_id에 해당하는 리뷰 리스트 가져오기
	public List<Map<Integer, Object>> getReviewList(Integer festival_id);
	// fr_id에 해당하는 리뷰 정보 가져오기
	public FestivalReviewVO getReview(Integer fr_id);
	// 리뷰 수정
	public void updateReview(FestivalReviewVO frVO);
	// 리뷰 삭제
	public Integer deleteReview(FestivalReviewVO frVO);
	// 내 축제 리뷰 가져오기
	public List<Map<String, Object>> myReviewList(String member_id);
	
}
