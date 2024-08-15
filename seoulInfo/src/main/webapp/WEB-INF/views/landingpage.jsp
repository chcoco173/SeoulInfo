<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <style>
    @media (min-width: 992px) {
      html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"] {
        -webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
      }
    }
    @media (max-width: 991px) and (min-width: 768px) {
      html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"] {
        -webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
      }
    }
    @media (max-width: 767px) and (min-width: 500px) {
      html.w-mod-js:not(.w-mod-ix) [data-w-id="1d188613-99eb-7eb0-d878-0bf26f04f386"] {
        -webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
        transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);
      }
    }
    .container-newsletter, .box {
      border-radius: var(--corner-rounding);
      padding: 2.5rem;
      max-width: 100%;
      margin-left: auto;
      margin-right: auto;
    }
    .box {
      display: flex;
	  align-items: center;
	  justify-content: center;
      background-color: #e2e2e2;
      margin-bottom: 100px;
      max-width: 100%;
      height: 650px;
      transition: none;
    }
    .box img {
      max-width: 45%;
      margin: 0 5rem;
      border-radius: 8px;
	  width : 1100px;
	  height : 600px;
    }
	
    .box div {
      max-width: 45%;
    }
    .main-wrapper {
      margin-top: 60px;
      padding: 2.5rem;
    }
	@media (max-width: 991px) {
	  .box {
	    flex-direction: column;
	    height: auto;
	  }
	  .box img, .box div {
	    max-width: 90%;
	    margin: 1rem 0;
	  }
	}
	.main-wrapper {
	  margin-top: 60px;
	  padding: 2.5rem;
	}
	.box h1 {
	  font-size: clamp(2rem, 0.5vw, 3.5rem); /* 최소 2rem, 최대 3.5rem, 뷰포트 너비의 5%를 기준으로 조정 */
	  font-weight: 700; 
	}

	.box p {
	  font-size: clamp(1rem, 3vw, 1.5rem); /* 최소 1rem, 최대 1.5rem, 뷰포트 너비의 3%를 기준으로 조정 */
	  font-weight: 500; 
	}

	.back-to-top-wrapper {
	  text-align: center;
	  margin-top: 20px;
	}

	.back-to-top-button {
	  display: inline-block;
	  background-color: #e2e2e2;
	  padding: 10px;
	  border-radius: 50%;
	  text-decoration: none;
	  transition: background-color 0.3s ease;
	}

	.back-to-top-button img {
	  width: 40px;
	  height: 40px; 
	}

	.back-to-top-button:hover {
	  background-color: #b2b2b2;
	}
	
	p:nth-of-type(n+5) {
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}

  </style>
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">
    WebFont.load({
      google: {
        families: ["Plus Jakarta Sans:regular,600,italic,600italic"]
      }
    });
  </script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">
</head>
<body>
  <div class="page-wrapper">
    <div class="section-newsletter">
      <div class="padding-global">
        <div data-w-id="6686b4cb-4367-4ec0-d713-bd79d3f3a9cd" class="container-newsletter background-black">
          <div class="_2-column-grid-uneven-left">
            <a href="/"><h3 class="newsletter-heading">서울 지역 안내 서비스</h3></a>
            <div id="Style-Guide-Form" class="form-component w-node-_6686b4cb-4367-4ec0-d713-bd79d3f3a9d1-d3f3a9cb w-form"></div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="main-wrapper">
      <!-- 네 개의 박스 시작 -->
      <div class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <img src="/landingpageimage/main1.png" alt="Placeholder Image">
        <div>
          <h1>서울 곳곳의</h1>
		  <h1>여러 정보들을 한눈에</h1>
		  <br/>
		  <br/>
          <p>서울 지역 안내 서비스는 서울 시민과 방문객들이 필요로 하는</p>
		  <p>다양한 정보를 한곳에 모아 제공하는 플랫폼입니다.</p> 
		  <p>지역 뉴스, 행사 정보, 전기차 충전소와 근처 편의시설 지도</p>
		  <p>그리고 안전한 구 별 중고거래 서비스를 제공합니다.</p>
		  <p>각 카테고리 혹은 이미지 클릭 시 해당 서비스로 이동할 수 있습니다.</p>
		  
		  <br/>
		  <br/>
		  <a href='/'><h1><서울 지역 안내 서비스로 이동></h1></a>
		</div>
      </div>
      <div class="box box-odd" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <div>
		<h1>월 별, 일 별, 구 별로</h1>
		<h1>세분화한 축제 리스트</h1>
		  <br/>
		  <br/>
		  <p>캘린더와 리스트를 통해 월 별, 일 별로 편리하게 확인할 수 있습니다.</p> 
		  <p>구 선택 시 선택한 구에 해당하는 축제들만 선별해서 제공합니다.</p>
		  <p>정보와 후기를 각 축제 별 게시판을 통해 다른 회원들과 나눌 수 있습니다.</p>
        </div>
        <img src="/landingpageimage/main2.png" alt="Placeholder Image">
		</div>
      <div class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <img src="/landingpageimage/main3.png" alt="Placeholder Image">
        <div>
			<h1>구 별로 세분화해 최신순으로</h1>
			<h1>제공하는 뉴스 리스트</h1>
		  <br/>
		  <br/>
		  <p>구 선택 시 선택한 구에 해당하는 뉴스들만 선별해서 제공합니다.</p>
		  <p>뉴스 제목 클릭 시 상세 뉴스 페이지를 볼 수 있습니다.</p>
		</div>
      </div>
      <div class="box box-odd" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <div>
		<h1>가까운 전기차 충전소를</h1>
		<h1>편리하게 검색할 수 있는 지도</h1>
		  <br/>
		  <br/>
		  <p>회원 로그인 시, 거주 지역 내 전기차 충전소 정보를 제공합니다.</p> 
		  <p>길 찾기 시 가장 빠른 경로와 경로 근처의 전기차 충전소 위치를 제공합니다.</p>
		  <p>충전소 검색 시 주변 편의시설 정보도 함께 제공합니다.</p>
        </div>
        <img src="/landingpageimage/main4.png" alt="Placeholder Image">
      </div>
      <div class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <img src="/landingpageimage/main5.png" alt="Placeholder Image">
        <div>
			<h1>회원의 니즈에 딱 맞춘</h1>
			<h1>상품들을 제시하는 중고거래</h1>
			<br/>
			<br/>
			<p>구 선택 시 선택한 구에 해당하는 상품들만 선별해서 제공합니다.</p> 
			<p>회원의 검색 내역을 기반으로 한 추천 카테고리 상품들을 제공합니다.</p>
			<p>선택한 상품과 유사한 상품들을 연관 상품으로 제공합니다.</p>
		</div>
      </div>
      <!-- 네 개의 박스 끝 -->
    </div>
	<div class="back-to-top-wrapper">
	  <a href="#" class="back-to-top-button"><img src="/landingpageimage/uparrow.png"></a>
	</div>
	<br/>
	<br/>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
      $('.back-to-top-button').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, 'slow');
        return false;
      });
    });
  </script>
</body>
</html>