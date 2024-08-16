package com.example.controller;


import java.io.File;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.FavoriteProductVO;
import com.example.domain.MemberVO;
import com.example.domain.ProductBuyVO;
import com.example.domain.ProductImageVO;
import com.example.domain.ProductSearchVO;
import com.example.domain.ProductVO;
import com.example.domain.ReviewVO;
import com.example.service.MemberService;
import com.example.service.ProductBuyService;
import com.example.service.ProductImageService;
import com.example.service.ProductService;
import com.example.service.ReviewService;
import com.example.util.CookieUtils;
import com.example.util.MD5Generator;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/product")
public class ProductController {

	// flask url ( ml )
	private final String mlServerUrl = "http://192.168.0.219:5000/predict";

	private final String mlServerUrl2 = "http://192.168.0.219:5000/productDetail2";

	// areaSearchPredict
	private final String areaSearchMl = "http://192.168.0.219:5000/areaSearchPredict";
	
	// 검색어 ml
	private final String searchProductML = "http://192.168.0.219:5000/searchProduct";

	// 빈설정 필수 (AppConfig.java에 설정해둠)
	@Autowired
	private RestTemplate restTemplate; // http 요청을 구성하고 응답을 처리할 수 있는 메서드 제공,  간편하게 Rest 방식 API를 호출할 수 있는 Spring 내장 클래스


	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProductImageService productImageService;

	@Autowired
	private HttpSession session;


	@Autowired
	private ProductBuyService productBuyService;

	@Autowired
	private ReviewService reviewService;


	@Autowired
	private HttpServletRequest request; // 쿠키에서 사용

	//	@Autowired
	//	private HttpServletResponse response;



	@RequestMapping("/")
	public String mainPage() {
		return "/index";
	}


	@RequestMapping("/{step}")
	public String festivalViewPage(@PathVariable String step) {
		System.out.println(step);
		return "product/"+step;
	}

	// Flask 서버 호출 메소드
	private String callMlServer(String url, String key, String value) {
		Map<String, String> requestBody = new HashMap<>();
		requestBody.put(key, value);

		try {
			String result = restTemplate.postForObject(url, requestBody, String.class);
			System.out.println("ML 서버 응답: " + result);

			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(result);
			return jsonNode.get("prediction").asText();
		} catch (Exception e) {
			e.printStackTrace();
			return "server down"; // 서버 꺼졌을때 대비 
		}
	}

	// 쿠키 받기
	public String checkCookie() {
		// 쿠키 읽기
		String cookieName = "guSelect"; // 읽고자 하는 쿠키의 이름
		String cookieValue = CookieUtils.getCookieValue(request, cookieName);

		if (cookieValue != null) {
			// 쿠키 값이 있을 때의 처리
			return cookieValue;
		} else {
			// 쿠키가 없을 때의 처리
			return "전체";
		}
	}

	// 상품 검색 기능 (select + insert)
	@GetMapping("/productSearch")
	public String productSearch(@RequestParam(value="productsearch_keyword", required = false) String productsearch_keyword,  Model model,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size) {
		// 쿠키값
		String area = checkCookie();
		System.out.println("쿠키의 area 값 "+ area);
		System.out.println(productsearch_keyword);

		int offset = (page - 1) * size;

		HashMap map = new HashMap();
		map.put("area", area);
		map.put("keyword", productsearch_keyword);


		ProductSearchVO psvo = new ProductSearchVO();
		psvo.setProductsearch_keyword(productsearch_keyword);
		psvo.setProductsearch_area(area);

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
		
		// 검색 결과가 없는 경우
		if(productList.size() == 0) {
			// 유사상품 구현 ( ml )
			Map<String, String>  requestBody = new HashMap<>();
			requestBody.put("search", productsearch_keyword);
			requestBody.put("area", area);
			try {
				// Flask 서버로 POST 요청 + 응답 받기
				String result = restTemplate.postForObject(searchProductML, requestBody, String.class); // url, 요청본문, 응답받는타입
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
						prediction[i] = predictionNode.get(i).asInt();
					}
				} else {
					// 예외 처리 또는 기본값 설정 (필요에 따라)
					prediction = new int[0];
				}

				if(prediction.length != 0) {

					List<Map<String, Object>> searchList = productService.similarList(prediction);

					model.addAttribute("productList", searchList);
					model.addAttribute("timeDataList", timeConversion(searchList));
					// title
					model.addAttribute("category","'"+productsearch_keyword+"'와(과) 유사한 상품");
					

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else {
			model.addAttribute("productList",productList);
			model.addAttribute("timeDataList",timeConversion(productList));
			// title
			model.addAttribute("category","'"+productsearch_keyword+"' (으)로 검색한 결과");
		}



		// 페이징을 위한 url
		model.addAttribute("path", "productSearch");
		
		model.addAttribute("area", area);
		
		model.addAttribute("keyword", productsearch_keyword);


		return "product/productCategory";
	}

	// main + ml
	@GetMapping("/productMain")
	public String productArea(Model model) {

		// 쿠키값
		String area = checkCookie();
		System.out.println("쿠키의 area 값 "+ area);


		HashMap<String, Object> map = new HashMap<>();
		map.put("area", area);

		System.out.println("초기 매개변수: " + map.toString());

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		String title = "";
		String prediction = null; // 초기 prediction 값

		if (mvo != null) {
			String memberId = mvo.getMember_id();

			// 세션 기반 ML 모델 호출
			prediction = callMlServer(mlServerUrl, "id", memberId);
			System.out.println("예측값: " + prediction);

			title = mvo.getMember_name() + "님의 검색어 맞춤 추천상품";
		} else {
			// 지역 기반 ML 모델 호출
			prediction = callMlServer(areaSearchMl, "area", area);
			System.out.println("대체 예측값: " + prediction);

			title = "'"+area + "' 베스트 카테고리 상품 추천";
		}

		// 예측값이 null이거나 "null" 문자열인 경우 대체 ML 모델 호출
		System.out.println("예측값 (null 체크 전): " + prediction);
		if (prediction == null || "null".equals(prediction)) {
			System.out.println("예측값이 null입니다. 대체 ML 모델 호출 시작.");
			prediction = callMlServer(areaSearchMl, "area", area);
			System.out.println("대체 예측값 (예측값 null): " + prediction);

			title = "'"+area + "' 베스트 카테고리 상품 추천";
		}else if(prediction.equals("server down")){
			title = "'"+area + "'상품";
		}
		else {
			System.out.println("예측값이 null이 아닙니다. if문 실행되지 않음.");
		}
		

		map.put("prediction", prediction);

		// 상품 리스트 조회 및 모델에 추가
		List<Map<String, Object>> productList = productService.productMainList(map);
		System.out.println("상품 리스트: " + productList);
		model.addAttribute("productList", productList);

		// 시간 변환 메소드 호출 후 모델에 추가
		model.addAttribute("timeDataList", timeConversion(productList));
		model.addAttribute("title", title);
		model.addAttribute("area", area);
		

		return "product/productMain";
	}



	// 7/12 오전 추가 ( 각 카테고리 상픔 list 출력 ) (select) + 페이징 구현
	@GetMapping("/productCategory")
	public String productCategory(@RequestParam(value = "cate", required = false) String category,
			Model model,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size) {
		// 쿠키값
		String area = checkCookie();
		System.out.println("쿠키의 area 값 "+ area);// 카테고리가 null이거나 빈 문자열이면 기본값 설정
		if (category == null || category.isEmpty()) {
			category = "기타";
		}

		int offset = (page - 1) * size;

		HashMap map = new HashMap();
		map.put("category", category);
		map.put("area", area);
		map.put("offset", offset);
		map.put("limit", size);

		System.out.println(category);

		List<Map<String, Object>> productList = productService.productCateList(map);

		int totalCount = productService.countItems(map);
		int totalPages = (int) Math.ceil((double) totalCount / size);

		// 페이징을 위한 url productCategory
		model.addAttribute("path", "productCategory");

		// 모델에 카테고리 속성 추가
		model.addAttribute("category", category);
		model.addAttribute("productList", productList);
		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(productList));
		model.addAttribute("area", area);
		
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		System.out.println(totalPages);
		System.out.println("total"+totalCount);
		


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

	// 상품 상태 수정
	@PostMapping("productUpdateStatus")
	@ResponseBody
	public String productUpdateStatus(@RequestParam String sale_status, @RequestParam Integer sale_id) {
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


	// 상품 상태 수정 ajax
	@PostMapping("updateStatus")
	@ResponseBody
	@Transactional // transactional method (product, product_buy 테이블 동시 업데이트)
	public String updateStatus(@RequestParam String sale_status, @RequestParam Integer sale_id, @RequestParam String member_id) {
		System.out.println("productController updateStatus!!!!!!!!!!!!!"+sale_id+member_id);

		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		ProductVO pvo = new ProductVO();
		pvo.setMember_id(mvo.getMember_id());
		pvo.setSale_id(sale_id);
		pvo.setSale_status(sale_status);

		Integer result =  productService.updateStatus(pvo);

		// If sale status is updated to "판매완료", insert a record in product_buy table
		if (result != null && "판매완료".equals(sale_status)) {
			ProductBuyVO pbvo = new ProductBuyVO();
			pbvo.setBuyDate(new Date()); // Set current date as buyDate
			pbvo.setSaleId(sale_id);
			pbvo.setMemberId(member_id); // Use the provided member_id

			Integer buyResult = productBuyService.insertProductBuy(pbvo);

			if (buyResult != null) {
				return "1";
			} else {
				return "Error updating product_buy table";
			}
		}

		if (result != null) {
			return "1";
		}

		return "Error updating product_sale table";
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
	public String detailProduct(@RequestParam Integer sale_id, Model model ) {
		// 세션값
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println(sale_id);
		// 쿠키값
		String area = checkCookie();

		// 조회수 증가
		productService.productViewCountUpdate(sale_id);
		// 상품 상세
		ProductVO product = productService.myProductSaleId(sale_id);
		// 상품 이미지
		List<ProductImageVO> productImgList = productImageService.myProductSaleId(sale_id);
		// 관심 갯수
		Integer interest = productService.productinterest(sale_id);
		if(interest == null) {
			interest = 0;
		}
		
		// wish 체크
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
		requestBody.put("area", area);
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

			if(prediction.length != 0) {

				List<Map<String, Object>> similarList = productService.similarList(prediction);

				System.out.println(similarList);
				model.addAttribute("similarList", similarList);
				model.addAttribute("timeDataList", timeConversion(similarList));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 별점 평균 내기 
		Integer reviewStarAvg= reviewService.reviewStarAvg(product.getMember_id());
		System.out.println(reviewStarAvg);

		if(reviewStarAvg == null) { // 아직 리뷰가 작성 되지 않아 기본 평균을 3로 줌
			model.addAttribute("reviewStarAvg", 3);
		}else {
			model.addAttribute("reviewStarAvg", reviewStarAvg);
		}

		// mostProduct_review, mostChat_review, mostCommitment_review ( 리뷰 )
		HashMap mostProduct_review = reviewService.mostProduct_review(product.getMember_id());
		HashMap mostChat_review = reviewService.mostChat_review(product.getMember_id());
		HashMap mostCommitment_review = reviewService.mostCommitment_review(product.getMember_id());


		if( mostProduct_review != null || mostChat_review != null || mostCommitment_review != null) {
			model.addAttribute("mostProduct_review", mostProduct_review.get("product_review"));
			model.addAttribute("mostChat_review", mostChat_review.get("chat_review"));
			model.addAttribute("mostCommitment_review", mostCommitment_review.get("commitment_review"));
		}
		// 판매자 사진
		MemberVO member = memberService.getMemberById(product.getMember_id());
		System.out.println(member.getMember_imageName());
		model.addAttribute("member",member);
		
		model.addAttribute("product", product);
		
		// 시간 변환
		Object regdateObj= product.getSale_regdate();
		
		 // regdateObj를 Date 타입으로 캐스팅
        if (regdateObj instanceof Date) {
            Date regdate = (Date) regdateObj;
            System.out.println("Registration Date: " + regdate);
            
            Date now = new Date();
            long duration = now.getTime() - regdate.getTime();
            
            long seconds = TimeUnit.MILLISECONDS.toSeconds(duration);
            long minutes = TimeUnit.MILLISECONDS.toMinutes(duration);
            long hours = TimeUnit.MILLISECONDS.toHours(duration);
            long days = TimeUnit.MILLISECONDS.toDays(duration);
            
            String timeAgo;
            if (seconds < 60) {
                timeAgo = seconds + "초 전";
            } else if (minutes < 60) {
                timeAgo = minutes + "분 전";
            } else if (hours < 24) {
                timeAgo = hours + "시간 전";
            } else {
                timeAgo = days + "일 전";
            }
            
            System.out.println(timeAgo);
            model.addAttribute("timeAgo", timeAgo);
        } else {
            System.out.println("regdate is not a valid Date object.");
        }
		
        model.addAttribute("interest", interest);
		model.addAttribute("productImgList", productImgList);
		model.addAttribute("wishCheck", wishCheck);


		return "product/detail_post";
	}

	// 위시등록
	@ResponseBody
	@PostMapping("/wishInsert")
	public Map<String, Object> wishInsert(@RequestParam Integer sale_id) {
		FavoriteProductVO fpvo = new FavoriteProductVO();
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		fpvo.setMember_id(mvo.getMember_id());
		fpvo.setSale_id(sale_id);

		Integer result = productService.insertFavProduct(fpvo);
		
		
		Map<String, Object> response = new HashMap<>();
		if(result == 1) {
			Integer interes = productService.productinterest(sale_id);
			
			response.put("success", true);
		    response.put("interest", interes);
		    return response;
		}
		

		return null;
	}

	// 위시제거
	@ResponseBody
	@PostMapping("/wishDelete")
	public Map<String, Object> wishDelete(@RequestParam Integer sale_id) {
		FavoriteProductVO fpvo = new FavoriteProductVO();
		MemberVO mvo = (MemberVO) session.getAttribute("member");

		fpvo.setMember_id(mvo.getMember_id());
		fpvo.setSale_id(sale_id);

		Integer result = productService.deleteFavProduct(fpvo);
		
		Map<String, Object> response = new HashMap<>();
		if(result == 1) {
			Integer interes = productService.productinterest(sale_id);
			if(interes == null) {
				interes = 0;
			}
			response.put("success", true);
		    response.put("interest", interes);
		    return response;
		}

		return null;
	}

	// 마이페이지 내 상품 조회
	@RequestMapping("/productMypage")
	public String productMypage( Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		List<Map<String, Object>> myProductList = productService.myProductList(mvo.getMember_id());

		// 별점 평균 내기
		Integer reviewStarAvg= reviewService.reviewStarAvg(mvo.getMember_id());
		System.out.println(reviewStarAvg);

		if(reviewStarAvg == null) { // 아직 리뷰가 작성 되지 않아 기본 평균을 3로 줌
			model.addAttribute("reviewStarAvg", 3);
		}else {
			model.addAttribute("reviewStarAvg", reviewStarAvg);
		}
		// mostProduct_review, mostChat_review, mostCommitment_review
		HashMap mostProduct_review = reviewService.mostProduct_review(mvo.getMember_id());
		HashMap mostChat_review = reviewService.mostChat_review(mvo.getMember_id());
		HashMap mostCommitment_review = reviewService.mostCommitment_review(mvo.getMember_id());


		if( mostProduct_review != null || mostChat_review != null || mostCommitment_review != null) {
			model.addAttribute("mostProduct_review", mostProduct_review.get("product_review"));
			model.addAttribute("mostChat_review", mostChat_review.get("chat_review"));
			model.addAttribute("mostCommitment_review", mostCommitment_review.get("commitment_review"));
		}

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

		// mostProduct_review, mostChat_review, mostCommitment_review
		HashMap mostProduct_review = reviewService.mostProduct_review(member_id);
		HashMap mostChat_review = reviewService.mostChat_review(member_id);
		HashMap mostCommitment_review = reviewService.mostCommitment_review(member_id);


		if( mostProduct_review != null || mostChat_review != null || mostCommitment_review != null) {
			model.addAttribute("mostProduct_review", mostProduct_review.get("product_review"));
			model.addAttribute("mostChat_review", mostChat_review.get("chat_review"));
			model.addAttribute("mostCommitment_review", mostCommitment_review.get("commitment_review"));
		}



		// 별점 평균 내기 
		Integer reviewStarAvg= reviewService.reviewStarAvg(member_id);
		System.out.println(reviewStarAvg);

		if(reviewStarAvg == null) { // 아직 리뷰가 작성 되지 않아 기본 평균을 3로 줌
			model.addAttribute("reviewStarAvg", 3);
		}else {
			model.addAttribute("reviewStarAvg", reviewStarAvg);
		}
		// 판매자 사진
		MemberVO member = memberService.getMemberById(member_id);
		System.out.println(member.getMember_imageName());
		model.addAttribute("member",member);
		
		model.addAttribute("myProductList", myProductList);
		// 시간 변환 메소드 호출 후 model작업
		model.addAttribute("timeDataList", timeConversion(myProductList));



		return "product/productMemberPage";
	}


	// 카테고리 옵션 + 페이징 구현
	@RequestMapping("/categoryOptionSelect") 
	public String categoryOptionSelect(String cate, String type,String productsearch_keyword, Model model, 
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size) {
		// 쿠키값
		String area = checkCookie();
		System.out.println("쿠키의 area 값 "+ area);

		System.out.println(area);

		System.out.println(productsearch_keyword);
		int offset = (page - 1) * size;

		HashMap map = new HashMap();
		map.put("optionCate", cate);
		map.put("category", cate); // 페이징을 위한
		map.put("optionType", type);
		map.put("area", area);
		map.put("offset", offset);
		map.put("limit", size);
		map.put("keyword", productsearch_keyword); 



		System.out.println(map.toString());		
		List<Map<String, Object>> productList = productService.productCateList(map);

		int totalCount = productService.countItems(map);
		int totalPages = (int) Math.ceil((double) totalCount / size);
		System.out.println(productList);

		if(cate == null) {
			model.addAttribute("category","'"+productsearch_keyword+"' (으)로 검색한 결과");
		}else {
			model.addAttribute("category",cate);
		}
		model.addAttribute("productList", productList);
		model.addAttribute("timeDataList", timeConversion(productList));

		// 페이징을 위한 url
		model.addAttribute("path", "categoryOptionSelect");
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		System.out.println(totalPages);
		System.out.println("total"+totalCount);
		return "product/productCategory";
	}

	// 후기 화면
	@RequestMapping("productReview")
	public String productReview(Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		ProductBuyVO bvo = new ProductBuyVO();
		bvo.setMemberId(mvo.getMember_id());

		// buy list 들고오기
		List<Map<String, Object>> buyList = productService.productReview(mvo.getMember_id());
		System.out.println("buylist" + buyList.toString());

		// 시간 변환
		String[] timeDataList = new String[buyList.size()];
		for(int i = 0; i < buyList.size(); i++) {
			Map<String, Object> product = buyList.get(i);
			// 구매날짜
			Object regdateObject = product.get("buy_date");

			if (regdateObject instanceof LocalDateTime) {
				LocalDateTime regdateTime = (LocalDateTime) regdateObject;

				String localDatetime = regdateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				System.out.println(localDatetime);
				timeDataList[i] = localDatetime;
			}		
		}

		model.addAttribute("buyList",buyList);
		model.addAttribute("timeDataList",timeDataList);

		return "product/productReview"; 
	}


	// 리뷰등록 productReviewInsert
	@PostMapping("productReviewInsert")
	@ResponseBody
	public String productReviewInsert(@ModelAttribute ReviewVO rvvo) {
		System.out.println(rvvo.toString());

		Integer reviewInsert = reviewService.productReviewInsert(rvvo);

		if(reviewInsert != null) {

			return "1";
		}
		return null;
	}

	// 리뷰 업데이트 productReviewUpdate
	@PostMapping("productReviewUpdate")
	@ResponseBody
	public String productReviewUpdate(@ModelAttribute ReviewVO rvvo) {
		System.out.println("");
		System.out.println(rvvo.toString());

		Integer productReviewUpdate = reviewService.productReviewUpdate(rvvo);

		if(productReviewUpdate != null) {
			return "1";
		}
		return null;
	}


	// 리뷰 확인 productReviewSelect
	@PostMapping("productReviewIdSelect")
	@ResponseBody
	public Map<String, Object> productReviewIdSelect(@RequestParam Integer buy_id) {
		System.out.println(buy_id);

		Map<String, Object> response = new HashMap<>();
		if (buy_id != null) {
			ReviewVO rvvo = reviewService.productReviewIdSelect(buy_id);
			System.out.println(rvvo.toString());
			response.put("status", "success");
			response.put("reviewList", rvvo);
		} else {
			response.put("status", "error");
		}

		return response;
	}

	// 시간 변환 메소드
	public String[] timeConversion(List<Map<String, Object>> productList ) {
		LocalDateTime now = LocalDateTime.now();

		// 결과를 저장할 배열
		String[] timeDataList = new String[productList.size()];

		for (int i = 0; i < productList.size(); i++) {
			Map<String, Object> product = productList.get(i);
			Object regdateObject = product.get("sale_regdate");

			//System.out.println(regdateObject.getClass().getName()); // type : java.time.LocalDateTime

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
				} else if (differenceInHours > 0) {
					// 하루는 안 지났으나, 몇 시간 지난 경우
					result = differenceInHours + "시간 전";
				} else {
					// 하루도 안 지났고, 몇 분 지난 경우
					result = differenceInMinutes + "분 전";
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
