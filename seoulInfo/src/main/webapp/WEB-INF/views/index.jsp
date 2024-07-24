<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-wf-page="6684f0fb2a5375354f5c4820" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
  <meta charset="utf-8">
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
  <link href="/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
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
  </style> 
    
</head>
<body>
  <div class="page-wrapper">
	<c:choose>
	        <c:when test="${sessionScope.member.member_name == null}">
	            <%@ include file="./member_top.jsp" %>
				<div class="login-before navigation-wrapper">
				      <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
				        <div class="nav-wrapper">        
				          <a href="/" aria-current="page" class="brand w-nav-brand w--current"><img src="images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
				          <div class="links-and-search-wrapper">
				            <nav role="navigation" class="nav-links-wrapper w-nav-menu">
				              <a href="about.html" class="nav-link w-nav-link"></a>
				              <a href="contact.html" class="nav-link w-nav-link"></a>
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
	        </c:when>
			<c:otherwise>
			           <div class="login-after navigation-wrapper">
			               <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="navbar_m w-nav">
			                   <div class="nav-wrapper">
			                       <a href="/member/loginSuccess" aria-current="page" class="brand w-nav-brand w--current">
			                           <img src="/images/ph_globe-simple-light-medium.svg" loading="lazy" alt="">
			                       </a>
			                       <div class="links-and-search-wrapper">
			                           <nav role="navigation" class="nav-links-wrapper w-nav-menu">
			                               <div class="login-success-title">${sessionScope.member.member_name}님, 환영합니다.</div>
			                               <a href="/mypage/profile" class="nav-link w-nav-link">마이페이지</a>
			                               <a href="/member/logout" class="nav-link w-nav-link">로그아웃</a>
			                           </nav>
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
			       </c:otherwise>
	    </c:choose>
		
    <div class="main-wrapper">
      <div class="section-home-banner">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">
              <div class="home-banner-grid">
                <div id="w-node-_5c016d07-4646-372f-7182-acb2647505ea-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505ea" style="opacity:0" class="heading-extra-large"><a href="gu" class="heading-extra-large">지역안내</a></div>
                <div id="w-node-_3d4d8ab8-3340-abe8-c6d1-7a7819bb55e4-4f5c4820" data-w-id="3d4d8ab8-3340-abe8-c6d1-7a7819bb55e4" style="opacity:0" class="image-overflow-wrapper">
                  <div id="w-node-_3d4d8ab8-3340-abe8-c6d1-7a7819bb55e5-4f5c4820" data-w-id="3d4d8ab8-3340-abe8-c6d1-7a7819bb55e5" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="banner-image"></div>
                </div>
			
                <div id="w-node-_5c016d07-4646-372f-7182-acb2647505ec-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505ec" style="opacity:0" class="image-overflow-wrapper">
                  <div id="w-node-_5c016d07-4646-372f-7182-acb2647505ed-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505ed" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="banner-image _2"></div>
                </div>	
                <div id="w-node-_5c016d07-4646-372f-7182-acb2647505ef-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505ef" style="opacity:0"><a href="ev/evMain" class="heading-extra-large">전기차</a></div>
                
                
                <div id="w-node-_5c016d07-4646-372f-7182-acb2647505e8-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505e8" style="opacity:0" class="heading-extra-large"><a href="useTradeGu" class="heading-extra-large">중고거래</a></div>
                <div id="w-node-_5c016d07-4646-372f-7182-acb2647505f2-4f5c4820" data-w-id="1d794ecd-05bb-619d-bbd5-40cd36ea927b" style="opacity:0" class="image-overflow-wrapper">
                  <div id="w-node-_5c016d07-4646-372f-7182-acb2647505f1-4f5c4820" data-w-id="5c016d07-4646-372f-7182-acb2647505ee" style="-webkit-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 0, 0) scale3d(1.1, 1.1, 1.1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform-style:preserve-3d" class="banner-image _3"></div>
                </div>
				
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- footer -->
    <div class="section-footer">
      <div class="padding-global">
        <div class="spacer-xxlarge"></div>
        <div data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe" class="container-footer">
          <div class="padding-global">
            <div class="padding-section-medium">
              <div class="_2-column-grid">
                <a href="/" aria-current="page" class="w-inline-block w--current"><img src="images/ph_globe-simple-light-medium.svg" loading="lazy" alt=""></a>
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
                    <a href="contact.html" class="footer-link">Contact</a>
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
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <script>
		
		// 지역 안내 이미지
		var local = document.getElementById('w-node-_3d4d8ab8-3340-abe8-c6d1-7a7819bb55e4-4f5c4820');
		
		local.onclick = function(){
			location.href = 'gu';
		}
		
		// 전기차 이미지
		var ev = document.getElementById('w-node-_5c016d07-4646-372f-7182-acb2647505ec-4f5c4820');
		ev.onclick = function(){
			location.href = 'ev/evMain';
		}
		
		// 중고거래 이미지
		var product = document.getElementById('w-node-_5c016d07-4646-372f-7182-acb2647505f1-4f5c4820');
		product.onclick = function(){
			location.href = 'useTradeGu';
		}
		
		
  </script>
</body>
</html>