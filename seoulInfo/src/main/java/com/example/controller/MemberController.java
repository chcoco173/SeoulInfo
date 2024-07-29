package com.example.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.dao.MemberDAO;
import com.example.domain.MailVO;
import com.example.domain.MemberVO;
import com.example.service.MailService;
import com.example.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/member")
@SessionAttributes("mem") //Model 객체에 member라고 저장된 객체를 세션에 등록한다.
public class MemberController {
	
	// 로그파일 설정
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private MailService mailService;
    

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

        // 비밀번호 암호화
        String encodedPass = passwordEncoder.encode(vo.getMember_pw());
        vo.setMember_pw(encodedPass);

        // 회원가입 처리
        memberService.insertMember(vo);

        // 회원가입 성공 후 로그인 페이지로 이동
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
	

	// 로그인 : DB연동(비밀번호 암호화 반영)
	@PostMapping("/loginCheck")
	public String loginCheck(MemberVO vo, Model model, HttpSession session) {
		System.out.println("로그인/화면에서 넘어온 값: "+ vo);
		
		MemberVO result = memberService.loginCheck(vo);
		System.out.println("로그인/DB결과값: "+ result);
		
	    if (result != null) {
	    	// 입력된 비밀번호와 암호화된 비밀번호 비교
	        if (passwordEncoder.matches(vo.getMember_pw(), result.getMember_pw())) {

	        	//뷰페이지에 데이타 전송 : ${mem.member_name}
	            model.addAttribute("mem", result);
	            
	            //세션에 저장(모든 화면에서 데이터 사용 가능) : ${sessionScope.member.member_name}
	            session.setAttribute("member", result);
	            
	            return "redirect:/";
	        } else {
	        	System.out.println("비밀번호가 일치하지 않습니다.");
	            return "member/loginRe";
	        }
	    } else {
	    	System.out.println("사용자 정보가 없습니다.");
	        return "member/loginRe";
	    }
	}
	
	//####추가 개발사항
	//로그인시 사용자의 신고건수가 있을 경우 팝업으로 신고내용을 안내(1회만) => member_reportcount 1로 변경해줌.
					
	
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

// 7/29(월) -------------------------------------------------------------------------------------------	

	// 임시비밀번호 이메일 전송 : DB 비밀번호 변경
	@RequestMapping(value = "/pw_change", method = RequestMethod.POST)
    public String sendPw(@RequestParam("member_email") String member_email, Model model, MemberVO vo) {

        Integer emailExists = memberService.mailCheck(member_email);

        if (emailExists != 0) {
            // 임시 비밀번호 생성
            String tempPassword = getTempPswd(15);
            // 이메일로 임시 비밀번호 전송
            mailService.sendTemporaryPassword(member_email, tempPassword);

            // 사용자의 비밀번호를 임시 비밀번호로 변경
            String enPass = passwordEncoder.encode(tempPassword);
            memberService.changePass(member_email, enPass);

            model.addAttribute("result", "임시 비밀번호가 이메일로 전송되었습니다.");
        } else {
        	model.addAttribute("result", "해당 이메일이 존재하지 않습니다.");
        }
        return "member/pw_change"; // JSP 파일 경로
    }

    // 비밀번호 랜덤 생성
    private String getTempPswd(int len) {
        char[] charSet = new char[] { 
            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
            'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 
            'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
            'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' 
        };
        int idx;
        StringBuilder buffer = new StringBuilder();
        for(int i = 0; i < len; i++) {
            idx = (int) (charSet.length * Math.random());
            buffer.append(charSet[idx]);
        }
        return buffer.toString();
    }	
	


	    	   
	
	
}
