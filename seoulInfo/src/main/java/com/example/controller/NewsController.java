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

@Controller
@RequestMapping("/news")
public class NewsController {
	
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

	// 구별 뉴스 리스트 가져오기
	@GetMapping("/news")
	public String newsArea(@RequestParam(value = "area", required = false) String area, Model model) {
		List<NewsVO> newsList = newsService.getNewsList(area);
		
		model.addAttribute("newsList", newsList);
		return "news/news";
	}
	
	
}
