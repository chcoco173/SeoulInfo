package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.FestRevImageDAO;
import com.example.domain.FestRevImageVO;

@Service
public class FestRevImageServiceImpl implements FestRevImageService {
    @Autowired
    private FestRevImageDAO festRevImageDAO;

    // fr_id 에 해당하는 images 가져오기
    @Override
    public List<FestRevImageVO> getReviewImage(Integer fr_id) {
    	return festRevImageDAO.getReviewImage(fr_id);
    }

    // fr_imgId 에 해당하는 이미지 지우기
    @Override
    public Integer deleteImage(Integer fr_imgId) {
    	return festRevImageDAO.deleteImage(fr_imgId);
    }
    
    // 해당 fr_id 에 해당하는 모든 이미지 지우기
    public Integer deleteReviewImages(Integer fr_id) {
    	return festRevImageDAO.deleteReviewImage(fr_id);
    }

}
