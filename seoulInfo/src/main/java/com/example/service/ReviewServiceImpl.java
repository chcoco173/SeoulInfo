package com.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReviewDAO;
import com.example.domain.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	
	// 리뷰등록
	@Override
	public Integer productReviewInsert(ReviewVO rvvo) {
		// TODO Auto-generated method stub
		return reviewDAO.productReviewInsert(rvvo);
	}

	@Override
	public ReviewVO productReviewIdSelect(Integer buy_id) {
		// TODO Auto-generated method stub
		return reviewDAO.productReviewIdSelect(buy_id);
	}

	@Override
	public Integer productReviewUpdate(ReviewVO rvvo) {
		// TODO Auto-generated method stub
		return reviewDAO.productReviewUpdate(rvvo);
	}

	@Override
	public Integer reviewStarAvg(String member_id) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewStarAvg(member_id);
	}

	@Override
	public HashMap mostProduct_review(String member_id) {
		// TODO Auto-generated method stub
		return reviewDAO.mostProduct_review(member_id);
	}

	@Override
	public HashMap mostChat_review(String member_id) {
		// TODO Auto-generated method stub
		return reviewDAO.mostChat_review(member_id);
	}

	@Override
	public HashMap mostCommitment_review(String member_id) {
		// TODO Auto-generated method stub
		return reviewDAO.mostCommitment_review(member_id);
	}
	
	

}
