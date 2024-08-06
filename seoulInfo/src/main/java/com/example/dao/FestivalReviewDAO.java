package com.example.dao;

import com.example.domain.FestivalReviewVO;
import com.example.domain.FestRevImageVO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FestivalReviewDAO {
	// 축제 리뷰 등록
	public void insertReview(FestivalReviewVO frVO);
	// 가장 최근 축제리뷰 fr_id 값 가져오기
	public Integer ReviewNum();
	// 해당 축제 리뷰 리스트 가져오기
	public List<Map<Integer, Object>> getReviewList(Integer festival_id);
	// 해당 리뷰 가져오기
	public FestivalReviewVO getReview(Integer fr_id);
	// 리뷰 수정
	public void updateReview(FestivalReviewVO frVO);
	// 리뷰 삭제
	public Integer deleteReview(FestivalReviewVO frVO);
	// 내 리뷰 리스트 가져오기
	public List<Map<String, Object>> myReviewList(String member_id);

}
