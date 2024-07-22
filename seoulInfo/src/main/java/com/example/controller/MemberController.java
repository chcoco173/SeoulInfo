package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.MemberVO;
import com.example.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes("mem") //Model 객체에 member라고 저장된 객체를 세션에 등록한다.
public class MemberController {
	
	// 로그파일 설정
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	//선택한 url로 이동
	@RequestMapping("/{step}")
	public String memberViewPage(@PathVariable String step) {
		System.out.println(step);
		return "member/"+step;
	}
	
	// 회원가입/ DB입력
	@RequestMapping("/saveMember")
	public String insertMember(MemberVO vo) {		
		System.out.println("saveMember");

		// 회원가입 처리
		memberService.insertMember(vo);

		// 회원가입 성공 후 로그인 페이지로 리다이렉트
		return "redirect:/member/loginA";
	}
	
	// 아이디 중복 체크(AJAX를 이용할 경우 return 페이지 안됨/ DB값만 가져오기) 
	@ResponseBody
	@RequestMapping("/idChk")
	public String idChk(MemberVO vo) {
		System.out.println("/idChk ->" + vo.getMember_id());
		int result = memberService.idChk(vo);
		return String.valueOf(result);		
	}
	
	// 이메일 중복 체크(AJAX를 이용할 경우 return 페이지 안됨/ DB값만 가져오기) 
	@ResponseBody
	@RequestMapping("/emailChk")
	public String emailChk(MemberVO vo) {
		System.out.println("/emailChk ->" + vo.getMember_email());
		int result = memberService.emailChk(vo);
		return String.valueOf(result);		
	}	
	

	

}
