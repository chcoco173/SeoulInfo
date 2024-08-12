package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.NewsVO;
import com.example.service.NewsService;

//import com.example.service.MemberService;

@Controller
@RequestMapping("/news")
//@SessionAttributes("mem") //Model 객체에 member라고 저장된 객체를 세션에 등록한다.
public class NewsController {
	
	// 로그파일 설정
//	static final Logger logger = LoggerFactory.getLogger(MemberController.class);
//	
//	@Autowired
//	private MemberService memberservice;
	
	@Autowired
	private NewsService newsService;

	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("/{step}")
	public String newsViewPage(@PathVariable String step) {
		System.out.println(step);
		return "news/"+step;
	}

	// Model model 변수 이름 고정하기!
	@GetMapping("/news")
	public String newsArea(@RequestParam(value = "area", required = false) String area, Model model) {
		List<NewsVO> newsList = newsService.getNewsList(area);
		
		model.addAttribute("newsList", newsList);
		return "news/news";
	}
	
	
}
