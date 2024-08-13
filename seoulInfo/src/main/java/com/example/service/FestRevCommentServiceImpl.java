package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FestRevCommentDAO;
import com.example.domain.FestRevCommentVO;

@Service
public class FestRevCommentServiceImpl implements FestRevCommentService {
    @Autowired
    private FestRevCommentDAO festRevCommentDAO;

    
    // 리뷰 등록
    @Override
    public void insertComment(FestRevCommentVO frcVO) {
    	festRevCommentDAO.insertComment(frcVO);
    }
    
	// fr_id 에 해당하는 댓글 리스트
	@Override
	public List<FestRevCommentVO> getComments(Integer fr_id) {
		return festRevCommentDAO.getComments(fr_id);
	}
	
	// frc_id 에 해당하는 댓글
	@Override
	public FestRevCommentVO getComment(Integer frc_id) {
		return festRevCommentDAO.getComment(frc_id);
	}
	
	// 리뷰 삭제
	@Override
	public void deleteComment(Integer frc_id) {
		festRevCommentDAO.deleteComment(frc_id);
	}

}
