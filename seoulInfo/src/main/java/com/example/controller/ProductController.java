package com.example.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.FestivalVO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductVO;
import com.example.service.ProductService;
import com.example.util.MD5Generator;


@Controller
@RequestMapping("/product")
public class ProductController {


	@Autowired
	private ProductService productService;


	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}


	@RequestMapping("/{step}")
	public String festivalViewPage(@PathVariable String step) {
		System.out.println(step);
		return "product/"+step;
	}

	// 상품리스트 출력
	@GetMapping("/productMain")
	public String productArea(@RequestParam(value = "area", required = false) String area, Model model) {
		if(area == null || area.isEmpty()) {
			area="전체";
		}
		List<Map<String, Object>> productList = productService.productList(area);
		System.out.println(productList);
		model.addAttribute("productList", productList);

		return "product/productMain";
	}



	// 7/12 오전 추가
	@GetMapping("/productCategory")
	public String productCategory(@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "area", required = false) String area, Model model) {
		// 카테고리가 null이거나 빈 문자열이면 기본값 설정
		if (category == null || category.isEmpty()) {
			category = "기타";
		}
		if(area == null || area.isEmpty()) {
			area="전체";
		}
		HashMap map = new HashMap();
		map.put("category", category);
		map.put("area", area);

		System.out.println(category);

		List<Map<String, Object>> productCateList = productService.productCateList(map);

		System.out.println(productCateList);

		// 모델에 카테고리 속성 추가
		model.addAttribute("category", category);
		model.addAttribute("productCateList", productCateList);

		return "product/productCategory";
	}

	// 상품 등록 controller
	@PostMapping("/insertProduct")
	public String insertProduct(ProductVO pvo, @RequestParam("file") List<MultipartFile> files) {

		pvo.setMember_id("chen0120");

		try {
			// 상품 등록후 pk 값 가져오기
			Integer sale_id = productService.insertProduct(pvo);

			for (MultipartFile file : files) {
				String productimg_name = file.getOriginalFilename();
				System.out.println(productimg_name + "파일원래이름");

				if( productimg_name != null && !productimg_name.equals("")) {
					String productimg_alias = new MD5Generator(productimg_name).toString();
					System.out.println("변경된 파일명"+productimg_alias);

					String savepath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\productImage";
					System.out.println("저장경로 : " + savepath);

					if (! new File(savepath).exists()) {
						new File(savepath).mkdir();
					}

					String productimg_url = savepath + "\\" + productimg_alias;
					file.transferTo(new File(productimg_url));
					System.out.println("저장완료");

					ProductImageVO pivo = new ProductImageVO();
					pivo.setSale_id(sale_id);
					pivo.setProductimg_name(productimg_name);
					pivo.setProductimg_alias(productimg_alias);
					pivo.setProductimg_url(productimg_url);


					productService.insertProductImage(pivo);

				}
			}


		} catch (Exception e) {
			e.printStackTrace();
		}




		return "redirect:/product/myProduct";

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
