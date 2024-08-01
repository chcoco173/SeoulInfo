<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<html data-wf-page="6684f0fb2a5375354f5c4829" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
	<meta content="" property="og:title">
	<meta content="" property="twitter:title">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Webflow" name="generator">
    <!-- General CSS -->
    <link rel="stylesheet" href="/css/normalize.css" type="text/css">
    <link rel="stylesheet" href="/css/webflow.css" type="text/css">
    <link rel="stylesheet" href="/css/jades-dandy-site-14d3e0.webflow.css" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">

	<!-- Add jQuery library -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
    <!-- Chat Specific CSS -->
    <link rel="stylesheet" href="/css/product/chat.css">
	<style>
		@media (max-width: 1200px) {
		    .page-wrapper {
		        padding: 20px;
		    }

		    #chat-section .chat-container {
		        max-width: 100%;
		        min-width: 100%;
		    }
		}

		@media (max-width: 768px) {
		    .page-wrapper {
		        flex-direction: column;
		        padding: 10px;
		    }

		    #chat-section .chat-container {
		        flex-direction: column;
		        max-width: 100%;
		        min-width: 100%;
		        min-height: auto;
		        max-height: none;
		    }

		    #chat-section .users-list, #chat-section .chat-area {
		        border-radius: 0;
		        border-right: none;
		        border-bottom: 1px solid #ccc;
		    }

		    #chat-section .chat-area {
		        flex: 1;
		        border-bottom: none;
		        border-top-right-radius: 0;
		        border-bottom-right-radius: 0;
		    }

		    #chat-section .users-list {
		        flex: none;
		        border-bottom: 1px solid #ccc;
		        padding: 10px;
		    }

		    #chat-section .message-input {
		        flex-direction: column;
		    }

		    #chat-section .message-input input {
		        margin-right: 0;
		        margin-bottom: 10px;
		    }
		}

		@media (max-width: 480px) {
		    #chat-section .users-list h2 {
		        font-size: 1.2rem;
		    }

		    #chat-section .users-list ul {
		        padding: 0;
		    }

		    #chat-section .user-item {
		        flex-direction: column;
		        align-items: flex-start;
		    }

		    #chat-section .user-item img {
		        margin-right: 0;
		        margin-bottom: 5px;
		    }

		    #chat-section .user-item span {
		        display: block;
		        margin-bottom: 5px;
		    }

		    #chat-section .message-input button {
		        width: 100%;
		    }
		}

	    .page-wrapper {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        justify-content: center;
	        height: 100vh;
	        width: 100%;
	    }

	    #navbar {
	        width: 100%;
	        display: flex;
	        justify-content: center;
	    }

	    #chat-section {
	        width: 100%;
	        display: flex;
	        justify-content: center;
	        margin-top: 20px;
	    }

	    .chat-container {
	        max-width: 800px;
	        min-width: 800px;
	        min-height: 600px;
	        max-height: 600px;
	    }
	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
	
</head>
<body>
<div class="page-wrapper">
    <div id="navbar">
        <%@include file="../productNav/productNav.jsp"%>
    </div>
    
    <div id="chat-section">
        <div class="chat-container hidden" id="chat-page">
            <div class="users-list">  
                <div class="users-list-container">
                    <h2>연결된 유저</h2>
                    <ul id="chatRooms">						
					</ul>
                </div>
                <div>
                    <p id="connected-userId">${sessionScope.member.member_id}</p>
					<p>( ${sessionScope.member.member_name}님 )</p>
                </div>
            </div>
        
            <div class="chat-area">
				<div class="chat-header">
				    <div class="product-info">
				        <img id="product-image" src="/productImages/deal_state.png" alt="Product Image" style="width: 50px; height: 50px; margin-right: 10px;">
				        <div>
				            <div id="product-name">상품명: </div>
				            <div id="transaction-status">거래 상태: </div>
				        </div>
				    </div>
				    <div class="action-buttons">
				        <button id="report" class="hidden">판매자 신고</button>
						<button id="deal-done" class="hidden">거래 완료</button>
				        <button id="chat-done">채팅 나가기${sessionScope.logid.member_id}</button>						
				    </div>
				</div>

				
                <div class="chat-area" id="chat-messages"></div>
                <form id="messageForm" name="messageForm" class="hidden">
                    <div class="message-input">
                        <input autocomplete="off" type="text" id="message" placeholder="메세지 입력">
                        <input type="file" id="fileUpload" class="file-upload" style="display: none;" />
                        <button type="button" id="fileUploadButton">파일 업로드</button>
                        <button type="submit">보내기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/chat.js"></script>

</body>
</html>
