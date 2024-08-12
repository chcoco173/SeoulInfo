<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4823"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>JADE&#x27;s Dandy Site</title>
	<meta content="" property="og:title">
	<meta content="" property="twitter:title">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
	<link href="/css/normalize.css" rel="stylesheet" type="text/css">
	<link href="/css/webflow.css" rel="stylesheet" type="text/css">
	<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
		type="text/css">
	<link href="https://fonts.googleapis.com" rel="preconnect">
	<link href="https://fonts.gstatic.com" rel="preconnect"
		crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
	<script type="text/javascript">
		WebFont.load({
			google : {
				families : [ "Plus Jakarta Sans:regular,600,italic,600italic" ]
			}
		});
	</script>
	<script type="text/javascript">
		!function(o, c) {
			var n = c.documentElement, t = " w-mod-";
			n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch
					&& c instanceof DocumentTouch)
					&& (n.className += t + "touch")
		}(window, document);
	</script>
	<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
	<link href="/images/webclip.png" rel="apple-touch-icon">
	
	<style>
		.container {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    padding: 20px;
		}

		.row {
		    width: 100%;
		    max-width: 1200px;
		}

		.form-group {
		    width: 100%;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    margin-bottom: 30px; /* 요소 간 간격 조정 */
		}

		.form-control,
		.form-control-file {
		    width: 100%; /* 너비 조정 */
		    max-width: 800px; /* 최대 너비 설정 */
		}

		#fr_title {
		    height: 2.5em; /* 높이를 두 배로 설정 */
		}
		
		.scroll-item {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    margin-bottom: 30px; /* 요소 간 간격 조정 */
		}

		.review-image {
		    width: 100%; /* 고정 가로 길이 설정 */
		    max-width: 100%; /* 최대 너비 설정 */
		    height: auto;
		    margin-top: 20px; /* 이미지와 파일 입력 간 간격 조정 */
		    margin-bottom: 20px; /* 이미지와 버튼 간 간격 조정 */
		}

		.delete-btn {
		    background-color: red;
		    color: white;
		    border: none;
		    padding: 5px;
		    cursor: pointer;
		}

		.delete-btn:focus {
		    outline: none;
		}

		.submit-button {
		    align-items: center;
		    display: flex;
		    justify-content: center;
		    width: 100%; /* 너비를 100%로 설정 */
		}

		.btn {
		    width: 100%;
		    max-width: 20%;
		}

		h1 {
		    text-align: center; /* 제목 가운데 정렬 */
		    width: 100%;
		    margin-bottom: 30px; /* 제목과 폼 간 간격 조정 */
		}
		
		@media (max-width: 768px) {
		    .form-control,
		    .form-control-file {
		        max-width: 100%; /* 작은 화면에서는 최대 너비 100% */
		    }

		    .btn {
		        max-width: 100%; /* 작은 화면에서는 버튼 최대 너비 100% */
		    }

		    .form-group,
		    .scroll-item {
		        margin-bottom: 20px; /* 작은 화면에서는 간격 조정 */
		    }

		    #fr_title {
		        height: 3em; /* 작은 화면에서는 제목 높이 증가 */
		    }
		}

	</style>
	</head>
<body>
	<div class="page-wrapper">
		<!-- 검색창 start -->
		<div class="page-wrapper">
			<div class="navigation-wrapper">
				<div data-animation="default" data-collapse="medium"
					data-duration="400" data-easing="ease" data-easing2="ease"
					role="banner" class="navbar_m w-nav">
					<div class="nav-wrapper">
						<a href="/" aria-current="page"
							class="brand w-nav-brand w--current"> <img
							src="/images/ph_globe-simple-light-medium.svg" loading="lazy"
							alt="">
						</a>
						<div class="links-and-search-wrapper">
							<%
								if (session.getAttribute("member") != null) {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}" class="nav-link w-nav-link">뉴스</a> 
								<a href="/ev/evMain" class="nav-link w-nav-link">전기차</a> 
								<a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a> 
								<a href="/member/logout" class="nav-link w-nav-link">로그아웃</a>
							</nav>
							<%
								} else {
							%>
							<nav role="navigation" class="nav-links-wrapper w-nav-menu">
								<a href="/news/news?area=${param.area}" class="nav-link w-nav-link">뉴스</a> 
								<a href="/ev/evMain" class="nav-link w-nav-link">전기차</a> 
								<a href="/member/login" class="nav-link w-nav-link">로그인</a>
							</nav>
							<%
								}
							%>
							<form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
								<div class="search-div">
									<img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
								</div>
								<div class="nav-search-outer-wrapper">
									<div class="nav-search-internal-wrapper">
										<input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
										<div class="search-button-wrapper">
											<input type="submit" class="button-primary-small w-button" value="Search"> 
											<a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block"> 
												<img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
											</a>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="menu-button w-nav-button">
							<img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
						</div>
					</div>
				</div>
			</div>
		<!-- 검색창 end -->
		
		<!-- 축제 후기 입력 form -->
		<main class="main-wrapper">
			<section class="section-style-guide-header">
				<div class="padding-section-medium remove-bottom-padding">
					<div class="padding-global">
						<div class="container-large">
							<c:choose>
							    <c:when test="${not empty review}">
							        <h1>${festival.festival_name} </br> 축제 후기 수정</h1>
							    </c:when>
							    <c:otherwise>
							        <h1>${festival.festival_name} </br> 축제 후기 등록</h1>
							    </c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<!-- 기존의 form 태그를 수정하여 업데이트와 삽입을 조건부로 처리합니다. -->
							<c:choose>
							    <c:when test="${not empty review}">
							        <form action="updateReview" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
							    </c:when>
							    <c:otherwise>
							        <form action="insertReview" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
							    </c:otherwise>
							</c:choose>
							    <input type="hidden" name="festival_id" value="${festival_id}">
							    <input type="hidden" name="member_id" value="${sessionScope.member.member_id}">
							    <div class="form-group">
							        <label for="fr_title">축제 후기 제목</label>
									<input type="text" class="form-control" id="fr_title" name="fr_title" placeholder="제목을 입력해주세요." value="${review.fr_title}" required>
							    </div>
							    <div class="form-group">
							        <label for="fr_content">해당 축제에 후기를 남겨주세요.</label>
									<textarea class="form-control" id="fr_content" name="fr_content" rows="6" placeholder="내용을 입력해주세요." required>${review.fr_content}</textarea>
							    </div>
							    <div class="form-group">
									    <label for="productImage">해당 축제에서 찍은 사진들을 올려주세요.</label>
									    <div id="fileInputs">
									        <c:choose>
									            <c:when test="${not empty images}">
									                <c:forEach var="image" items="${images}" varStatus="status">
									                    <div class="scroll-item">
									                        <input type="file" class="form-control-file mt-2 file-input" name="file" accept="image/*" onchange="previewFile(event, ${status.index})">
									                        <img src="${image.fr_imgUrl}" alt="리뷰 이미지" class="review-image" style="display:block;">
									                        <button type="button" class="delete-btn delete" style="display:block;" onclick="removeImage(${status.index})">&#10005;</button>
									                    </div>
									                </c:forEach>
									                <c:forEach begin="${images.size()}" end="2" varStatus="status">
									                    <div class="scroll-item">
									                        <input type="file" class="form-control-file mt-2 file-input" name="file" accept="image/*" onchange="previewFile(event, ${status.index + images.size()})">
									                        <img src="" alt="리뷰 이미지" class="review-image" style="display:none;">
									                        <button type="button" class="delete-btn delete" style="display:none;" onclick="removeImage(${status.index + images.size()})">&#10005;</button>
									                    </div>
									                </c:forEach>
									            </c:when>
									            <c:otherwise>
									                <c:forEach begin="0" end="2" varStatus="status">
									                    <div class="scroll-item">
									                        <input type="file" class="form-control-file mt-2 file-input" name="file" accept="image/*" onchange="previewFile(event, ${status.index})">
									                        <img src="" alt="리뷰 이미지" class="review-image" style="display:none;">
									                        <button type="button" class="delete-btn delete" style="display:none;" onclick="removeImage(${status.index})">&#10005;</button>
									                    </div>
									                </c:forEach>
									            </c:otherwise>
									        </c:choose>
									    </div>
									</div>
								<div class="form-group submit-button">
									<c:choose>
									    <c:when test="${not empty review}">
											<input type="hidden" name="festival_id" value="${festival.festival_id}">
											<input type="hidden" name="fr_id" value="${review.fr_id}">
											<input type="hidden" name="member_id" value="${sessionScope.member.member_id}">
											<button type="submit" class="btn button-primary-large max-width-full-mobile-portrait w-button">후기 수정하기</button>
									    </c:when>
									    <c:otherwise>
											<button type="submit" class="btn button-primary-large max-width-full-mobile-portrait w-button">후기 등록하기</button>
									    </c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</section>
		</main>
		  <div class="section-footer">
		  	<div class="padding-global">
		  		<div class="spacer-xxlarge"></div>
		  		<div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe" class="container-footer">
		  			<div class="padding-global">
		  				<div class="padding-section-medium">
		  					<div class="_2-column-grid">
		  						<a href="/" aria-current="page" class="w-inline-block w--current"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
		  						<div>
		  							<h3>The stories of a travel photographer and blogger exploring the world .</h3>
		  							<div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb" class="spacer-xxlarge"></div>
		  						</div>
		  					</div>
		  					<div class="_2-column-grid footer">
		  						<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb" class="footer-micro-links-wrapper">
		  							<p class="text-size-small">
		  								Website template by <a href="https://www.callistodigitalstudio.com/" target="_blank" class="text-size-small">Callisto Digital Studio</a>.
		  							</p>
		  							<p class="text-size-small">
		  								Powered by <a href="https://webflow.com/templates/html/sightseer-travel-website-template" target="_blank" class="text-size-small">Webflow</a>.
		  							</p>
		  						</div>
		  						<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb" class="_3-column-grid footer-links">
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
		  								<h4>About</h4>
		  								<div class="spacer-large"></div>
		  								<a href="about" class="footer-link">About</a> 
										<a href="contact" class="footer-link">Contact</a>
		  							</div>
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8481-65b830fb">
		  								<h4>Social</h4>
		  								<div class="spacer-large"></div>
		  								<a href="http://tiktok.com" target="_blank" class="footer-link">TikTok</a> 
										<a href="http://Instagram.com" target="_blank" class="footer-link">Instagram</a> 
										<a href="http://Facebook.com" target="_blank" class="footer-link">Facebook</a> 
										<a href="http://Youtube.com" target="_blank" class="footer-link">Youtube</a>
		  							</div>
		  							<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b848d-65b830fb">
		  								<h4>Theme</h4>
		  								<div class="spacer-large"></div>
		  								<a href="template/template-style-guide.html" class="footer-link">Style Guide</a> 
										<a href="template/changelog.html" class="footer-link">Changelog</a> 
										<a href="template/licenses.html" class="footer-link">Licenses</a> 
										<a href="https://webflow.com/templates/designers/callisto-digital-studio" target="_blank" class="footer-link">All Templates</a>
		  							</div>
		  						</div>
		  					</div>
		  				</div>
		  			</div>
		  		</div>
		  		<div class="spacer-xxlarge"></div>
		  	</div>
		  </div>
		  <!-- section-footer end -->
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script type="text/javascript">
  function validateForm() {
      let fileInputs = document.querySelectorAll('.file-input');
      let hasFile = false;

      fileInputs.forEach(input => {
          if (input.files.length > 0 || input.nextElementSibling.style.display === 'block') {
              hasFile = true;
          }
      });

      if (!hasFile) {
          alert('최소 1개의 축제 이미지를 업로드해야 합니다.');
          return false;
      }

      return true;
  }

  function previewFile(event, index) {
      var input = event.target;
      var file = input.files[0];
      var reader = new FileReader();

      reader.onload = function(e) {
          var imgSrc = e.target.result;
          var img = input.nextElementSibling;
          var deleteBtn = img.nextElementSibling;

          img.src = imgSrc;
          img.style.display = 'block';
          deleteBtn.style.display = 'block';
      }

      reader.readAsDataURL(file);
  }

  function removeImage(index) {
      var fileInput = document.querySelectorAll('.file-input')[index];
      var img = fileInput.nextElementSibling;
      var deleteBtn = img.nextElementSibling;

      fileInput.value = '';
      img.style.display = 'none';
      deleteBtn.style.display = 'none';
  }
  </script>
</body>
</html>
