package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.example.service.MemberService;

@Controller
@RequestMapping("/member")
//@SessionAttributes("mem") //Model 객체에 member라고 저장된 객체를 세션에 등록한다.
public class MemberController {
	
	// 로그파일 설정
//	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
//	
//	@Autowired
//	private MemberService memberservice;

	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/{step}")
	public String memberViewPage(@PathVariable String step) {
		System.out.println(step);
		return "member/"+step;
	}

	

}
