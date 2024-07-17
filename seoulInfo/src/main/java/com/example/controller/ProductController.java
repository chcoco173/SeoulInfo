package com.example.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


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
	
//	// 해당 지역 상품 전체 조회
//	@RequestMapping("/getProductList")
//	public void getProductList(Model m, String sale_area) {
//		ProductVO vo = new ProductVO();
//		List<ProductVO> list = productService.getProductList(sale_area);
//		m.addAttribute("productList", list);
//	}
//	
//	// 상품 글 상세보기
//	@RequestMapping("/getProduct")
//	public void getProduct(ProductVO vo, Model m) {
//		ProductVO result = productService.getProduct(vo);
//		m.addAttribute("product",result);
//	}
//	
////	// 상품 등록
////   @RequestMapping("/insertProduct")
////   public String insertProduct( @RequestParam("productimg_no") MultipartFile files, ProductVO vo) {
////      
////     
////   }
//
//	// 상품 글 수정하기
//	@RequestMapping("/updateProduct")
//	public String updateProduct(ProductVO vo) {
//		productService.updateProduct(vo);
//		return "redirect:/product/productMain";
//	}
//	
//	// 상품 글 삭제하기
//	@RequestMapping("/deleteProduct")
//	public String DeleteProduct(ProductVO vo) {
//		productService.deleteProduct(vo);
//		return "redirect:/product/productMain";
//	}
	
	
}
