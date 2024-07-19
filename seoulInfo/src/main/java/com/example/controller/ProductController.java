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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;


import com.example.domain.ProductImageVO;
import com.example.domain.ProductSearchVO;
import com.example.domain.ProductVO;
import com.example.service.ProductImageService;
import com.example.service.ProductService;
import com.example.util.MD5Generator;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/product")
public class ProductController {

	// flask url ( ml )
	private final String mlServerUrl = "http://localhost:5000/predict";

	// 빈설정 필수 (AppConfig.java에 설정해둠)
	@Autowired
	private RestTemplate restTemplate; // http 요청을 구성하고 응답을 처리할 수 있는 메서드 제공,  간편하게 Rest 방식 API를 호출할 수 있는 Spring 내장 클래스


	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImageService productImageService;


	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}


	@RequestMapping("/{step}")
	public String festivalViewPage(@PathVariable String step) {
		System.out.println(step);
		return "product/"+step;
	}

	// 상품 검색 기능 (select + insert)
	@GetMapping("/productSearch")
	public String productSearch(@RequestParam(value="productsearch_keyword", required = false) String keyword, String area,  Model model) {
		System.out.println(area);
		System.out.println(keyword);

		HashMap map = new HashMap();
		map.put("area", area);
		map.put("keyword", keyword);


		ProductSearchVO psvo = new ProductSearchVO();
		psvo.setProductsearch_keyword(keyword);
		// 나중에 세션으로 들어갈 예정
		psvo.setMember_id("chen0120");

		// 검색결과 리스트 
		List<Map<String, Object>> productList = productService.productCateList(map);

		// 검색 keyword insert
		productService.insertProductSearch(psvo);

		model.addAttribute("category", "검색결과");
		model.addAttribute("productList",productList);

		return "product/productCategory";
	}


	// 상품리스트 출력 + ml 완료 ( select + ml )
	@GetMapping("/productMain")
	public String productArea(@RequestParam(value = "area", required = true) String area, Model model) {

		if(area == null || area.isEmpty()) {
			area="전체";
		}
		HashMap map = new HashMap();
		map.put("area", area);

		// flask 로 보낼 객체 생성
		Map<String, String> requestBody = new HashMap<>();
		requestBody.put("id", "chen0120"); // 나중엔 세션으로 들어갈 예정


		try {
			// Flask 서버로 POST 요청 + 응답 받기
			String result = restTemplate.postForObject(mlServerUrl, requestBody, String.class); // url, 요청본문, 응답받는타입
			System.out.println("Prediction result: " + result); // json 형식
			
			// JSON 응답 파싱
            ObjectMapper objectMapper = new ObjectMapper(); // json 데이터를 파싱하기위한 객체생성
            JsonNode jsonNode = objectMapper.readTree(result);	// 문자열 파싱후 json 트리 구조를 반환
            String prediction = jsonNode.get("prediction").asText(); // asText() jsonNode의 텍스트값 반환
            System.out.println(prediction);
            
    		map.put("prediction", prediction);

    		
		} catch (Exception e) {
			e.printStackTrace();
			// 서버가 꺼졋을대 대비
			map.put("prediction", "null");	
		}
		
		List<Map<String, Object>> productList = productService.productCateList(map);

		System.out.println(productList);
		model.addAttribute("productList", productList);


		return "product/productMain";
	}


	// 7/12 오전 추가 ( 각 카테고리 상픔 list 출력 ) (select)
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

		List<Map<String, Object>> productList = productService.productCateList(map);

		System.out.println(productList);

		// 모델에 카테고리 속성 추가
		model.addAttribute("category", category);
		model.addAttribute("productList", productList);

		return "product/productCategory";
	}

	// 상품 등록 controller (insert)
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

	// 내상품 select
	@RequestMapping("/myProduct")
	public String myProduct(Model model) {
		// 세션에서 id 값 받아오기 ( 나중 )
		String member_id = "chen0120";
		
		List<Map<String, Object>> myProductList = productService.myProductList(member_id);
		System.out.println(myProductList);
		model.addAttribute("myProductList", myProductList);
		
		return "product/myProduct";
	}
	
	// 상품 id 값 가지고 해당 상품에 대한 내용 화면에 뿌려주는 작업
	@RequestMapping("/productUpdateData")
	public String productUpdateData(Integer sale_id, Model model) {
		System.out.println(sale_id);
		
		ProductVO pvo = productService.myProductSaleId(sale_id);
		List<ProductImageVO> imageList = productImageService.myProductSaleId(sale_id);
		
		model.addAttribute("productSaleId", pvo);
		model.addAttribute("productImageSaleId",imageList);
		
		System.out.println(pvo);
		System.out.println(imageList);
		
		
		return "product/productUpdate";
	
	}
	
	// 상품 이미지 삭제 ajax 처리
	@PostMapping("deleteImage")
	@ResponseBody
	public String deleteImage(@RequestParam Integer productimg_no) {
	    System.out.println("이미지번호 " + productimg_no);
	    
	    Integer result = productImageService.deleteImage(productimg_no);
	    
	    if ( result != null) {
	    	return "1";
	    }
	    
	    return null;
	}
	
	
}
