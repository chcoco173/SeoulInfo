<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4825" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Sightseer - Webflow Travel Photography Website Template</title>
  <meta content="Sightseer - Webflow Travel Photography Website Template" name="description">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="og:title">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="og:description">
  <meta content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg" property="og:image">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="twitter:title">
  <meta content="Sightseer - Webflow Travel Photography Website Template" property="twitter:description">
  <meta content="https://uploads-ssl.webflow.com/628ab2619076f3ee1c941a44/666120e5c3c4e1f8776b48f1_Sightseer---Opengraph.jpg" property="twitter:image">
  <meta property="og:type" content="website">
  <meta content="summary_large_image" name="twitter:card">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="/css/mypage/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/newsComment.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
  
  <style type="text/css">
  	/* 로그인 성공 메세지 */
    .login-success-title {
      color: #007bff;
      font-weight: bold;
    }
  </style>   
</head>
<body>
  <div class="page-wrapper">
	
	<!-- 한) 상단:회원가입/로그인 버튼 start -->
<!-- 	<div class="section-newsletter">
	  <div class="padding-global">
	    <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
	      <div class="_2-column-grid-uneven-left">
	        <h3 class="newsletter-heading">서울 지역 안내 서비스</h3>
	        <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
	          <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4820" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2">
				
				<a href="/member/insertMember" class="button-primary-large max-width-full-mobile-portrait w-button">회원가입</a>
				<a href="/member/login" class="button-primary-large max-width-full-mobile-portrait w-button">로그인</a>
				
			  </form>
	          <div class="form-success-message w-form-done">
	            <div class="text-size-regular text-color-white">Thank you! Your submission has been received!</div>
	          </div>
	          <div class="form-error-message w-form-fail">
	            <div class="text-size-regular">Oops! Something went wrong while submitting the form.</div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div> -->
	<!-- 한) 상단:회원가입/로그인 버튼 end -->	
	
	<!-- 검색 start -->
    <div class="navigation-wrapper">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
          <a href="/member/loginSuccess" aria-current="page" class="brand w-nav-brand w--current"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
          <div class="links-and-search-wrapper">
            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
              <div class="login-success-title">${sessionScope.member.member_name}님, 환영합니다.</div>
              <a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a>
              <a href="/" class="nav-link w-nav-link">로그아웃</a>
            </nav>
            <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
              <div class="search-div"><img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
              <div class="nav-search-outer-wrapper">
                <div class="nav-search-internal-wrapper"><input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                  <div class="search-button-wrapper"><input type="submit" class="button-primary-small w-button" value="Search">
                    <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block"><img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></a>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="menu-button w-nav-button"><img src="/images/ph_list-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
        </div>
      </div>
    </div>
	<!-- 검색 end -->	
	
	
    <div class="main-wrapper">
    
    	<!--한) 마이페이지 상단 start-->
      <div class="section-posts-row">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">				

              <h2 data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f381" style="opacity:1">마이페이지</h2>
              <div class="spacer-xlarge"></div>
              <div data-w-id="92aebb47-1885-83d3-60a8-004b18e908c0" style="opacity:1" class="divider-line"></div>
              <div class="spacer-xlarge"></div>
			  
              <div class="w-dyn-list">
                <div role="list" class="w-dyn-items">
                
                  <div data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f385" style="opacity:1" role="listitem" class="w-dyn-item">
                    <div class="post-row-grid">
                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="#가" 
					  		class="post-row-image-overflow-container w-inline-block">
                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
							style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
							class="post-row-image"></div>
                      </a>
                      <div id="w-node-bbff658c-4524-8e8f-d0bf-96425152472b-4f5c4820" class="post-row-wrapper">						
                        <div class="tags-wrappers">
                          <a href="#나" class="tag-a w-inline-block">회원아이디
                            <div class="text-size-small w-dyn-bind-empty"></div>
                          </a>
                          <a href="#다" class="tag-a w-inline-block">회원이메일
                            <div class="text-size-small w-dyn-bind-empty"></div>
                          </a>
                        </div>												
                      </div>				
                    </div>
                  </div>
                
				<!-- 한)마이페이지 탭 start-->
				 <div>
					<div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
					  <h4></h4>
					  <div class="spacer-large"></div>
					  <a href="/mypage/profile" class="tag-t w-inline-block">프로필 관리</a>

					  <a href="/mypage/memberInfo" class="tag-t w-inline-block">개인정보 관리</a>
					  
					  <a href="/mypage/newsComment" class="tag-t w-inline-block">내가 작성한 댓글</a>
					  
					  <a href="/mypage/product" class="tag-t w-inline-block">관심상품 목록</a>
					  
					  <a href="/mypage/ev" class="tag-t w-inline-block">충전소 즐겨찾기</a>
					  
					  <a href="/mypage/question" class="tag-t w-inline-block">1 : 1 문의</a>				  				  
					</div>
				</div>
				<!-- 한)마이페이지 탭 end-->																
					
				</div>					
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--한) 마이페이지 상단 end-->
          
    
    <!--한) 뉴스댓글 목록 start-->
      <div class="section-contact">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-large">
              <div class="_2-column-grid-uneven-right">
              
              	<!-- 왼쪽 컬럼 -->
                <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
                  <div class="accent"></div>
                  <div class="spacer-large"></div>
                  <h2>내가 작성한 댓글</h2>
                  <div class="spacer-large"></div>
                  <p></p>
                </div>
				
				<!-- 오른쪽 컬럼 -->
                <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0; " class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">                
				    <table class="comment-table">
				        <thead>
				            <tr>
				                <th class="narrow-col">댓글번호</th>
				                <th class="wide-col">댓글내용</th>
				                <th class="narrow-col">작성일</th>
				                <th class="narrow-col">삭제</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach items="${commentList}" var="nc">
				                <tr>
				                    <td>${nc.ncId}</td>
				                    <td align="left"><a href="getBoard?seq=${nc.ncId}">${nc.ncContent}</a></td>
				                    <td>${nc.ncRegdate}</td>
				                    <td class="center-align"><button class="delete-button">x</button></td>
				                </tr>
				            </c:forEach>
				        </tbody>
				    </table>			  			  				  				  
                </div>
				
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--한) 뉴스댓글 목록 end-->
      
    </div>
    <!-- main-wrapper end -->
	
	
	
    <div class="section-newsletter">
      <div class="padding-global">
        <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
          <div class="_2-column-grid-uneven-left">
            <h3 class="newsletter-heading">Love what you see? Sign up for my newsletter and stay in touch.</h3>
            <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form">
              <form name="wf-form-Newsletter-Form" data-name="Newsletter Form" method="get" id="wf-form-Newsletter-Form" class="newsletter-form" data-wf-page-id="6684f0fb2a5375354f5c4825" data-wf-element-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9d2"><input class="form-field newsletter w-input" maxlength="256" name="Email" data-name="Email" placeholder="Your email address" type="email" id="Email" required=""><input type="submit" data-wait="Please wait..." class="button-primary-large max-width-full-mobile-portrait w-button" value="Join"></form>
              <div class="form-success-message w-form-done">
                <div class="text-size-regular text-color-white">Thank you! Your submission has been received!</div>
              </div>
              <div class="form-error-message w-form-fail">
                <div class="text-size-regular">Oops! Something went wrong while submitting the form.</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- section-newsletter end -->
    
    <div class="section-footer">
      <div class="padding-global">
        <div class="spacer-xxlarge"></div>
        <div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe" class="container-footer">
          <div class="padding-global">
            <div class="padding-section-medium">
              <div class="_2-column-grid">
                <a href="/member/loginSuccess" class="w-inline-block"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
                <div>
                  <h3>The stories of a travel photographer and blogger exploring the world .</h3>
                  <div id="w-node-e1165d61-2cbb-cc22-6e05-5b6165b83107-65b830fb" class="spacer-xxlarge"></div>
                </div>
              </div>
              <div class="_2-column-grid footer">
                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b846f-65b830fb" class="footer-micro-links-wrapper">
                  <p class="text-size-small">Website template by <a href="https://www.callistodigitalstudio.com/" target="_blank" class="text-size-small">Callisto Digital Studio</a>.</p>
                  <p class="text-size-small">Powered by <a href="https://webflow.com/templates/html/sightseer-travel-website-template" target="_blank" class="text-size-small">Webflow</a>.</p>
                </div>
                <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8474-65b830fb" class="_3-column-grid footer-links">
                  <div id="w-node-f17ecf68-c6ad-5661-f6e1-8708d30b8475-65b830fb">
                    <h4>About</h4>
                    <div class="spacer-large"></div>
                    <a href="about.html" class="footer-link">About</a>
                    <a href="contact.html" aria-current="page" class="footer-link w--current">Contact</a>
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
    
  </div>
  <!-- page-wrapper end -->
  

  
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>