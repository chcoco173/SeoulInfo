package com.example.controller;

import java.io.File;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.example.domain.EVStationVO;
import com.example.domain.MemberVO;
import com.example.domain.MypageProductVO;
import com.example.domain.QuestionVO;
import com.example.service.MemberService;
import com.example.util.MD5Generator;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/mypage")
//@SessionAttributes("mem") //Model 객체에 member라고 저장된 객체를 세션에 등록한다.
public class MypageController {
	
	// 로그파일 설정
	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/{step}")
	public String mypageViewPage(@PathVariable String step) {
		System.out.println(step);
		return "mypage/"+step;
	}
	

	//8/6(화) 프로필 사진 등록
	@RequestMapping("/updateProfile")
	public String updateProfile(@RequestParam("file") MultipartFile file, MemberVO vo, Model model, HttpSession session) {
		
		try {
			//파일의 원래 이름
			String originFilename = file.getOriginalFilename();
			System.out.println("원래파일명 :" + originFilename);
			
			//파일첨부를 한 경우라면
			if(originFilename != null && !originFilename.equals("")) {
				// MD5Generator로 파일 이름 생성
				String filename = new MD5Generator(originFilename).toString();
				System.out.println("변경파일명 :"+ filename);
				/* *********** 
				 * [1] 추후 작업 : 확장자가 필요하다면
				 * 
				 * 
				 */
				
				//정해진 폴더를 지정
//				String savepath = System.getProperty("user.dir") 
//						+ "\\src\\main\\resources\\static\\files";
//				System.out.println("저장경로 :"+ savepath);
				String savepath = System.getProperty("user.dir") 
                        + File.separator + "src" 
                        + File.separator + "main" 
                        + File.separator + "resources" 
                        + File.separator + "static" 
                        + File.separator + "files";
                System.out.println("저장경로 :" + savepath);
				/* *********** 
				 * [2]
				 * 
				 */
				
				//저장 경로 생성
				File directory = new File(savepath);
                if (!directory.exists()) {
                    directory.mkdirs();
                }
				
				// 실제 저장되는 파일
				//String filepath = savepath + "\\" + filename;
                String filepath = Paths.get(savepath, filename).toString();
				file.transferTo(new File(filepath));
				System.out.println(filepath + " => 저장되었음");
				
				// 디비저장
				//MemberVO fileVO = new MemberVO();
				vo.setMember_imageOrigin(originFilename);
				vo.setMember_imageName(filename);
				vo.setMember_imagePath(filepath);
				System.out.println("디비저장 :"+ vo);								
				
			} else {
				//파일을 첨부하지 않은 경우
				System.out.println("파일을 첨부하지 않았습니다.");
				model.addAttribute("message","파일을 첨부하지 않았습니다.");
				model.addAttribute("statue","error");
			}
			// 파일을 첨부한 경우
            memberService.updateProfile(vo);
            model.addAttribute("message", "프로필이 성공적으로 업로드되었습니다.");
            model.addAttribute("status", "success");
            model.addAttribute("mem",vo);
			
			
		}catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("message", "업로드 중 오류가 발생했습니다.");
            model.addAttribute("status", "error");
		}
		// 수정된 프로필 정보를 데이터베이스에서 다시 조회
		MemberVO updateProfile = memberService.getMemberById(vo.getMember_id());
	    System.out.println("프로필정보수정/DB결과값: " + updateProfile);

	    // 세션에서 프로필 정보를 업데이트
	    session.setAttribute("member", updateProfile);
	    model.addAttribute("message", "프로필이 성공적으로 업로드되었습니다.");		
		
	    
		return "redirect:/mypage/profile";
	}
	
	//8/6(화) 프로필 사진 삭제
	@RequestMapping("/deleteProfile")
	public String deleteProfile(MemberVO vo, Model model, HttpSession session) {

	    vo.setMember_imageOrigin(null);
	    vo.setMember_imageName(null);
	    vo.setMember_imagePath(null);
	    memberService.updateProfile(vo);  // 서비스에서 DB 업데이트 수행
	    model.addAttribute("message", "프로필이 성공적으로 삭제되었습니다.");
	    
		// 삭제된 프로필 정보를 데이터베이스에서 다시 조회
		MemberVO updateProfile = memberService.getMemberById(vo.getMember_id());
	    System.out.println("프로필정보삭제/DB결과값: " + updateProfile);

	    // 세션에서 프로필 정보를 업데이트
	    session.setAttribute("member", updateProfile);
	    model.addAttribute("message", "프로필이 성공적으로 삭제되었습니다.");	    
	    	    
	    
	    return "redirect:/mypage/profile";
	}
	
	
	// 8/7 마이페이지/전기차 즐겨찾기 리스트 조회
    @GetMapping("/ev")
    public String getEvList(HttpSession session, Model model) {
        // 세션에서 member 객체 가져오기
        MemberVO member = (MemberVO) session.getAttribute("member");

        if (member != null && member.getMember_id() != null) {
            String memberId = member.getMember_id();
            List<EVStationVO> evList = memberService.getEvList(memberId);
            System.out.println("전기차 즐겨찾기 리스트: " + evList);

            model.addAttribute("evList", evList); // 모델에 추가
            return "mypage/ev"; // 뷰 이름 반환
        } else {
            // 로그인 페이지 또는 오류 페이지로 리다이렉션
            return "redirect:/login";
        }
    }	
	
    // 8/7 마이페이지/전기차 즐겨찾기 리스트 삭제
    @RequestMapping("/deleteEv")
    public String deleteEv(@RequestParam("evc_id") String evc_id, 
                           @RequestParam("member_id") String member_id, 
                           RedirectAttributes redirectAttributes) {
        boolean deleted = memberService.deleteEv(evc_id, member_id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "즐겨찾기가 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("error", "즐겨찾기를 삭제할 수 없습니다.");
        }
        return "redirect:/mypage/ev"; // 리다이렉트 경로
    }
    
    
    // 8/7 마이페이지/관심상품 조회
    @GetMapping("/product")
    public String getProductList(HttpSession session, Model model) {
        // 세션에서 member 객체 가져오기
        MemberVO member = (MemberVO) session.getAttribute("member");
        
        if (member != null && member.getMember_id() != null) {
            String memberId = member.getMember_id();
            // 관심 상품 리스트 가져오기
            List<MypageProductVO> productList = memberService.getProductList(memberId);
            System.out.println("관심상품 조회 : " + productList);

            model.addAttribute("productList", productList); // 모델에 추가
            return "mypage/product"; // 뷰 이름 반환
        } else {
            // 로그인 페이지 또는 오류 페이지로 리다이렉션
            return "redirect:/login";
        }                       
    }
    
    // 8/7 마이페이지/관심상품 삭제
    @RequestMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("sale_id") String sale_id, 
                           @RequestParam("member_id") String member_id, 
                           RedirectAttributes redirectAttributes) {
        boolean deleted = memberService.deleteProduct(sale_id, member_id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "관심상품이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("error", "관심상품을 삭제할 수 없습니다.");
        }
        return "redirect:/mypage/product"; // 리다이렉트 경로
    }
    
    // 8/8 마이페이지/1:1문의 등록    
    @RequestMapping("/saveQuestion")
    public String insertQuestion(QuestionVO vo, HttpSession session, Model model) {
        System.out.println("saveQuestion");
        
        // 세션에서 member 객체 가져오기
        MemberVO member = (MemberVO) session.getAttribute("member");
        if (member != null) {
            vo.setMember_id(member.getMember_id());
        } else {
            // 예외 처리: 회원 정보가 없는 경우
            model.addAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // QuestionVO 객체에 값이 제대로 설정되었는지 로그로 확인
        System.out.println("Question Category: " + vo.getQuestion_cate());
        System.out.println("Question Title: " + vo.getQuestion_title());
        System.out.println("Member ID: " + vo.getMember_id());

        memberService.insertQuestion(vo);               
        
        return "redirect:/mypage/question"; // 질문 목록 페이지로 리다이렉트
    }    
    
    // 8/8 마이페이지/1:1문의 리스트 조회(전체)
    @GetMapping("/question")
    public String getQuestionList(HttpSession session, Model model) {
        // 세션에서 member 객체 가져오기
        MemberVO member = (MemberVO) session.getAttribute("member");
        
        if (member != null && member.getMember_id() != null) {
            String memberId = member.getMember_id();
            // 관심 상품 리스트 가져오기
            List<QuestionVO> questionList = memberService.getQuestionList(memberId);
            System.out.println("1:1문의리스트 조회 : + questionList" );

            model.addAttribute("questionList", questionList); // 모델에 추가
            session.setAttribute("questionList", questionList);
            
            return "mypage/question"; // 뷰 이름 반환
        } else {
            // 로그인 페이지 또는 오류 페이지로 리다이렉션
            return "redirect:/login";
        }                       
    } 
    
    // 8/9 마이페이지/1:1문의 삭제
    @RequestMapping("/deleteQuestion")
    public String deleteQuestion(@RequestParam("question_no") String question_no, 
                           @RequestParam("member_id") String member_id, 
                           RedirectAttributes redirectAttributes) {
        boolean deleted = memberService.deleteQuestion(question_no, member_id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "1:1문의글이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("error", "1:1문의글을 삭제할 수 없습니다.");
        }
        return "redirect:/mypage/question"; // 리다이렉트 경로
    }
    
    // 8/9 마이페이지/1:1문의 세부내용조회      
    @GetMapping("/selectQuestion2")
    @ResponseBody
    public Map<String, Object> selectQuestion2(@RequestParam("question_no") Integer question_no, HttpSession session) {
    	
    	MemberVO member = (MemberVO) session.getAttribute("member");
    	
    	String member_id =  member.getMember_id(); 
    	
    	System.out.println(question_no + "/" + member_id);
    	
    	QuestionVO qvo = new QuestionVO();
    	qvo.setMember_id(member_id);
    	qvo.setQuestion_no(question_no);
    	
    	
    	QuestionVO question = memberService.selectQuestion(qvo);
    	System.out.println(question.toString());
    	Map<String, Object> response = new HashMap<>();
    	response.put("status", "success");
        response.put("question", question);
    	
    	return response;
    }  
    
    
    
    
    
    
    
 
	

}
