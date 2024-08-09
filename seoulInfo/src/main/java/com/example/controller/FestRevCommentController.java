package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.FestRevCommentVO;
import com.example.service.FestRevCommentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/festivalReviewDetail")
public class FestRevCommentController {
	
    @Autowired
    private FestRevCommentService festRevCommentService;

	@Autowired
	private HttpSession session;




}