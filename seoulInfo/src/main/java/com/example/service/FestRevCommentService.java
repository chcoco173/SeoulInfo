package com.example.service;

import java.util.List;

import com.example.domain.FestRevCommentVO;

public interface FestRevCommentService {
	// 댓글 등록
    public void insertComment(FestRevCommentVO frcVO);
    // 해당 리뷰 댓글 가져오기
    public List<FestRevCommentVO> getComments(Integer fr_id);
    // 댓글 가져오기
    public FestRevCommentVO getComment(Integer frc_id);
    // 댓글 삭제
    public void deleteComment(Integer frc_id);

}
