<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <link href="/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Plus Jakarta Sans:regular,600,italic,600italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="/images/webclip.png" rel="apple-touch-icon">

  
  <link href="/css/mypage/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet" type="text/css">
  <link href="/css/mypage/question.css" rel="stylesheet" type="text/css"> 
  <link href="/css/footer/footer.css" rel="stylesheet" type="text/css">
   
  
   

</head>
<body>
  <div class="page-wrapper">
	

	
	<!-- 검색 start -->
    <%@ include file="../Nav/myPageNav.jsp" %>
	<!-- 검색 end -->	
	
	
    <div class="main-wrapper">
    
    	<!--한) 마이페이지 상단 start-->
      <div class="section-posts-row">
        <div class="padding-global">
          <div class="padding-section-medium">
            <div class="container-full-width">							  
              <div class="w-dyn-list">
                <div role="list" class="w-dyn-items">
                
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
					
				</div>					
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--한) 마이페이지 상단 end-->
          
    
	<!--한) 1:1 문의 목록 start-->
	<div class="section-contact">
	  <div class="padding-global">
	    <div class="padding-section-medium">
	      <div class="container-large">
	        <div class="_2-column-grid-uneven-right">
	          <!-- 왼쪽 컬럼 -->
	          <div id="w-node-dcacb4c5-0e4e-5bd9-3310-1e984a55f96a-4f5c4825" data-w-id="dcacb4c5-0e4e-5bd9-3310-1e984a55f96a" style="opacity:0">
	            <div class="accent"></div>
	            <div class="spacer-large"></div>
	            <h2>1 : 1 문의 </h2>
	            <div class="spacer-large"></div>
	            <p></p>
	          </div>
	
	          <!-- 오른쪽 컬럼 -->
	          <div id="Style-Guide-Form" data-w-id="3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64" style="opacity:0;" class="form-component w-node-_3c63ffa7-9e63-cf3d-0d5b-95ec9cec8a64-4f5c4825 w-form">
	            <!-- 카테고리 선택 및 문의하기 버튼 -->
	            <div class="category-inquiry-container">
	              <div class="category-container">
	                <label for="category-select">카테고리</label>
	                <select id="category-select" name="question_cate" onchange="filterInquiries()">
				        <option value="전체" selected>전체</option>
				        <option value="뉴스">뉴스</option>
						<option value="축제">축제</option>	        
				        <option value="중고거래">중고거래</option>
				        <option value="전기차">전기차</option>
	                </select>
	              </div>
	              <button class="inquiry-button" onclick="openPopup()">문의하기</button>
	            </div>            
	            
				<!-- 1:1 문의 리스트 조회 테이블 -->
				<table class="question-table">
				    <thead>
				        <tr>
				            <th>카테고리</th>
				            <th>제목</th>
				            <th>문의내용</th>
				            <th>작성일</th>
				            <th>답변여부</th>
				            <th>삭제</th>
				        </tr>
				    </thead>
				    <tbody id="question-tbody">
				        <c:forEach items="${questionList}" var="ql">
				            <tr class="question" data-question-no="${ql.question_no}">
				                <input type="hidden" name="member_id" value="${sessionScope.member.member_id}" />
				                <td>${ql.question_cate}</td>
				                <td>${ql.question_title}</td>
				                <td>${ql.question_content}</td>
				                <input type="hidden" class="question_no" name="question_no" value="${ql.question_no}" />
				                <td>
				                    <fmt:formatDate value="${ql.question_date}" pattern="yy.MM.dd" />
				                </td>
				                <td>${ql.question_status}</td>
				                <td>
				                    <form action="deleteQuestion" method="post" style="display:inline;">
				                        <input type="hidden" name="member_id" value="${sessionScope.member.member_id}" />
				                        <input type="hidden" name="question_no" value="${ql.question_no}" />
				                        <input type="submit" value="x" class="delete-button" />
				                    </form>
				                </td>
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
	<!--한) 1:1 문의 목록 end-->
	
	

	<!-- 1:1 문의 상세조회 팝업 -->
	<div id="popup2" class="popup">
	    <div class="popup-content">
	        <span class="close-btn" onclick="closePopup2()">&times;</span>
	        <div class="spacer-large"></div>
	        <h3>1 : 1 문의 상세내용</h3>
	        <div class="spacer-large"></div>
	        <form action="selectQuestion" method="get" class="inquiry-form">
	            <input type="hidden" id="popup-member-id" name="member_id" value="" />
	            <input type="hidden" id="popup-question-no" name="question_no" value="" />
	            <div class="form-row">
	                <label for="popup-category">카테고리</label>
	                <input type="text" id="popup-category" name="question_cate" value="" readonly />
	            </div>
	            <div class="form-row">
	                <label for="popup-title">제목</label>
	                <input type="text" id="popup-title" name="question_title" value="" readonly />
	            </div>
	            <div class="form-row">
	                <label for="popup-content">문의내용</label>
	                <textarea id="popup-content" name="question_content" readonly></textarea>
	            </div>
	            <div class="form-row reply">
	                <label for="popup-reply">답변내용</label>
	                <textarea id="popup-reply" name="answer_content" readonly>
	                	${question.answer_content == '' ? '답변이 없습니다' : question.answer_content}
	                </textarea>
	            </div>	            
	        </form>
	    </div>
	</div>
		
		
	
	<!-- 팝업 창(1:1문의 등록) -->
	<div id="popup" class="popup">
	  <div class="popup-content">
	    <span class="close-btn" onclick="closePopup()">&times;</span>
	    <div class="spacer-large"></div>
	    <h3>1 : 1 문의하기</h3>
	    <div class="spacer-large"></div>
	    <form action="saveQuestion" method="post" class="inquiry-form">
	      <div class="form-row">
	      <label for="category">카테고리</label>
	      <select id="category" name="question_cate" required>
	        <option value="" disabled selected>카테고리를 선택하세요</option>
	        <option value="뉴스">뉴스</option>
			<option value="축제">축제</option>	        
	        <option value="중고거래">중고거래</option>
	        <option value="전기차">전기차</option>
	      </select>
	      </div>
	      <div class="form-row">
	        <label for="title">제목</label>
	        <input type="text" id="title" name="question_title" required>
	      </div>
	      <div class="form-row">
	        <label for="content">문의내용</label>
	        <textarea id="content" name="question_content" required></textarea>
	      </div>
	      <div class="spacer-large"></div>
	      <div class="form-submit-row">
	      	<input name="member_id" type="hidden" value="${sessionScope.member.member_id}" />
	        <button class="inquiry-button" type="submit">제출</button>
	      </div>
	    </form>
	  </div>
	</div>	

		
      
    </div><!-- main-wrapper end -->
		           
    
  </div><!-- page-wrapper end -->
  <%@ include file="../footer.jsp" %>


  
  
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6684f0fb2a5375354f5c47e9" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="/js/webflow.js" type="text/javascript"></script>
  <!-- 제이쿼리 라이브러리 추가 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
  
  <!-- 카테고리 필터 조회-->
  function filterInquiries() {
    const category = document.getElementById('category-select').value;
    const tbody = document.getElementById('question-tbody');
    const rows = tbody.getElementsByTagName('tr');
    
    for (let i = 0; i < rows.length; i++) {
      const row = rows[i];
      const cell = row.getElementsByTagName('td')[0]; // 카테고리 셀
      const rowCategory = cell.textContent || cell.innerText;

      if (category === "전체" || rowCategory === category) {
        row.style.display = ""; // 해당 카테고리에 맞는 행 표시
      } else {
        row.style.display = "none"; // 맞지 않는 행 숨기기
      }
    }
  }
  
	<!--팝업창-->
 	function openPopup() {
	  document.getElementById('popup').style.display = 'block';
	}

	function closePopup() {
	  document.getElementById('popup').style.display = 'none';
	}  
	

  	
  	$(document).ready(function () {
  	    $('.question').click(function () {
  	        let question_no = $(this).find('.question_no').val();

  	        // AJAX를 사용하여 특정 질문의 세부 정보를 가져오기
  	        $.ajax({
  	            url: '/mypage/selectQuestion2',
  	            type: 'GET',
  	            data: {
  	                question_no: question_no
  	            },
  	            success: function (response) {
  	                if (response.status === 'success') {
  	                    const question = response.question;

  	                    // 팝업에 질문 세부 정보 업데이트
  	                    $('#popup-question-no').val(question.question_no);
  	                    $('#popup-category').val(question.question_cate);
  	                    $('#popup-title').val(question.question_title);
  	                    $('#popup-content').val(question.question_content);
  	                    $('#popup-reply').val(question.answer_content);

  	                    // 팝업 표시
  	                    openPopup2();
  	                }
  	            },
  	            error: function (err) {
  	                console.log(err);
  	            }
  	        });
  	    });

  	    function openPopup2() {
  	        $('#popup2').show();
  	    }

  	    function closePopup2() {
  	        $('#popup2').hide();
  	    }

  	    // 닫기 버튼에 이벤트 바인딩
  	    $('.close-btn').click(function () {
  	        closePopup2();
  	    });
  	});
  	
  	
  	
  </script>
</body>
</html>