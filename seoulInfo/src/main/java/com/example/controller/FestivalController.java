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

import com.example.domain.FestivalVO;
import com.example.service.FestivalService;

@Controller
@RequestMapping("/festival")
public class FestivalController {
	
	@Autowired
	private FestivalService festivalService;
	
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
	
	
	
	
	
}
