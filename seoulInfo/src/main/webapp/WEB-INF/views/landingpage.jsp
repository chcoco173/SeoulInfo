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
	  margin-top:30px;
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
      margin-bottom: 20px;
      max-width: 100%;
      height: 950px;
      transition: none;
    }
    .box img {
      max-width: 80%;
      margin: 0 5rem;
      border-radius: 8px;
	  width : 1100px;
	  height : 600px;
	  margin-bottom: 20px;
    }
	
    .box div {
      max-width: 45%;
    }
    .main-wrapper {
      margin-top: -20px;
      padding: 2.5rem;
    }
	.btn-movePage {
	       display: flex; /* 버튼 내에서 이미지와 텍스트를 가로로 배치 */
	       align-items: center; /* 이미지와 텍스트를 세로 가운데 정렬 */
	       border: none; /* 기본 버튼 스타일 제거 */
	       background: none; /* 기본 버튼 배경 제거 */
	       cursor: pointer; /* 버튼 커서 설정 */
	   }

	   #moveMainImage {
	       height: 3em; /* 텍스트 크기에 맞춰 이미지 높이를 설정 */
	       width: auto; /* 이미지의 원본 비율 유지 */
	       margin-right: 0.5em; /* 이미지와 텍스트 사이에 약간의 간격 추가 */
		   display: inline-block;
		   transition: transform 0.5s ease-in-out;
	   }
	   
	   #moveMainText {
	      margin: 1px; /* 기본 여백 제거 */
	      padding:3px;
	      border: 3px solid black;
	      border-radius:10px;
	      background:white;
	      
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
	  margin-top: -20px;
	  padding: 2.5rem;
	}
	.box h1 {
	  font-size: clamp(2rem, 0.5vw, 3.5rem); /* 최소 2rem, 최대 3.5rem, 뷰포트 너비의 5%를 기준으로 조정 */
	  font-weight: 700; 
	  color: darkblue;
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
	    text-overflow: ellipsis;
	}
	@media (max-width: 576px) {
		.newsletter-heading {
		    margin-right: 0;
		}
		#main1 {
			height: 160px;
		}
		#main2 {
			height: 160px;
			margin-left: -33px;
		}
		#main3 {
			height: 160px;
		}
		#main4 {
			height: 160px;
		}
		#main5 {
			height: 160px;
		}
		.box img, .box div {
		    max-width: 130%;
		}
		
		.box h1 {
		    font-size: clamp(1rem, 0.5vw, 3.5rem);
		    font-weight: 700;
		}
		.box p {
		    font-size: clamp(0rem, 3vw, 1.5rem);
		    font-weight: 500;
		}
		.box {
		    margin-bottom: 10px;
		}
	}
	/* 박스 이미지 */
	#box-first{
		background:#FFFAE0;
	}
	#box-second{
		background:#FFF8F1;	
	}
	#box-third{
			
	}
	#box-forth{
		background:#F6FDEC;	
	}
	#box-fifth{
		background:#FFF8F1;	
	}
	
	.landingTableImg{
		border : 2px solid black;
	}
	.smallTitle { 
		color : orange;
		font-size:15px;
		font-weight: bold;
		line-height:2.5;
		margin-left:15px;
	}


	#moveMain:hover #moveMainImage {
	  animation: moveSideToSide 1s infinite alternate;
	}

	@keyframes moveSideToSide {
	  0% {
	    transform: translateX(0); /* 원래 위치 */
	  }
	  100% {
	    transform: translateX(10px); /* 10px 오른쪽으로 이동 */
	  }
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
      <div id="box-first" class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
       <img id='main1' src="/landingpageimage/main1.png" alt="Placeholder Image">
       <div>
          <h1>서울 곳곳의</h1>
		  <h1>여러 정보들을 한눈에</h1>
		  <br/>
		  <article>
	          <p><b style="color:green;"> 서울 지역 안내 서비스</b>는</p>
			  <p>서울 시민과 방문객들에게 다양한 정보를 한 곳에 모아 제공하는 플랫폼입니다.</p> 
			  <p>뉴스, 축제, 공연 등의 <b style="color:purple;">지역정보</b>, 전기차 충전소와 편의시설 <b style="color:yellowgreen;">지도</b></p>
			  <p>그리고 안전한 구 별 <b style="color:orange;">중고거래</b> 서비스를 제공합니다.</p>
			  <p>각 카테고리 혹은 이미지 클릭 시 해당 서비스로 이동 합니다.</p>
		  </article>
		  <br/>
		  <a href='/'>
          	<button class="btn-movePage" id="moveMain">
			<img id="moveMainImage" src="/landingpageimage/moveMain.png" alt="이동">
            <h1 id="moveMainText">메인페이지 이동</h1></button>
          </a>
		</div>
      </div>
      <div id="box-second" class="box box-odd" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <div>
		<span class="smallTitle">서울의 문화</span>
		<h1>월간, 일간, 지역별로</h1>
		<h1>세분화한 축제 리스트</h1>
		  <br/>
		  <p><b>캘린더와 리스트를 통해 원하는 날짜의 문화행사를 쉽게 확인할 수 있습니다.<b></p><br>
		  <table id="landingFestival" style="width:80%">
			<tr>
				<td><img class="landingTableImg" src="/landingpageimage/local1.gif" style=" width:50%; height:50%;"></td>
				<td><img class="landingTableImg" src="/landingpageimage/local2.gif" style=" width:50%; height:50%;"></td>
			</tr>
			<tr>
				<td><p>원하는 지역을 선택 시 해당하는 <br> 축제들만 선별해서 제공합니다.</p></td>
				<td><p>정보와 후기를 게시판을 통해<br> 회원들과 경험을 나눠보세요!</p></td>
			</tr>
			</table>
        </div>
        <img id='main2' src="/landingpageimage/main2.png" alt="Placeholder Image">
		</div>
      <div id="box-third" class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <img id='main3' src="/landingpageimage/main3.png" alt="Placeholder Image">
        <div>
			<span class="smallTitle">서울의 소식</span>
			<h1>구 별로 세분화해 최신순으로</h1>
			<h1>제공하는 뉴스 리스트</h1>
		  <br/>
		  <p>구 선택 시 선택한 구에 해당하는 뉴스들만 선별해서 제공합니다.</p>
		  <p>뉴스 제목 클릭 시 상세 뉴스 페이지를 볼 수 있습니다.</p>
		</div>
      </div>
      <div id="box-forth" class="box box-odd" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <div>
		<span class="smallTitle">서울의 명소</span>
		<h1>서울시 안의 전기차 충전소를</h1>
		<h1>편리하게 검색할 수 있는 지도</h1>
		  <br/>
		  <p><b>내 주변 서울시 내의 전기차 충전소와 편의시설 위치정보를 제공합니다.</b></p><br>
		<table class="landingTable" style="width:80%">
			<tr>
				<td><img class="landingTableImg" src="/landingpageimage/ev1.gif" style=" width:60%; height:50%;"></td>
				<td><img class="landingTableImg" src="/landingpageimage/ev2.gif" style=" width:60%; height:50%;"></td>
				<td><img class="landingTableImg" src="/landingpageimage/ev3.gif" style=" width:60%; height:50%;"></td>
			</tr>
			<tr>			
				<td><p>충전소 검색 시 주변 편의시설 정보도 함께 제공합니다.</p></td>
				<td><p>길 찾기 시 가장 빠른 경로와<br>주변 전기차 충전소 위치정보 제공합니다.</p></td>
				<td><p>회원이 되어 자주 가는 <br> 충전소 정보를 담아보세요!</p></td>
			</tr>
		</table>
        </div>
        <img id='main4' src="/landingpageimage/main4.png" alt="Placeholder Image">
      </div>
      <div id="box-fifth" class="box box-even" data-w-id="e1165d61-2cbb-cc22-6e05-5b6165b830fe">
        <img id='main5' src="/landingpageimage/main5.png" alt="Placeholder Image">
        <div>
			<span class="smallTitle">서울의 나눔</span>
			<h1>회원의 니즈에 딱 맞춘</h1>
			<h1>상품들을 제시하는 중고거래</h1>
			<br/>
			<article>
				<p>선택한 상품과 유사한 상품들을 연관 상품으로 제공합니다.</p>
				<table class="landingTable" style="width:80%">
					<tr>
						<td><img class="landingTableImg" src="/landingpageimage/local1.gif" style=" width:50%; height:50%;"></td>
						<td><img class="landingTableImg" src="/landingpageimage/pr2.gif" style=" width:50%; height:50%;"></td>
						<td><img class="landingTableImg" src="/landingpageimage/pr1.gif" style=" width:50%; height:50%;"></td>
					</tr>
					<tr>			
						<td><p>원하는 지역 선택 시 <br>해당하는 상품들만<br> 선별해서 제공합니다.</p></td>
						<td><p>검색 내역을 기반으로 추천 카테고리 상품을 제공합니다.</p></td>
						<td><p>회원이 되어 원하는 <br> 상품을 담아보세요!</p></td>
					</tr>
				</table>
			</article>
			<a href='/product/productMain?area=전체'>
	          	<button class="btn-movePage" class="btn btn-primary" style=" width:auto; height:auto;">
	        	<h1 id="moveMainText"><img src="/landingpageimage/pr3.gif" alt="이동" style=" width:13%; height:auto; margin:0">중고거래 이동</h1></button>
	        </a>
		</div>
      </div>
      <!-- 네 개의 박스 끝 -->
    </div>
	<div class="back-to-top-wrapper">
	  <a href="#" class="back-to-top-button"><img src="/landingpageimage/uparrow.png"></a>
	</div>
  </div>
  <%@ include file="./footer.jsp" %>
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