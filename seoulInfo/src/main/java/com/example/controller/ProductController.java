package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}
	
	
	@RequestMapping("/{step}")
	public String festivalViewPage(@PathVariable String step) {
		System.out.println(step);
		return "product/"+step;
	}
	
	// 7/12 오전 추가
	@GetMapping("/productCategory")
    public String productCategory(@RequestParam(value = "category", required = false) String category, Model model) {
        // 카테고리가 null이거나 빈 문자열이면 기본값 설정
        if (category == null || category.isEmpty()) {
            category = "기타";
        }
        System.out.println(category);
        // 모델에 카테고리 속성 추가
        model.addAttribute("category", category);
        return "product/productCategory";
    }
	
	
	
	
}
