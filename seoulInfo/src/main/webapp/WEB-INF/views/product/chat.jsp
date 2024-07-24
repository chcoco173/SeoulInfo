<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<html data-wf-page="6684f0fb2a5375354f5c4829"
	data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
<meta charset="utf-8">
<title>Template Style Guide</title>
<meta content="Template Style Guide" property="og:title">
<meta content="Template Style Guide" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="/css/normalize.css" rel="stylesheet" type="text/css">
<link href="/css/webflow.css" rel="stylesheet" type="text/css">
<link href="/css/jades-dandy-site-14d3e0.webflow.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<link href="/images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/images/webclip.png" rel="apple-touch-icon">
</head>
<body>
<div class="page-wrapper">
	<%@include file="../productNav/productNav.jsp"%>
	
	<div class="chat-container hidden" id="chat-page">
	    <div class="users-list">  
	        <div class="users-list-container">
	            <h2>연결된 유저</h2>
	            <ul id="connectedUsers">
	            </ul>
	        </div>
	        <div>
	            <p id="connected-user-fullname"></p>
	            <a class="logout" href="javascript:void(0)" id="logout">로그아웃</a>
	        </div>
	    </div>
	
	    <div class="chat-area">
	        <div class="chat-area" id="chat-messages">
	        </div>
	
	        <form id="messageForm" name="messageForm" class="hidden">
	            <div class="message-input">
	                <input autocomplete="off" type="text" id="message" placeholder="메세지 입력">
	                <input type="file" id="fileUpload" class="file-upload" style="display: none;" />
	    			<button type="button" id="fileUploadButton">파일 업로드</button>
	                <button>보내기</button>
	            </div>
	        </form>
	    </div>
	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/chat.js"></script>
</body>
</html>
