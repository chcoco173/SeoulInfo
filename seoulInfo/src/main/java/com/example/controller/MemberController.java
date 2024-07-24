package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.domain.MemberVO;
import com.example.service.MemberService;

import jakarta.servlet.http.HttpSession;


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
	
	// 회원가입 : DB입력
	@RequestMapping("/saveMember")
	public String insertMember(MemberVO vo) {		
		System.out.println("saveMember");

		// 회원가입 처리
		memberService.insertMember(vo);

		// 회원가입 성공 후 로그인 페이지로 리다이렉트
		return "redirect:/member/loginA";
	}
	
	// 아이디 중복 체크 : AJAX를 이용할 경우 return 페이지 안됨/ DB값만 가져오기 
	@ResponseBody
	@RequestMapping("/idChk")
	public String idChk(MemberVO vo) {
		System.out.println("/idChk ->" + vo.getMember_id());
		int result = memberService.idChk(vo);
		return String.valueOf(result);		
	}
	
	// 이메일 중복 체크 : AJAX를 이용할 경우 return 페이지 안됨/ DB값만 가져오기 
	@ResponseBody
	@RequestMapping("/emailChk")
	public String emailChk(MemberVO vo) {
		System.out.println("/emailChk ->" + vo.getMember_email());
		int result = memberService.emailChk(vo);
		return String.valueOf(result);		
	}		
	
	// 로그인 : DB데이터 가져오기
	@PostMapping("/loginCheck")
	public String loginCheck(MemberVO vo, Model model, HttpSession session) {
		System.out.println("화면에서 넘어온 값: "+ vo);
		
		MemberVO result = memberService.loginCheck(vo);
		System.out.println("결과: "+ result);
		
		if(result != null) {
			//뷰페이지에 데이타 전송 : ${mem.member_name}
			model.addAttribute("mem", result);
			
			//세션에 저장(모든 뷰페이지에서 데이타를 사용 가능함) : ${sessionScope.member.member_name}
			session.setAttribute("member", result);
			
			return "redirect:/";
		}else {
			return "member/loginRe";
		}
	}
	
    // 로그아웃 
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션 무효화
        return "redirect:/";    // 초기 페이지로 리디렉션
    }	
	
	
	
	// 아이디 찾기 : DB데이터 가져오기
	@PostMapping("/id_search")
	public String id_search(MemberVO vo, Model model, HttpSession session) {
		
		MemberVO result = memberService.idSearch(vo);
		
		if(result == null) {
			return "member/id_searchRe";
		}else {
			//뷰페이지에 데이타 전송 : ${mem.member_id}
			model.addAttribute("mem", result);
			
			//이름과 이메일이 DB에 있는 아이디를 세션에 저장 : ${sessionScope.logid.member_id}
			session.setAttribute("logid", result);
			return "member/id_searchOk";
		}
	}
	
	// 비밀번호 찾기 : DB데이터 가져오기
	@PostMapping("/pw_search")
	public String pw_search(MemberVO vo, Model model, HttpSession session) {
		
		MemberVO result = memberService.pwSearch(vo);
		
		if(result == null) {
			return "member/pw_searchRe";
		}else {
			//뷰페이지에 데이타 전송 : ${mem.member_pw}
			model.addAttribute("mem", result);
			
			//이름, 아이디, 이메일이 DB에 있는 비밀번호를 세션에 저장 : ${sessionScope.logpw.member_pw}
			session.setAttribute("logpw", result);
			return "member/pw_searchOk";
		}
	}	
	

}
