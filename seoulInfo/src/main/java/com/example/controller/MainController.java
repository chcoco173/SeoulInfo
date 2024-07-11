package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}
	

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		System.out.println(step);
		return step;
	}
	
	
	
}
