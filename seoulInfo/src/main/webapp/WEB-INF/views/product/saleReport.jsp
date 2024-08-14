<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>판매자 신고</title>
<style>
	body {
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	    background-color: #f0f0f0;
	    min-height: 100vh; /* 최소 높이를 설정하여 작은 화면에서도 중앙 정렬 유지 */
	}
	html{
	    margin: 0;
	    padding: 0;
	    height: 100%;
	    overflow: hidden; /* 전체 페이지에서 스크롤바를 없앰 */
	}

	.container {
	    background-color: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    width: 100%;
	    max-width: 400px; /* 최대 너비를 설정하여 큰 화면에서 고정된 너비 유지 */
	    box-sizing: border-box;
	    display: flex;
	    flex-direction: column;
	    align-items: stretch;
	    margin: 10px; /* 작은 화면에서 여백 추가 */
	    height: calc(100% - 20px); /* 화면 높이에 맞게 조정, 여백을 고려하여 높이 설정 */
	    overflow: hidden; /* 컨테이너에서 스크롤바가 생기는 것을 방지 */
	}

	h2, .info, form, div, label, textarea, select, button {
	    margin-bottom: 15px;
	    width: 100%;
	}
	h2 {
	    text-align: center;
	    color: #333;
	    margin-bottom: 10px;
	}
	.info {
	    color: #555;
	    text-align: center;
	}
	label {
	    margin-bottom: 5px;
	    color: #333;
	}
	textarea, select, input {
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    box-sizing: border-box;
	}
	button {
	    padding: 10px;
	    border: none;
	    background-color: black;
	    color: #fff;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size: 16px;
	}
	button:hover {
	    background-color: darkred;
	}

	/* 미디어 쿼리를 사용하여 반응형 디자인 추가 */
	@media (max-width: 600px) {
	    .container {
			margin-left:25px;
			
	        padding:15px;
	        width: 90%; /* 작은 화면에서 너비를 90%로 설정 */
	    }
	    button {
	        padding: 12px;
	        font-size: 14px;
	    }
	    textarea, select, input {
	        padding: 8px;
	    }
	}
</style>
<script type="text/javascript">
/*	function handleFormSubmit(event) {
	    event.preventDefault(); // 기본 폼 제출 동작 방지
	    // 폼 제출 후 팝업 메시지 표시
	    alert('신고 완료 되었습니다.');
	    // 창 닫기
	    window.close();
	}*/
    window.onload = function() {
		// 창 크기 설정
		var width = 400;
		var height = 400;
		// 화면 크기 가져오기
		var screenWidth = window.screen.width;
		var screenHeight = window.screen.height;

		// 중앙 위치 계산
		var left = (screenWidth - width) / 2;
		var top = (screenHeight - height) / 2;

		// 창 크기와 위치 설정
		window.resizeTo(width, height);
		window.moveTo(left, top);
		
		// 폼 제출 이벤트 핸들러 설정
		// document.querySelector("form").onsubmit = handleFormSubmit;
    };
</script>	
</head>
<body>
	<div class="container">
	    <h2>판매자 신고</h2><hr/>
		<div>
		    <p>신고할 판매자 : <strong>${selectedUserId}</strong></p>
		</div>
	    <form action="/product/saleReport" method="get">
	        <div>
	            <label for="report_reason">신고 사유 </label>
	            <textarea id="report_reason" name="report_reason" required></textarea>
	        </div>
	        <div>
	            <label for="report_cate">신고 분류 </label>
	            <select id="report_cate" name="report_cate" required>
	                <option value="중고거래">중고거래</option>
	                <option value="뉴스댓글">뉴스댓글</option>
	                <option value="축제댓글">축제댓글</option>
	            </select>
	        </div>
	        <div>
	            <button class="btn-report">신고 제출</button>
	        </div>
			<input type="hidden" name="member_id" value="${selectedUserId}" />
	    </form>
	</div>
	<script>
	setTimeout(function() {
	    window.close();
	}, 1); // 100 밀리초 = 0.1초
	</script>
</body>
</html>
