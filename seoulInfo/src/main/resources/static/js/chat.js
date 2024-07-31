'use strict';

const chatPage = document.querySelector('#chat-page');
const messageForm = document.querySelector('#messageForm');
const messageInput = document.querySelector('#message');
const connectingElement = document.querySelector('.connecting');
const chatArea = document.querySelector('#chat-messages');
const logout = document.querySelector('#logout');
const fileUploadInput = document.querySelector('#fileUpload');
const fileUploadButton = document.querySelector('#fileUploadButton');
const logId = document.querySelector('#connected-userId').textContent;
// 날짜 바뀌는 요소 추가
let lastMessageDate = null;


let stompClient = null;
let member_id = logId; // 서버에서 가져온 member_id
let selectedUserId = null;
let selectedSaleId = null; // 선택된 sale_id 추가

// 페이지 로드 시 WebSocket 연결 설정
document.addEventListener('DOMContentLoaded', () => {
    connect();
});

function connect() {
	chatPage.classList.remove('hidden');
    const socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, onConnected, onError);
}

function onConnected() {
    // 특정 사용자(member_id)에게 전송된 개인 메시지를 수신
    stompClient.subscribe(`/user/${member_id}/queue/messages`, onMessageReceived);
    
    // 모든 사용자에게 전송된 공용 메시지를 수신
    stompClient.subscribe(`/user/public`, onMessageReceived);

    // 사용자를 등록
    stompClient.send("/app/user.addUser", {}, JSON.stringify({member_id: member_id, status: 'ONLINE'}));

    // 연결된 유저 목록을 가져와 표시
    findAndDisplayotherUsers().then();
}

async function findAndDisplayotherUsers() {
    try {
        const otherUsersResponse = await fetch('/users');
		console.log("11"+otherUsersResponse);
        let otherUsers = await otherUsersResponse.json();
        console.log('Fetched connected users:', otherUsers); // 로그 추가

        // 현재 사용자(내 이름)를 목록에서 제거
/*        otherUsers = otherUsers.filter(user => user.member_id !== member_id);
        console.log('Filtered connected users:', otherUsers); // 로그 추가*/

        const otherUsersList = document.getElementById('otherUsers');
        otherUsersList.innerHTML = '';


        otherUsers.forEach((user, index) => {
            appendUserElement(user, otherUsersList);
            // 마지막 요소가 아닐 때만 구분선 추가
            if (index < otherUsers.length - 1) {
                const separator = document.createElement('li');
                separator.classList.add('separator');
                otherUsersList.appendChild(separator);
            }
        });
    } catch (error) {
        console.error('Error fetching connected users:', error);
    }
}

function appendUserElement(user, otherUsersList) {
    console.log('Appending user:', user); // 로그 추가
    const listItem = document.createElement('li');
    listItem.classList.add('user-item');
    listItem.id = user.member_id;

    // 사용자 프로필 사진으로 가져와야 함
    const userImage = document.createElement('img');
    userImage.src = '/images/chat/user_icon.png';
    userImage.alt = user.member_id;

    // Container for name and status, allowing layout control
    const userDetails = document.createElement('div');
    userDetails.classList.add('user-details');

    const usernameSpan = document.createElement('span');
    usernameSpan.textContent = user.member_id; // User name only
    usernameSpan.classList.add('user-name');

    // 안 읽은 메세지 존재하는 채팅방 알림
    const receivedMsgs = document.createElement('span');
    receivedMsgs.textContent = '0';
    receivedMsgs.classList.add('nbr-msg', 'hidden');

    const statusSpan = document.createElement('div'); // Use div to automatically move to next line
    statusSpan.textContent = `(${user.status})`;
    statusSpan.classList.add(user.status.toLowerCase(), 'status'); // Apply status styles here

	// 숨겨진 요소로 sale_id 추가
	const saleIdHidden = document.createElement('input'); // hidden 요소로 sale_id 추가
	saleIdHidden.type = 'hidden';
	saleIdHidden.value = user.sale_id;
	saleIdHidden.classList.add('sale-id');
	
    listItem.appendChild(userImage);
    // 안읽음 표시
    listItem.appendChild(receivedMsgs);
    userDetails.appendChild(usernameSpan);

    userDetails.appendChild(statusSpan);
	listItem.appendChild(saleIdHidden); // Append sale_id hidden element

    listItem.appendChild(userDetails); // Append the details container to the list item

    listItem.addEventListener('click', userItemClick);

    otherUsersList.appendChild(listItem);
}

function userItemClick(event) {
/*	alert(1);
	alert(logId);*/
    document.querySelectorAll('.user-item').forEach(item => {
        item.classList.remove('active');
    });
    messageForm.classList.remove('hidden');

    const clickedUser = event.currentTarget;
    clickedUser.classList.add('active');

    selectedUserId = clickedUser.getAttribute('id');
	selectedSaleId = clickedUser.querySelector('.sale-id').value; // hidden 요소에서 sale_id 가져오기

	console.log('Selected User ID: ' + selectedUserId);
	console.log('Selected Sale ID: ' + selectedSaleId);
	
    fetchAndDisplayUserChat().then();

    const nbrMsg = clickedUser.querySelector('.nbr-msg');
    nbrMsg.classList.add('hidden');
    nbrMsg.textContent = '0';

	fetchProductInfo(selectedSaleId);
	
}

// 상품 상세 정보
function fetchProductInfo(saleId) {
    console.log('Fetching product info for sale ID: ' + saleId);
    fetch(`/product/getProductInfo?sale_id=${saleId}`)
        .then(response => {
            console.log('Response received: ', response);
            return response.json();
        })
        .then(data => {
            console.log('Product info received: ', data);
            updateChatHeader(data);
        })
        .catch(error => {
            console.error('Error fetching product info:', error);
        });
}

function updateChatHeader(data) {
    const product = data.product;
    const productImage = data.productImage;

    console.log('Updating chat header with product info: ', product);
    console.log('Product image info: ', productImage);

    document.getElementById('product-name').innerText = `상품명: ${product.sale_name}`;
    document.getElementById('transaction-status').innerText = `거래 상태: ${product.sale_status}`;
    if (productImage) {
        document.getElementById('product-image').src = `/productImage/${productImage.productimg_alias}`;
    } else {
        document.getElementById('product-image').src = '/path/to/default-image.jpg';
    } 
}

// 메시지 표시 함수 수정
function displayMessage(senderId, content, timestamp) {
    const messageDate = new Date(timestamp).toISOString().split('T')[0]; // 메시지의 날짜 (YYYY-MM-DD)

    if (lastMessageDate !== messageDate) {
        // 날짜가 변경되었음을 나타내는 요소 추가
        const dateElement = document.createElement('div');
        dateElement.classList.add('message-date');
        dateElement.textContent = messageDate;
        chatArea.appendChild(dateElement);
        lastMessageDate = messageDate; // 마지막 메시지 날짜를 업데이트
    }

    const messageContainer = document.createElement('div');
    messageContainer.classList.add('message');
    if (senderId === member_id) {
        messageContainer.classList.add('sender');
    } else {
        messageContainer.classList.add('receiver');
    }

    // 파일 URL인지 확인하여 이미지로 표시 !!!이미지 업로드 코딩 추가 부분!!!
    if (content.startsWith('/files/download/')) {
        const downloadLink = document.createElement('a');
        downloadLink.href = content;
        downloadLink.download = '';

        const message = document.createElement('img');
        message.src = content;
        message.classList.add('chat-image');

        downloadLink.appendChild(message);
        messageContainer.appendChild(downloadLink);
    } else {
		const message = document.createElement('p');
		message.textContent = content;
		messageContainer.appendChild(message);
    }

    chatArea.appendChild(messageContainer);

    // Add timestamp below the message container
    const timestampElement = document.createElement('div');
    timestampElement.classList.add('timestamp');
    if (senderId === member_id) {
        timestampElement.classList.add('sender-timestamp');
    } else {
        timestampElement.classList.add('receiver-timestamp');
    }
    timestampElement.textContent = formatTimestamp(timestamp);
    chatArea.appendChild(timestampElement);

	setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
	scrollToBottom();
    chatArea.scrollTop = chatArea.scrollHeight;
}


function formatTimestamp(timestamp) {
	console.log("2>" + timestamp);
	
    const date = new Date(timestamp);
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const ampm = hours >= 12 ? '오후' : '오전';
    const formattedHours = hours % 12 || 12;
    const formattedMinutes = minutes < 10 ? `0${minutes}` : minutes;
	
	console.log("3>" +timestamp);
	
    return `${ampm} ${formattedHours}:${formattedMinutes}`;
}

// Update fetchAndDisplayUserChat to include timestamp
async function fetchAndDisplayUserChat() {
	
    const userChatResponse = await fetch(`/messages/${member_id}/${selectedUserId}?sale_id=${selectedSaleId}`);
	console.log("!!!!!!!!!!!!!!!!!!!!!!"+userChatResponse);
    const userChat = await userChatResponse.json();
	
    chatArea.innerHTML = '';
    userChat.forEach(chat => {
        displayMessage(chat.senderId, chat.content, chat.timestamp);
    });
	setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
    scrollToBottom();
	chatArea.scrollTop = chatArea.scrollHeight;
}

function scrollToBottom() {
    chatArea.scrollTop = chatArea.scrollHeight;
}

function onError() {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}


// Update sendMessage to include timestamp
function sendMessage(event) {
    const messageContent = messageInput.value.trim();
    if (messageContent && stompClient) {
        const chatMessage = {
            senderId: member_id,
            recipientId: selectedUserId,
            content: messageInput.value.trim(),
            timestamp: new Date().toISOString(),
			sale_id: selectedSaleId // sale_id 추가
        };
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        displayMessage(member_id, messageInput.value.trim(), chatMessage.timestamp);
        messageInput.value = '';
    }
	setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
    chatArea.scrollTop = chatArea.scrollHeight;
    event.preventDefault();
}

// Update onMessageReceived to include timestamp
async function onMessageReceived(payload) {
    /*await findAndDisplayotherUsers();*/
	await fetchAndDisplayUserChat();	// !! 이게 없어서 메세지 real-time 수신 안됐잖아!!

    console.log('Message received', payload);
    const message = JSON.parse(payload.body);
    if (selectedUserId && selectedUserId === message.senderId) {
        displayMessage(message.senderId, message.content, message.timestamp);
        setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
		chatArea.scrollTop = chatArea.scrollHeight;
    }

    if (selectedUserId) {
        document.querySelector(`#${selectedUserId}`).classList.add('active');
    } else {
        messageForm.classList.add('hidden');
    }

    const notifiedUser = document.querySelector(`#${message.senderId}`);
    if (notifiedUser && !notifiedUser.classList.contains('active')) {
        const nbrMsg = notifiedUser.querySelector('.nbr-msg');
        nbrMsg.classList.remove('hidden');
        nbrMsg.textContent = '';
    }
}

// 파일 업로드 후 메시지에 URL을 표시
async function uploadFile(file) {
    const formData = new FormData();
    formData.append("file", file);

    const response = await fetch('/files/upload', {
        method: 'POST',
        body: formData
    });

    if (response.ok) {
        const result = await response.json();
        const chatMessage = {
            senderId: member_id,
            recipientId: selectedUserId,
            content: result.url,
            timestamp: new Date().toISOString(),
			sale_id: selectedSaleId // sale_id 추가
        };
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        displayMessage(member_id, chatMessage.content, chatMessage.timestamp);
    } else {
        console.error('File upload failed');
    }
}

fileUploadButton.addEventListener('click', () => fileUploadInput.click());
fileUploadInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
        uploadFile(file);
    }
});


/*document.getElementById('deal-done').addEventListener('click', dealDone);

function dealDone() {
    if (selectedSaleId) {
        fetch('/product/updateStatus', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `sale_id=${selectedSaleId}&sale_status=판매완료`
        })
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                alert('거래 상태가 판매완료로 변경되었습니다.');
                document.getElementById('transaction-status').innerText = '거래 상태: 판매완료';
            } else {
                alert('거래 상태 변경에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error updating sale status:', error);
            alert('거래 상태 변경 중 오류가 발생했습니다.');
        });
    } else {
        alert('선택된 상품이 없습니다.');
    }
}*/

function onLogout() {
    stompClient.send("/app/user.disconnectUser",
        {},
        JSON.stringify({member_id: member_id, status: 'OFFLINE'})
    );
    window.location.reload();
}



/*usernameForm.addEventListener('submit', connect, true); // step 1*/
messageForm.addEventListener('submit', sendMessage, true);
logout.addEventListener('click', onLogout, true);
window.onbeforeunload = () => onLogout();
