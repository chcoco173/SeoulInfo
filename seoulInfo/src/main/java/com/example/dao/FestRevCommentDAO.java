package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.FestRevCommentVO;

@Mapper
public interface FestRevCommentDAO {
	// 축제 리뷰 댓글 등록
	public void insertComment(FestRevCommentVO comment);
	// 해당 축제 리뷰 리스트 가져오기
	public List<FestRevCommentVO> getComments(Integer frc_id);
	// 댓글 삭제
	public void deleteComment(Integer frc_id);
	// 댓글 가져오기
	public FestRevCommentVO getComment(Integer frc_id);
}
