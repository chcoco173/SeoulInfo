package com.example.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.EVPlacesVO;
import com.example.domain.FestRevCommentVO;
import com.example.domain.FestRevImageVO;
import com.example.domain.FestivalReviewVO;
import com.example.domain.FestivalVO;
import com.example.domain.MemberVO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductVO;
import com.example.service.EVStationService;
import com.example.service.FestRevCommentService;
import com.example.service.FestRevImageService;
import com.example.service.FestivalReviewService;
import com.example.service.FestivalService;
import com.example.service.MemberService;
import com.example.util.MD5Generator;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/festival")
public class FestivalController {
	@Autowired
	private EVStationService evStationService;
	
	@Autowired
	private FestivalService festivalService;
	
    @Autowired
    private FestivalReviewService festivalReviewService;
    
    @Autowired
    private FestRevImageService festRevImageService;
    
    @Autowired
    private FestRevCommentService festRevCommentService;
    
    @Autowired
    private MemberService memberService;
    
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}
	
	
	@RequestMapping("/{step}")
	public String festivalViewPage(@PathVariable String step) {
		System.out.println(step);
		return "festival/"+step;
	}
	
	@GetMapping("/festival")
	public String festivalArea(@RequestParam(value = "area", required = false) String area, Model model) {
		
		System.out.println(area);
		
		HashMap map = new HashMap();
		map.put("area", area);

		
		List<FestivalVO> calenderList = festivalService.getFestivalList(area);
		
		// 페이징
		List<FestivalVO> festivalList = festivalService.getFestivalPaging(map);
		
		
		// 모델에 카테고리 속성 추가
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("calenderList", calenderList);
		
		model.addAttribute("area", area);
		
		return "festival/festival";
	}
	
	@GetMapping("/selectDateList")
	@ResponseBody
	public Map<String, Object> selectDateList(@RequestParam(name = "selectDate", required = false) String selectDate,
	        @RequestParam(name = "area", defaultValue = "전체") String area){
		
	    HashMap map = new HashMap<>();
	    map.put("area", area);
	    map.put("selectDate", selectDate);
	    
	    List<FestivalVO> selectDateList = festivalService.getFestivalPaging(map);    

	    // 결과를 Map에 담아 반환
	    Map<String, Object> result = new HashMap<>();
	    result.put("selectDateList", selectDateList);
	    
	    return result;
	}
	
	// 캘린더 일정 조회수 증가
	@PostMapping("/festivalViewCountUpdate")
	@ResponseBody
	public Map<String, Object> festivalViewCountUpdate(@RequestParam(name="festival_id") Integer festival_id) {
		System.out.println(festival_id);
		
		Integer result = festivalService.festivalViewCountUpdate(festival_id);
		
		Map<String, Object> response = new HashMap<>();
        if(result != null) {
            Integer updatedViewCount = festivalService.viewCountFestivalId(festival_id);
            response.put("status", "success");
            response.put("viewcount", updatedViewCount);
        } else {
            response.put("status", "error");
        }

        return response;
		
	}
	
	// Get festival details
	@GetMapping("/festivalDetail")
	public String getFestivalDetail(@RequestParam("festival_id") Integer festival_id, Model model) {
	    FestivalVO festival = festivalService.getFestivalById(festival_id);

        List<Map<Object, Object>> reviewList = festivalReviewService.getReviewList(festival_id);

        // Fetch the first image for each review
        for (Map<Object, Object> review : reviewList) {
            Integer fr_id = (Integer) review.get("fr_id");
            List<FestRevImageVO> images = festivalReviewService.getReviewImage(fr_id);
            
            if (!images.isEmpty()) {
                // Get the first image
                FestRevImageVO image = images.get(0);
                String imageUrl = "/festRevImage/" + image.getFr_imgAlias();

                review.put("image", imageUrl);
            } else {
                review.put("image", null);
            }
            // Fetch the member's profile image
            String memberId = (String) review.get("member_id");
            MemberVO member = memberService.getMemberById(memberId);
            if (member != null) {
                String memberImageUrl = "/files/" + member.getMember_imageName();
                review.put("memberImageUrl", memberImageUrl);
            } else {
                review.put("memberImageUrl", "/images/mypage/default_profile.jpg"); // 기본 이미지 경로 설정
            }
        }
        
	    model.addAttribute("festival", festival);
	    model.addAttribute("reviewList", reviewList);
	    
	    return "festival/festivalDetail";
	}
	
	// Festival Review page(리뷰등록) 로 이동할 때 수정할 리뷰 정보도 가져오는 부분 추가
	@GetMapping("/festivalReview")
	public String festivalReview(@RequestParam(value = "festival_id", required = false) Integer festival_id, 
	                             @RequestParam(value = "fr_id", required = false) Integer fr_id, Model model) {
	    if (fr_id != null) {
	        FestivalReviewVO review = festivalReviewService.getReview(fr_id);
	        List<FestRevImageVO> images = festRevImageService.getReviewImage(fr_id);
	        FestivalVO festival = festivalService.getFestivalById(review.getFestival_id());

	        // 이미지 경로 설정
	        for (FestRevImageVO image : images) {
	            String imageUrl = "/festRevImage/" + image.getFr_imgAlias();  // URL 경로로 설정
	            image.setFr_imgUrl(imageUrl);  // 이미지 객체에 경로 설정
	            
	            String fr_imgName=image.getFr_imgName();
	            image.setFr_imgName(fr_imgName);	           
	        }
	        model.addAttribute("review", review);
	        model.addAttribute("images", images);
	        model.addAttribute("festival", festival);

	    }
	    model.addAttribute("festival_id", festival_id);
	    return "festival/festivalReview";
	}
	


	// 해당 축제 리뷰의 fr_id 값 가지고 리뷰 상세보기 페이지로 이동하고 댓글 리스트를 가져오기
	@GetMapping("/festivalReviewDetail")
	public String festivalReviewDetail(@RequestParam("fr_id") Integer fr_id, Model model) {
        FestivalReviewVO review = festivalReviewService.getReview(fr_id);
        if (review != null) {
        	
            List<FestRevImageVO> images = festivalReviewService.getReviewImage(fr_id);
            List<FestRevCommentVO> comments = festRevCommentService.getComments(fr_id); // 댓글 리스트 가져오기

            // 이미지 경로 설정
            for (FestRevImageVO image : images) {
                String imageUrl = "/festRevImage/" + image.getFr_imgAlias();
                image.setFr_imgUrl(imageUrl);  // 이미지 객체에 경로 설정
            }
            
            // 리뷰 작성자의 프로필 이미지 경로 설정
            MemberVO member = memberService.getMemberById(review.getMember_id());
            String memberImageUrl = (member != null && member.getMember_imageName() != null) ? 
                                     "/files/" + member.getMember_imageName() : "/images/mypage/default_profile.jpg";
            
            model.addAttribute("review", review);
            model.addAttribute("images", images);
            model.addAttribute("comments", comments); // 댓글 리스트 모델에 추가
            model.addAttribute("memberImageUrl", memberImageUrl); // 프로필 이미지 추가


        }
	    
	    return "festival/festivalReviewDetail";
	}


	// 축제리뷰 등록
    @GetMapping("/insertComment")
    @ResponseBody
    public String insertComment( @RequestParam("fr_id") Integer frId, @RequestParam("comment") String commentContent) {
        MemberVO mvo = (MemberVO) session.getAttribute("member");

        FestRevCommentVO frcvo = new FestRevCommentVO();
        frcvo.setFr_id(frId);
        frcvo.setFrc_content(commentContent);
        frcvo.setMember_id(mvo.getMember_id());

        festRevCommentService.insertComment(frcvo);
        return "success";
    }
    
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

		frvo.setMember_id(mvo.getMember_id());

        try {
			// 후기 등록 후 pk 값 가져오기
			Integer fr_id = festivalReviewService.insertReview(frvo);
        	
			for (MultipartFile file : files) {
				String fr_imgName = file.getOriginalFilename();
				System.out.println(fr_imgName + "파일원래이름");

				if( fr_imgName != null && !fr_imgName.equals("")) {
					String fr_imgAlias = new MD5Generator(fr_imgName).toString();

					String savepath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\festRevImage";

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
    
    
    // 리뷰 삭제 festivalReviewDetail 페이지에서
    @PostMapping("/deleteDetailReview")
    @Transactional
    public String deleteDetailReview(@RequestParam("fr_id") Integer fr_id) {
        try {
            FestivalReviewVO review = festivalReviewService.getReview(fr_id);
            if (review != null) {
                Integer festival_id = review.getFestival_id();
                festivalReviewService.deleteReview(fr_id);

                return "redirect:/festival/festivalDetail?festival_id=" + festival_id;
            } else {
                return "redirect:/error"; // 후기 못 찾았을 때의 리다이렉트
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error"; // 에러가 발생했을 때의 리다이렉트
        }
    }

    // 리뷰 삭제 festivalDetail 페이지에서
    @PostMapping("/deleteReview")
    @Transactional
    @ResponseBody
    public String deleteReview(@RequestParam("fr_id") Integer fr_id) {
        try {
            FestivalReviewVO review = festivalReviewService.getReview(fr_id);
            if (review != null) {
                festivalReviewService.deleteReview(fr_id);
                return "success";
            } else {
                return "review_not_found";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    
	// 리뷰 수정 요청을 처리하는 매핑
    @PostMapping("/updateReview")
    @Transactional
    public String updateReview(FestivalReviewVO frvo,
                               @RequestParam("file") List<MultipartFile> files
                               ) {
    	
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		frvo.setMember_id(mvo.getMember_id());

		festivalReviewService.updateReview(frvo);

        try {
            for (MultipartFile file : files) {
                String fr_imgName = file.getOriginalFilename();
                if (fr_imgName != null && !fr_imgName.equals("")) {
                    String fr_imgAlias = new MD5Generator(fr_imgName).toString();

                    String savepath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\festRevImage";

                    if (!new File(savepath).exists()) {
                        new File(savepath).mkdir();
                    }

                    String fr_imgUrl = savepath + "\\" + fr_imgAlias;
                    file.transferTo(new File(fr_imgUrl));

                    FestRevImageVO frivo = new FestRevImageVO();
                    frivo.setFr_id(frvo.getFr_id());
                    frivo.setFr_imgName(fr_imgName);
                    frivo.setFr_imgAlias(fr_imgAlias);
                    frivo.setFr_imgUrl(fr_imgUrl);

                    festivalReviewService.insertImage(frivo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // fr_id를 사용하여 review 정보를 가져와 festival_id를 가져옴
        FestivalReviewVO review = festivalReviewService.getReview(frvo.getFr_id());
        Integer festival_id = review.getFestival_id();
    	System.out.println("festival_id 나오냥아아ㅏ아"+festival_id);

        return "redirect:/festival/festivalDetail?festival_id=" + festival_id;
    }
    
    // 이미지 하나씩 삭제 
    @PostMapping("/deleteImage")
    @ResponseBody
    public String deleteImage(@RequestParam("fr_imgId") Integer fr_imgId) {
        try {
            Integer result = festRevImageService.deleteImage(fr_imgId);
            if (result != null && result > 0) {
                return "success";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    // 내 댓글 삭제
    @PostMapping("/deleteComment")
    @ResponseBody
    public String deleteComment(@RequestParam("frc_id") Integer frc_id) {
        try {
            festRevCommentService.deleteComment(frc_id);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
  //원 반경 안의 편의시설 정보
  	@GetMapping("/getCircleLocation")
  	@ResponseBody
  	public List<EVPlacesVO> getCircleInfo(double centerLat, double centerLng, double radius, String category){
  		System.out.println("insert getCircleInfo : "+centerLat+","+centerLng+","+radius+",category : "+category);
  		HashMap<String, Object> cmap = new HashMap<String, Object>();
  		cmap.put("centerLat", centerLat);
  		cmap.put("centerLng", centerLng);
  		cmap.put("radius", radius);
  		cmap.put("category", category);
  		List<EVPlacesVO> pvo = evStationService.getCircleInfo(cmap);
  		System.out.println("sent from getCircleInfo: " + pvo);
  		return pvo;
  	}
}
