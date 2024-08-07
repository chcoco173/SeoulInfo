package com.example.controller;

import java.io.File;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.FestRevImageVO;
import com.example.domain.FestivalReviewVO;
import com.example.domain.MemberVO;
import com.example.service.FestivalReviewService;
import com.example.util.MD5Generator;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/festivalReview")
public class FestivalReviewController {
	
    @Autowired
    private FestivalReviewService festivalReviewService;

	@Autowired
	private HttpSession session;


	// 축제리뷰 등록
    @PostMapping("/insertReview")
    @Transactional
    public String insertReview(FestivalReviewVO frvo,
                               @RequestParam("festival_id") Integer festival_id,
                               @RequestParam("fr_title") String fr_title,
                               @RequestParam("fr_content") String fr_content,
                               @RequestParam("file") List<MultipartFile> files
                               ) {
        // 해당 축제 id 설정
        frvo.setFestival_id(festival_id);
        frvo.setFr_title(fr_title);
        frvo.setFr_content(fr_content);
        
		// 현재 로그인한 회원 세션 받아오기
		MemberVO mvo = (MemberVO) session.getAttribute("member");
        if (mvo == null) {
            return "redirect:/member/login"; // Redirect to login if member is not found in session
        }
		frvo.setMember_id(mvo.getMember_id());

        try {
			// 후기 등록 후 pk 값 가져오기
			Integer fr_id = festivalReviewService.insertReview(frvo);
        	
			for (MultipartFile file : files) {
				String fr_imgName = file.getOriginalFilename();
				System.out.println(fr_imgName + "파일원래이름");

				if( fr_imgName != null && !fr_imgName.equals("")) {
					String fr_imgAlias = new MD5Generator(fr_imgName).toString();
					System.out.println("변경된 파일명"+fr_imgAlias);

					String savepath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\festRevImage";
					System.out.println("저장경로 : " + savepath);

					if (! new File(savepath).exists()) {
						new File(savepath).mkdir();
					}

					String fr_imgUrl = savepath + "\\" + fr_imgAlias;
					file.transferTo(new File(fr_imgUrl));
					System.out.println("저장완료");

					FestRevImageVO frivo = new FestRevImageVO();
					frivo.setFr_id(fr_id);
					frivo.setFr_imgName(fr_imgName);
					frivo.setFr_imgAlias(fr_imgAlias);
					frivo.setFr_imgUrl(fr_imgUrl);

					festivalReviewService.insertImage(frivo);

				}
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/festival/festivalDetail?festival_id="+ festival_id;
    }
    
	// 해당 회원이 올린 축제 리뷰 조회


}