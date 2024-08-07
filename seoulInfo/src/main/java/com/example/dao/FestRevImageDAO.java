package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.FestRevImageVO;

@Mapper
public interface FestRevImageDAO {
	// 리뷰 이미지 등록
	public void insertImage(FestRevImageVO friVO);
	
	// 해당 리뷰의 이미지들 가져오기
	public List<FestRevImageVO> getReviewImage(Integer fr_id);
	
	// fr_imgNo에 해당하는 이미지 삭제
	public Integer deleteImage(Integer fr_imgNo);
	
	// 해당 fr_id 를 가지고 있는 모든 축제 리뷰 이미지 삭제
	public Integer deleteReviewImage(Integer fr_id);
}
