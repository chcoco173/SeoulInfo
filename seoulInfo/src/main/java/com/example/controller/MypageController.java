package com.example.controller;

import java.io.File;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.MemberVO;
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
	
	// 관심상품 목록 출력
//    @GetMapping("/products")
//    public String getProductList() {
//        return "productList";
//    }
//
//    @GetMapping("/product/{id}")
//    public String getProductDetail(@PathVariable Long id, Model model) {
//        model.addAttribute("productId", id);
//        return "productDetail";
//    }


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
	

}
