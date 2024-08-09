<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<!--  This site was created in Webflow. https://webflow.com  --><!--  Last Published: Wed Jul 03 2024 06:37:30 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="6684f0fb2a5375354f5c4820" data-wf-site="6684f0fb2a5375354f5c47e9">
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
  <style>@media (min-width:992px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}@media (max-width:991px) and (min-width:768px) {html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"] {-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);}}</style>
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
    
	.profile {
            display: flex;
            align-items: center;
        }
        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
        .profile-info {
            margin-left: 20px;
        }
  </style>    
</head>
<body>
  <div class="page-wrapper">
	
	
	
	
	<!-- 검색 start -->
    <div class="navigation-wrapper">
      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
        <div class="nav-wrapper">
          <a href="/" aria-current="page" class="brand w-nav-brand w--current"><img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
          <div class="links-and-search-wrapper">
            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
              <div class="login-success-title">${sessionScope.member.member_name}님, 환영합니다.</div>
              <a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a>
              <a href="/member/logout" class="nav-link w-nav-link">로그아웃</a>
            </nav>
            <form action="/search" data-w-id="a72c4d20-babf-897f-e150-4948b59e5bf5" class="search w-form">
              <div class="search-div"><img src="/images/ph_magnifying-glass-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall"></div>
              <div class="nav-search-outer-wrapper">
                <div class="nav-search-internal-wrapper"><input class="form-field w-input" maxlength="256" name="query" placeholder="Search…" type="search" id="search" required="">
                  <div class="search-button-wrapper"><input type="submit" class="button-primary-small w-button" value="Search">
                    <a data-w-id="a72c4d20-babf-897f-e150-4948b59e5bfb" href="#" class="close-search-link-block w-inline-block">
						<img src="/images/ph_x-light-xsmall.svg" loading="lazy" alt="" class="icon-1x1-xsmall">
					</a>
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

              <h2 data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f381" style="opacity:0">마이페이지</h2>
              <div class="spacer-xlarge"></div>
              <div data-w-id="92aebb47-1885-83d3-60a8-004b18e908c0" style="opacity:0" class="divider-line"></div>
              <div class="spacer-xlarge"></div>
			  
              <div class="w-dyn-list">
                <div role="list" class="w-dyn-items">
               
                  <div data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f385" style="opacity:0" role="listitem" class="w-dyn-item">
                    <div class="post-row-grid">
		           <!-- 프로필 사진 -->
		           <c:choose>
		          	 	<c:when test="${sessionScope.member.member_imageName == null}">		         
		                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
							  		class="post-row-image-overflow-container w-inline-block">
		                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
									style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
									class="post-row-image">
								<img src="/images/mypage/default_profile.jpg" >
								</div>
		                      </a>
		                  </c:when>
		                 <c:otherwise>
		                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
							  		class="post-row-image-overflow-container w-inline-block">
		                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
									style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
									class="post-row-image">
								<img src="/files/${sessionScope.member.member_imageName}">
								</div>
		                      </a>                 
		                 </c:otherwise>     
		           </c:choose>          					
                	<!-- 회원정보 -->	
                      <div id="w-node-bbff658c-4524-8e8f-d0bf-96425152472b-4f5c4820" class="post-row-wrapper">						
                        <div class="tags-wrappers">
                          <a href="" class="tag-a w-inline-block">회원아이디 : ${sessionScope.member.member_id}
                            <div class="text-size-small w-dyn-bind-empty"></div>
                          </a>
                          <a href="" class="tag-a w-inline-block">회원이메일 : ${sessionScope.member.member_email}
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
					  
					  <!-- <a href="/mypage/newsComment" class="tag-t w-inline-block">내가 작성한 댓글</a> -->
					  
					  <a href="/mypage/product" class="tag-t w-inline-block">관심상품 목록</a>
					  
					  <a href="/mypage/ev" class="tag-t w-inline-block">충전소 즐겨찾기</a>
					  
					  <a href="/mypage/question" class="tag-t w-inline-block">1 : 1 문의</a>				  				  
					</div>
				</div>
				<!-- 한)마이페이지 탭 end-->	
				
				
				<!-- 한)마이페이지 상세 start-->			
				 <div>
					  <h4></h4>
					  <div class="spacer-large"></div>					  
					  <div class="w-dyn-list">
					    <div role="list" class="w-dyn-items">
					      <div data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f385" style="opacity:0" role="listitem" class="w-dyn-item">
					        <div class="post-row-grid">
		           			  <!-- 프로필 사진 -->       
				          <c:choose>
				          	 	<c:when test="${sessionScope.member.member_imageName == null}">		         
				                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
									  		class="post-row-image-overflow-container w-inline-block">
				                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
											style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
											class="post-row-image">
										<img src="/images/mypage/default_profile.jpg" >										
										</div>										
				                      </a>
				                 </c:when>
				                 <c:otherwise>
				                      <a id="w-node-dbd1f4aa-0c13-168c-7fc5-367d8d676b4b-4f5c4820" data-w-id="dbd1f4aa-0c13-168c-7fc5-367d8d676b4b" href="" 
									  		class="post-row-image-overflow-container w-inline-block">
				                    	<div id="w-node-_1d188613-99eb-7eb0-d878-0bf26f04f386-4f5c4820" data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386" 
											style="-webkit-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" 
											class="post-row-image">
										<img src="/files/${sessionScope.member.member_imageName}">
										</div>
				                      </a>                 
				                 </c:otherwise>     
				           </c:choose>					          			
					        </div>
					      </div>					      					      					     				      
						 </div>
						</div> 						
						  <div class="spacer-large"></div>

						<!-- 등록(수정) 버튼 -->
					    <form action="updateProfile" method="post" enctype="multipart/form-data" class="tag-b w-inline-block">					    	
					    	<input type="hidden" name="member_id" id="id" value="${sessionScope.member.member_id}">
					        <input type="file" name="file" id="file" class="tag-b w-inline-block">
					        <input type="submit" value="등록" class="tag-a w-inline-block">					        
					    </form>
					
					    <!-- 삭제 버튼 -->
					    <form action="deleteProfile" method="post" class="tag-b w-inline-block">
					     	<input type="hidden" name="member_id" id="id" value="${sessionScope.member.member_id}">
					        <input type="submit" value="삭제" class="tag-a w-inline-block">
					    </form>				  				  
					</div>
					<!-- 한)마이페이지 상세 end-->														


					
				</div>					
              </div>              
            </div>
          </div>
        </div>
      </div><!--한) 마이페이지 end-->
      
    </div><!-- main-wrapper end -->
	

    
  </div><!-- page-wrapper end -->
  
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
</body>
</html>