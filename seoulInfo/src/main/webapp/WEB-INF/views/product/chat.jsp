<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<html data-wf-page="6684f0fb2a5375354f5c4829" data-wf-site="6684f0fb2a5375354f5c47e9">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>

    <!-- General CSS -->
    <link rel="stylesheet" href="/css/normalize.css" type="text/css">
    <link rel="stylesheet" href="/css/webflow.css" type="text/css">
    <link rel="stylesheet" href="/css/jades-dandy-site-14d3e0.webflow.css" type="text/css">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">

    <!-- Chat Specific CSS -->
    <link rel="stylesheet" href="/css/product/chat.css">

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
                    <ul id="connectedUsers"></ul>
                </div>
                <div>
                    <p id="connected-user-fullname">${sessionScope.member.member_id} ( ${sessionScope.member.member_name}님 )</p>
                    <!--<a class="logout" href="javascript:void(0)" id="logout">로그아웃</a>-->
                </div>
            </div>
        
            <div class="chat-area">
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
