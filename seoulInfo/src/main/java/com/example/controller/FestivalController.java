package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.FestRevImageVO;
import com.example.domain.FestivalVO;
import com.example.service.FestivalReviewService;
import com.example.service.FestivalService;

@Controller
@RequestMapping("/festival")
public class FestivalController {
	
	@Autowired
	private FestivalService festivalService;
	
    @Autowired
    private FestivalReviewService festivalReviewService;
	
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
        }
        
	    model.addAttribute("festival", festival);
	    model.addAttribute("reviewList", reviewList);
	    
	    return "festival/festivalDetail";
	}
	
	// Festival Review page
	@GetMapping("/festivalReview")
	public String festivalReview(@RequestParam("festival_id") Integer festival_id, Model model) {
		model.addAttribute("festival_id", festival_id);
	    return "festival/festivalReview";
	}
	
	// 해당 축제 리뷰의 fr_id 값 가지고 리뷰 상세보기 페이지로 이동
	@GetMapping("/festivalReviewDetail")
	public String festivalReviewDetail(@RequestParam("fr_id") Integer fr_id, Model model) {
		System.out.println("festivalReviewDetail fr_id!!!!!!!!"+fr_id);
	    model.addAttribute("fr_id", fr_id);
	    return "festival/festivalReviewDetail";
	}

	
}
