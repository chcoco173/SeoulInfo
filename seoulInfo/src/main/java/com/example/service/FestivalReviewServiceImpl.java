package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.FestRevImageDAO;
import com.example.dao.FestivalReviewDAO;
import com.example.domain.FestRevImageVO;
import com.example.domain.FestivalReviewVO;

@Service
public class FestivalReviewServiceImpl implements FestivalReviewService {
    @Autowired
    private FestivalReviewDAO festivalReviewDAO;
    
    @Autowired
    private FestRevImageDAO festRevImageDAO;
    
    // 리뷰 등록
    @Override
    public Integer insertReview(FestivalReviewVO frVO) {
        festivalReviewDAO.insertReview(frVO);
        return festivalReviewDAO.ReviewNum();
    }

    // 리뷰 이미지 등록
    @Override
    public void insertImage(FestRevImageVO friVO) {
    	festRevImageDAO.insertImage(friVO);
    }
    
	// festival_id 에 해당하는 리뷰 리스트
	@Override
	public List<Map<Object, Object>> getReviewList(Integer festival_id) {
		return festivalReviewDAO.getReviewList(festival_id);
	}
	
	// fr_id에 해당하는 리뷰 상세 가져오기
	@Override
	public FestivalReviewVO getReview(Integer fr_id) {
		return festivalReviewDAO.getReview(fr_id);
	}
	
	// 리뷰 수정
	@Override
	public void updateReview(FestivalReviewVO frVO) {
		festivalReviewDAO.updateReview(frVO);	
	}
	
	// 리뷰 삭제
	@Override
	public void deleteReview(Integer fr_id) {
		festivalReviewDAO.deleteReview(fr_id);
	}

	// 내 리뷰 목록 가져오기
	@Override
	public List<Map<Object, Object>> myReviewList(String member_id) {
		return festivalReviewDAO.myReviewList(member_id);
	}
	
	// fetch images for a review
    @Override
    public List<FestRevImageVO> getReviewImage(Integer fr_id) {
        return festRevImageDAO.getReviewImage(fr_id);
    }

}
