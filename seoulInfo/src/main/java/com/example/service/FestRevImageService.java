package com.example.service;

import java.util.List;

import com.example.domain.FestRevImageVO;

public interface FestRevImageService {
	// fr_id에 해당하는 image들 들고오기
	public List<FestRevImageVO> getReviewImage(Integer fr_id);

	// fr_imgId에 해당하는 이미지 지우기
	public Integer deleteImage(Integer fr_imgId);
	
	// 해당 fr_id 를 가지고 있는 모든 상품 이미지 삭제
	public Integer deleteReviewImages(Integer fr_id);

}
