package com.example.controller;


import java.io.File;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.FavoriteProductVO;
import com.example.domain.MemberVO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductSearchVO;
import com.example.domain.ProductVO;
import com.example.service.ProductImageService;
import com.example.service.ProductService;
import com.example.util.MD5Generator;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/product")
public class ProductController {

	// flask url ( ml )
	private final String mlServerUrl = "http://localhost:5000/predict";

	private final String mlServerUrl2 = "http://localhost:5000/productDetail2";


	// 빈설정 필수 (AppConfig.java에 설정해둠)
	@Autowired
	private RestTemplate restTemplate; // http 요청을 구성하고 응답을 처리할 수 있는 메서드 제공,  간편하게 Rest 방식 API를 호출할 수 있는 Spring 내장 클래스


	@Autowired
	private ProductService productService;

	@Autowired
	private ProductImageService productImageService;


	@Autowired
	private HttpSession session;

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

		// 세션값 받아오기
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		if(mvo != null) {
			// 나중에 세션으로 들어갈 예정
			psvo.setMember_id(mvo.getMember_id());
			// 검색 keyword insert
			productService.insertProductSearch(psvo);
		}


		// 검색결과 리스트 
		List<Map<String, Object>> productList = productService.productCateList(map);
		System.out.println(productList);


		model.addAttribute("category", "검색결과");
		model.addAttribute("keyword", keyword);
		model.addAttribute("productList",productList);
		model.addAttribute("timeDataList",timeConversion(productList));

		return "product/productCategory";
	}


	// 상품리스트 출력 + ml 완료 ( select + ml ) 7/31 페이징 구현
	@GetMapping("/productMain")
	public String productArea(
			@RequestParam(value = "area", required = true) String area, Model model,
			 @RequestParam(defaultValue = "1") int page, 
		     @RequestParam(defaultValue = "12") int size) {
		
		int offset = (page - 1) * size;
		
		if(area == null || area.isEmpty()) {
			area="전체";
		}
		HashMap map = new HashMap();
		map.put("area", area);
		map.put("offset", offset);
		map.put("limit", size);
		
		System.out.println(map.toString());
		// 세션값 받아오기
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		// 세션값이 null이 아니라면
		if(mvo != null) {
			// 세션안의 id를 받아오기
			String memberId = mvo.getMember_id();

			// flask 로 보낼 객체 생성
			Map<String, String> requestBody = new HashMap<>();
			requestBody.put("id", memberId); // 나중엔 세션으로 들어갈 예정


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
		}else {
			map.put("prediction", "null");	
		}

		// 상품 list
		List<Map<String, Object>> productList = productService.productMainList(map);
		System.out.println(productList);
		int totalCount = productService.countItems(map);
        int totalPages = (int) Math.ceil((double) totalCount / size);
        

		model.addAttribute("productList", productList);

		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(productList));
		
		model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        System.out.println(totalPages);

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


		// 모델에 카테고리 속성 추가
		model.addAttribute("category", category);
		model.addAttribute("productList", productList);
		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(productList));

		return "product/productCategory";
	}

	// 상품 등록 controller (insert)
	@PostMapping("/insertProduct")
	@Transactional
	public String insertProduct(ProductVO pvo, @RequestParam("file") List<MultipartFile> files) {

		// 세션 받아오기
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		pvo.setMember_id(mvo.getMember_id());

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
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		List<Map<String, Object>> myProductList = productService.myProductList(mvo.getMember_id());
		System.out.println(myProductList);


		// 결과를 저장할 배열
		String[] dateList = new String[myProductList.size()];

		// 날짜 포맷터 설정
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		for (int i = 0; i < myProductList.size(); i++) {
			Map<String, Object> product = myProductList.get(i);
			Object regdateObject = product.get("sale_regdate");

			if (regdateObject instanceof LocalDateTime) {
				LocalDateTime regdate = (LocalDateTime) regdateObject;
				String formattedDate = regdate.format(formatter); // LocalDateTime을 지정된 포맷으로 변환
				dateList[i] = formattedDate; // 결과 배열에 저장
				System.out.println(formattedDate);
			} else {
				dateList[i] = "Invalid date format for 'sale_regdate'";
			}


		}
		model.addAttribute("myProductList", myProductList);
		model.addAttribute("timeDataList", dateList);

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

	// 상품 상태 수정 ajax
	@PostMapping("updateStatus")
	@ResponseBody
	public String updateStatus(@RequestParam String sale_status, @RequestParam Integer sale_id) {
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		ProductVO pvo = new ProductVO();
		pvo.setMember_id(mvo.getMember_id());
		pvo.setSale_id(sale_id);
		pvo.setSale_status(sale_status);

		Integer result =  productService.updateStatus(pvo);

		if ( result != null) {
			return "1";
		}

		return null;

	}

	// 상품 삭제 ajax
	@PostMapping("deleteProduct")
	@ResponseBody
	@Transactional
	public String deleteProduct(@RequestParam Integer sale_id) {
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		ProductVO pvo = new ProductVO();
		pvo.setSale_id(sale_id);
		pvo.setMember_id(mvo.getMember_id());

		Integer imageResult =  productImageService.deleteProductImage(sale_id);

		// 상품 삭제
		Integer productResult = productService.deleteProduct(pvo);

		return "1";
	}


	// 상품 수정
	@RequestMapping("/productUpdate")
	@Transactional
	public String updateProduct( @RequestParam("file") List<MultipartFile> files, ProductVO pvo ) {
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		// 임의로 지정
		pvo.setMember_id(mvo.getMember_id());
		// 상품수정
		productService.updateProduct(pvo);

		try {
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
					pivo.setSale_id(pvo.getSale_id());
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


	// 상품 id에 대한 내용
	@GetMapping("/detail_post")
	public String detailProduct(@RequestParam Integer sale_id, Model model) {
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println(sale_id);
		// 조회수 증가
		productService.productViewCountUpdate(sale_id);
		ProductVO product = productService.myProductSaleId(sale_id);
		List<ProductImageVO> productImgList = productImageService.myProductSaleId(sale_id);
		Boolean wishCheck = false;
		// 세션 값이 널이 아닌경우에만 실행
		if(mvo != null) {
			FavoriteProductVO fpvo = new FavoriteProductVO();
			fpvo.setMember_id(mvo.getMember_id());
			fpvo.setSale_id(sale_id);

			wishCheck = productService.wishCheck(fpvo);

		}

		// 유사상품 구현 ( ml )
		Map<String, String>  requestBody = new HashMap<>();
		requestBody.put("title", product.getSale_name());
		requestBody.put("cate", product.getSale_cate());


		try {
			// Flask 서버로 POST 요청 + 응답 받기
			String result = restTemplate.postForObject(mlServerUrl2, requestBody, String.class); // url, 요청본문, 응답받는타입
			System.out.println("Prediction result: " + result); // json 형식

			// JSON 응답 파싱
			ObjectMapper objectMapper = new ObjectMapper(); // json 데이터를 파싱하기위한 객체생성
			JsonNode jsonNode = objectMapper.readTree(result);	// 문자열 파싱후 json 트리 구조를 반환

			// JSON 배열 파싱
			JsonNode predictionNode = jsonNode.get("prediction");
			int[] prediction;
			if (predictionNode.isArray()) {
				prediction = new int[predictionNode.size()];
				for (int i = 0; i < predictionNode.size(); i++) {
					// sale_id는 제외시키기
					if(sale_id != predictionNode.get(i).asInt()) { // asInt -> jsonNode 클래스에서 제공하는 메서드로 json 노드의 값을 전수로 변환하는데 사용
						prediction[i] = predictionNode.get(i).asInt();
					}

				}
			} else {
				// 예외 처리 또는 기본값 설정 (필요에 따라)
				prediction = new int[0];
			}

			if(prediction != null) {
				List<Map<String, Object>> similarList = productService.similarList(prediction);
				System.out.println(similarList);
				model.addAttribute("similarList", similarList);
				model.addAttribute("timeDataList", timeConversion(similarList));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	

		model.addAttribute("product", product);
		model.addAttribute("productImgList", productImgList);
		model.addAttribute("wishCheck", wishCheck);


		return "product/detail_post";
	}

	// 위시등록
	@ResponseBody
	@PostMapping("/wishInsert")
	public String wishInsert(@RequestParam Integer sale_id) {
		FavoriteProductVO fpvo = new FavoriteProductVO();
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		fpvo.setMember_id(mvo.getMember_id());
		fpvo.setSale_id(sale_id);

		Integer result = productService.insertFavProduct(fpvo);
		System.out.println(result);
		if ( result != null) {
			return "1";
		}

		return null;
	}

	// 위시제거
	@ResponseBody
	@PostMapping("/wishDelete")
	public String wishDelete(@RequestParam Integer sale_id) {
		FavoriteProductVO fpvo = new FavoriteProductVO();
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		fpvo.setMember_id(mvo.getMember_id());
		fpvo.setSale_id(sale_id);

		Integer result = productService.deleteFavProduct(fpvo);
		System.out.println(result);
		if ( result != null) {
			return "1";
		}

		return null;
	}

	// 마이페이지 내 상품 조회
	@RequestMapping("/productMypage")
	public String productMypage( Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		List<Map<String, Object>> myProductList = productService.myProductList(mvo.getMember_id());

		model.addAttribute("myProductList", myProductList);
		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(myProductList));

		return "product/productMypage";
	}


	// wishlist 출력
	@RequestMapping("/wishlist")
	public String wishList( Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		List<Map<String, Object>> wishList = productService.wishList(mvo.getMember_id());
		System.out.println(wishList);
		model.addAttribute("wishList", wishList);

		return "product/wishlist";
	}

	// wish 삭제 ajax deleteWish
	@ResponseBody
	@PostMapping("/deleteWish")
	public String deleteWish(@RequestParam Integer sale_id) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		FavoriteProductVO fpvo = new FavoriteProductVO();
		fpvo.setSale_id(sale_id);
		fpvo.setMember_id(mvo.getMember_id());

		Integer result = productService.deleteFavProduct(fpvo);

		if(result != null) {
			return "1";
		}

		return null;
	}

	// detail_post에서 id 눌렀을때
	@RequestMapping("/productMemberPage")
	public String productMemberPage(String member_id, Model model) {
		System.out.println(member_id);
		List<Map<String, Object>> myProductList = productService.myProductList(member_id);

		model.addAttribute("myProductList", myProductList);
		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(myProductList));

		return "product/productMemberPage";
	}


	// 카테고리 옵션 
	@RequestMapping("/categoryOptionSelect")
	public String categoryOptionSelect(String area, String cate, String type, Model model) {
		System.out.println(area);
		HashMap map = new HashMap();
		map.put("optionCate", cate);
		map.put("optionType", type);
		map.put("area", area);


		System.out.println(map.toString());		
		List<Map<String, Object>> productList = productService.productCateList(map);

		System.out.println(productList);

		model.addAttribute("category",cate);
		model.addAttribute("productList", productList);
		model.addAttribute("timeDataList", timeConversion(productList));
		return "product/productCategory";
	}

	// 겁색결과 옵션
	@RequestMapping("searchOptionSelect")
	public String searchOptionSelect(String keyword, String type, String area, Model model) {
		HashMap map = new HashMap();
		map.put("keyword", keyword);
		map.put("optionType", type);
		map.put("area", area);


		List<Map<String, Object>> productList = productService.productCateList(map);
		model.addAttribute("category","검색결과");
		model.addAttribute("productList", productList);
		model.addAttribute("timeDataList", timeConversion(productList));

		return "product/productCategory"; 
	}



	// 시간 변환 메소드
	public String[] timeConversion(List<Map<String, Object>> productList ) {
		LocalDateTime now = LocalDateTime.now();

		// 결과를 저장할 배열
		String[] timeDataList = new String[productList.size()];

		for (int i = 0; i < productList.size(); i++) {
			Map<String, Object> product = productList.get(i);
			Object regdateObject = product.get("sale_regdate");

			System.out.println(regdateObject.getClass().getName()); // type : java.time.LocalDateTime

			// regdateObject의 타입을 확인하고 출력
			if (regdateObject instanceof LocalDateTime) {

				// 일, 시, 분, 초 비교
				LocalDateTime regdateTime = (LocalDateTime) regdateObject;


				// LocalDateTime을 ZonedDateTime으로 변환하여 Duration을 사용
				ZonedDateTime nowZoned = now.atZone(ZoneId.systemDefault());
				ZonedDateTime regdateZoned = regdateTime.atZone(ZoneId.systemDefault());
				Duration duration = Duration.between(regdateZoned, nowZoned);


				// 밀리초, 분, 시간, 일로 변환
				long differenceInMillis = duration.toMillis();
				long differenceInMinutes = duration.toMinutes();
				long differenceInHours = duration.toHours();
				long differenceInDays = duration.toDays();


				String result;
				if (differenceInDays > 0) {
					// 하루 이상 지난 경우
					result = differenceInDays + "일 전";
					System.out.println(result);
				} else if (differenceInHours > 0) {
					// 하루는 안 지났으나, 몇 시간 지난 경우
					result = differenceInHours + "시간 전";
					System.out.println(result);
				} else {
					// 하루도 안 지났고, 몇 분 지난 경우
					result = differenceInMinutes + "분 전";
					System.out.println(result);
				}

				timeDataList[i] = result; // 결과 배열에 저장
			} else {
				timeDataList[i] = "Invalid date format for 'sale_regdate'";
			}
		}

		return timeDataList;
	}

	// 채팅에서 상품 정보 가져오기
	@GetMapping("/getProductInfo")
	@ResponseBody
	public Map<String, Object> getProductInfo(@RequestParam Integer sale_id) {
		System.out.println("Fetching product info for sale_id: " + sale_id);
		ProductVO product = productService.myProductSaleId(sale_id);
		List<ProductImageVO> productImages = productImageService.myProductSaleId(sale_id);

		System.out.println("Product: " + product);
		System.out.println("Product Images: " + productImages);

		Map<String, Object> productInfo = new HashMap<>();
		productInfo.put("product", product);

		// 첫 번째 이미지만 가져오기
		if (!productImages.isEmpty()) {
			productInfo.put("productImage", productImages.get(0));
		} else {
			System.out.println("No images found for sale_id: " + sale_id);
		}

		System.out.println("Product Info: " + productInfo);

		return productInfo;
	}


}
