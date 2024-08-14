'use strict';

const chatPage = document.querySelector('#chat-page');
const chatHeader = document.querySelector('#chat-header');
const messageForm = document.querySelector('#messageForm');
const messageInput = document.querySelector('#message');
const connectingElement = document.querySelector('.connecting');
const chatArea = document.querySelector('#chat-messages');
const chatDone = document.querySelector('#chat-done');
const fileUploadInput = document.querySelector('#fileUpload');
const fileUploadButton = document.querySelector('#fileUploadButton');
const userId = document.querySelector('#connected-userId').textContent; // 서버에서 가져온 member_id
// 날짜 바뀌는 요소 추가
let lastMessageDate = null;


let stompClient = null;
// let member_id = logId; // 서버에서 가져온 member_id
let selectedUserId = null;
let selectedSaleId = null; // 선택된 sale_id 추가

// 페이지 로드 시 WebSocket 연결 설정
document.addEventListener('DOMContentLoaded', () => {
    connect();
	
	document.getElementById('chat-done').addEventListener('click', leaveChatRoom);
	document.getElementById('deal-done').addEventListener('click', updateSaleStatus);
	document.getElementById('report').addEventListener('click', () => {
	    openReportPopup(selectedUserId, 'seller');
	});

	document.getElementById('report-buyer').addEventListener('click', () => {
	    openReportPopup(selectedUserId, 'buyer');
	});

	messageForm.addEventListener('submit', sendMessage, true);
	window.onbeforeunload = () => onLogout();
});

function connect() {
	chatPage.classList.remove('hidden');
    const socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);

    stompClient.connect({}, onConnected, onError);
}

function onConnected() {
    // 특정 사용자(logId)에게 전송된 개인 메시지를 수신
    stompClient.subscribe(`/user/${userId}/queue/messages`, onMessageReceived);
    
    // 모든 사용자에게 전송된 공용 메시지를 수신
    stompClient.subscribe(`/user/public`, onMessageReceived);

    // 사용자를 등록
//	stompClient.send("/app/user.addUser", {}, JSON.stringify({userId: userId, status: 'ONLINE'}));

    // 연결된 유저 목록을 가져와 표시
    findAndDisplayChatRooms().then();
}

async function findAndDisplayChatRooms() {

        const findChatRoomsResponse = await fetch('/findChatRooms');
        let chatRooms = await findChatRoomsResponse.json();

        const chatRoomsList = document.getElementById('chatRooms');
        chatRoomsList.innerHTML = '';

        chatRooms.forEach((chatRoom, index) => {
            appendChatElement(chatRoom, chatRoomsList);
/*            // 마지막 요소가 아닐 때만 구분선 추가
            if (index < chatRooms.length - 1) {
                const separator = document.createElement('li');
                separator.classList.add('separator');
                chatRoomsList.appendChild(separator);
            }*/
        });
		
		if (selectedUserId) {
		    const selectedUserElement = document.getElementById(selectedUserId);
		    if (selectedUserElement) {
		        selectedUserElement.classList.add('active');
		    }
		}
}


async function appendChatElement(chatRoom, chatRoomsList) {
    
    const listItem = document.createElement('li');
    listItem.classList.add('user-item');

    // 상대방의 ID를 설정
    let otherUserId;
    let rolePrefix;
    if (chatRoom.senderId === userId) {
        otherUserId = chatRoom.recipientId;
        rolePrefix = "판매자: ";
    } else {
        otherUserId = chatRoom.senderId;
        rolePrefix = "구매자: ";
    }
    listItem.id = otherUserId;

    // 사용자 프로필 사진 대신 상품 이미지로 설정
    const saleInfo = await fetchSaleInfo(chatRoom.saleId);
    const userImage = document.createElement('img');
    userImage.src = saleInfo.saleImage;
    userImage.alt = saleInfo.saleName;

    // Container for name and status, allowing layout control
    const userDetails = document.createElement('div');
    userDetails.classList.add('user-details');

    // 상품 이름 요소 추가
    const saleNameSpan = document.createElement('span');
    saleNameSpan.textContent = saleInfo.saleName;
    saleNameSpan.classList.add('sale-name');

    const usernameSpan = document.createElement('span');
    usernameSpan.textContent = rolePrefix + otherUserId;
    usernameSpan.classList.add('user-name');

	// 안 읽은 메세지 존재하는 채팅방 알림
	const receivedMsgs = document.createElement('span');
	receivedMsgs.classList.add('nbr-msg', 'hidden');
	const unreadCount = await fetchUnreadCount(userId, otherUserId, chatRoom.saleId);
	if (unreadCount > 0) {
	    receivedMsgs.textContent = unreadCount;
	    receivedMsgs.classList.remove('hidden');
	}
	
	// 유저 온라인 오프라인 상태
/*	const user = await fetch(`/users?userId=${otherUserId}`);
	const statusSpan = document.createElement('div'); // Use div to automatically move to next line
	statusSpan.textContent = `(${user.status})`;
	statusSpan.classList.add(user.status.toLowerCase(), 'status'); // Apply status styles here*/

    // 숨겨진 요소로 sale_id 추가
    const saleIdHidden = document.createElement('input'); // hidden 요소로 sale_id 추가
    saleIdHidden.type = 'hidden';
    saleIdHidden.value = chatRoom.saleId;
    saleIdHidden.classList.add('sale-id');
    
    listItem.appendChild(userImage);

    
    userDetails.appendChild(saleNameSpan); // 상품 이름 추가
    userDetails.appendChild(document.createElement('br')); // 개행 추가
    userDetails.appendChild(usernameSpan);

//	userDetails.appendChild(statusSpan); // Append status information
    listItem.appendChild(saleIdHidden); // Append sale_id hidden element

    listItem.appendChild(userDetails); // Append the details container to the list item
	// 안읽음 표시
	listItem.appendChild(receivedMsgs);

    listItem.addEventListener('click', userItemClick);

    chatRoomsList.appendChild(listItem);

    // 구분선 추가
    const separator = document.createElement('li');
    separator.classList.add('separator');
    chatRoomsList.appendChild(separator);
}

async function fetchUnreadCount(userId, senderId, saleId) {
    try {
        const response = await fetch(`/unreadCount?userId=${userId}&senderId=${senderId}&saleId=${saleId}`);
        if (!response.ok) {
            throw new Error('Failed to fetch unread count');
        }
        const count = await response.json();
        return count;
    } catch (error) {
        console.error('Error fetching unread count:', error);
        return 0;
    }
}

// 안 읽은 메시지 수 업데이트 부분
function updateUnreadMessagesUI(senderId) {
    const userElement = document.getElementById(senderId);
    if (userElement && !userElement.classList.contains('active')) {
        const nbrMsg = userElement.querySelector('.nbr-msg');
        if (nbrMsg) {
            const unreadCount = parseInt(nbrMsg.textContent) || 0;
            nbrMsg.textContent = unreadCount + 1;
            nbrMsg.classList.remove('hidden');
        }
    }
}

async function fetchSaleInfo(saleId) {
    try {
        const response = await fetch(`/product/getProductInfo?sale_id=${saleId}`);
        if (!response.ok) {
            throw new Error('Failed to fetch sale info');
        }
        const data = await response.json();
        return {
            saleName: data.product.sale_name,
            saleImage: data.productImage ? `/productImage/${data.productImage.productimg_alias}` : '/path/to/default-image.jpg'
        };
    } catch (error) {
        console.error('Error fetching sale info:', error);
        return {
            saleName: 'Unknown Product',
            saleImage: '/path/to/default-image.jpg'
        };
    }
}

async function userItemClick(event) {
	
	chatDone.classList.remove('hidden');
	
    document.querySelectorAll('.user-item').forEach(item => {
        item.classList.remove('active');
    });
    messageForm.classList.remove('hidden');
	chatHeader.classList.remove('hidden');
	
    const clickedUser = event.currentTarget;
    clickedUser.classList.add('active');

    selectedUserId = clickedUser.getAttribute('id');
    selectedSaleId = clickedUser.querySelector('.sale-id').value;
    
	// lastMessageDate 초기화
	lastMessageDate = null;
	
    fetchAndDisplayUserChat().then();
	
	// 읽지 않은 메시지 수 초기화
	try {
	    const response = await fetch(`/resetUnreadCount?userId=${userId}&senderId=${selectedUserId}&saleId=${selectedSaleId}`, {
	        method: 'POST'
	    });

	    if (!response.ok) {
	        throw new Error(`Error resetting unread count: ${response.statusText}`);
	    }
	} catch (error) {
	    console.error('Error resetting unread count:', error);
	}

    const nbrMsg = clickedUser.querySelector('.nbr-msg');
    nbrMsg.classList.add('hidden');
    nbrMsg.textContent = '0';

    fetchProductInfo(selectedSaleId);

	// messageForm과 chatArea의 hidden 클래스 제거
	messageForm.classList.remove('hidden');
	chatArea.classList.remove('hidden');

	// rolePrefix 값에 따라 버튼의 hidden 클래스 조작
	const rolePrefix = clickedUser.querySelector('.user-name').textContent.startsWith('판매자:') ? '판매자' : '구매자';
	const reportButton = document.getElementById('report');
	const dealDoneButton = document.getElementById('deal-done');
	const reportBuyerButton = document.getElementById('report-buyer');


	if (rolePrefix === '판매자') {
	    reportButton.classList.remove('hidden');
	    dealDoneButton.classList.add('hidden');
		reportBuyerButton.classList.add('hidden');

	} else if (rolePrefix === '구매자') {
	    reportButton.classList.add('hidden');
	    dealDoneButton.classList.remove('hidden');
		reportBuyerButton.classList.remove('hidden');
	}
}


// 상품 상세 정보
function fetchProductInfo(saleId) {
    fetch(`/product/getProductInfo?sale_id=${saleId}`)
        .then(response => {
            return response.json();
        })
        .then(data => {
            updateChatHeader(data);
			if (data.product.sale_status === '판매완료') {
			    document.getElementById('deal-done').classList.add('disabled');
			} else {
			    document.getElementById('deal-done').classList.remove('disabled');
			}
        })
        .catch(error => {
            console.error('Error fetching product info:', error);
        });
}

function updateChatHeader(data) {
    const product = data.product;
    const productImage = data.productImage;

    document.getElementById('product-name').innerText = `${product.sale_name}`;
    document.getElementById('transaction-status').innerText = `${product.sale_status}`;
    if (productImage) {
        document.getElementById('product-image').src = `/productImage/${productImage.productimg_alias}`;
    } else {
        document.getElementById('product-image').src = '/path/to/default-image.jpg';
    } 
}

// 메시지 표시 함수
function displayMessage(senderId, content, timestamp) {

	// timestamp가 유효한지 확인
	const date = new Date(timestamp);
	if (isNaN(date.getTime())) {
	    return;
	}
    const messageDate = new Date(timestamp).toISOString().split('T')[0]; // 메시지의 날짜 (YYYY-MM-DD)

    // 날짜 요소가 이미 존재하는지 확인
    if (!document.querySelector(`.message-date[data-date='${messageDate}']`)) {
        // 날짜가 변경되었음을 나타내는 요소 추가
        const dateElement = document.createElement('div');
        dateElement.classList.add('message-date');
        dateElement.textContent = messageDate;
        dateElement.setAttribute('data-date', messageDate);
        chatArea.appendChild(dateElement);
    }

    const messageContainer = document.createElement('div');
    messageContainer.classList.add('message');
    if (senderId === userId) {
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
    if (senderId === userId) {
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
	
    const date = new Date(timestamp);
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const ampm = hours >= 12 ? '오후' : '오전';
    const formattedHours = hours % 12 || 12;
    const formattedMinutes = minutes < 10 ? `0${minutes}` : minutes;
	
    return `${ampm} ${formattedHours}:${formattedMinutes}`;
}

// Update fetchAndDisplayUserChat to include timestamp
async function fetchAndDisplayUserChat() {
	console.log(selectedSaleId, userId, selectedUserId);
	if (!selectedSaleId || !userId || !selectedUserId) {
	    return;
	}

	try {
	    const userChatResponse = await fetch(`/messages?saleId=${selectedSaleId}&userId1=${userId}&userId2=${selectedUserId}`);
	    const userChat = await userChatResponse.json();

	    if (!Array.isArray(userChat)) {
	        console.error('Unexpected response format:', userChat);
	        return;
	    }

	    chatArea.innerHTML = '';
	    userChat.forEach(chat => {
	        displayMessage(chat.senderId, chat.content, chat.timestamp);
	    });
	    setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
	    scrollToBottom();
	    chatArea.scrollTop = chatArea.scrollHeight;
	} catch (error) {
	    console.error('Failed to fetch and display user chat:', error);
	    chatArea.innerHTML = 'Failed to load messages.';
	}
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
            senderId: userId,
            recipientId: selectedUserId,
            content: messageInput.value.trim(),
            timestamp: new Date().toISOString(),
			saleId: selectedSaleId // sale_id 추가
        };
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        displayMessage(userId, messageInput.value.trim(), chatMessage.timestamp);
        messageInput.value = '';
    }
	setTimeout(scrollToBottom, 60); // 약간의 지연을 추가하여 메시지가 모두 추가된 후 스크롤 설정
    chatArea.scrollTop = chatArea.scrollHeight;
    event.preventDefault();
}

// Update onMessageReceived to include timestamp
async function onMessageReceived(payload) {
	
	const message = JSON.parse(payload.body);
	
	// 현재 선택된 채팅방의 메시지를 다시 표시합니다.
	if (selectedUserId && selectedUserId !== message.senderId) {
	    updateUnreadMessagesUI(message.senderId);
	}
	
	if (selectedUserId) {
	    const selectedUserElement = document.getElementById(selectedUserId);
	    if (selectedUserElement) {
	        selectedUserElement.classList.add('active');
	        await fetchAndDisplayUserChat();
			await findAndDisplayChatRooms();
	    }
	}
	// 채팅방 목록을 다시 가져오고 선택된 채팅방을 유지합니다.

	



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
	    const unreadCount = parseInt(nbrMsg.textContent) || 0;
	    nbrMsg.textContent = unreadCount + 1;
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
            senderId: userId,
            recipientId: selectedUserId,
            content: result.url,
            timestamp: new Date().toISOString(),
			saleId: selectedSaleId // sale_id 추가
        };
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        displayMessage(userId, chatMessage.content, chatMessage.timestamp);
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


function onLogout() {
    stompClient.send("/app/user.disconnectUser",
        {},
        JSON.stringify({userId: userId, status: 'OFFLINE'})
    );
    window.location.reload();
}

// 채팅방 나가기
// document.getElementById('chat-done').addEventListener('click', leaveChatRoom);

async function leaveChatRoom() {
    if (selectedSaleId && selectedUserId) {
        try {
            const responseRoom = await fetch(`/chat/leaveChatRoom?saleId=${selectedSaleId}&userId1=${userId}&userId2=${selectedUserId}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

            const responseMessage = await fetch(`/chat/leaveChatMessage?saleId=${selectedSaleId}&userId1=${userId}&userId2=${selectedUserId}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

            if (responseRoom.ok && responseMessage.ok) {
                alert('채팅방이 삭제되었습니다.');
                // 채팅방 목록을 새로고침
                await findAndDisplayChatRooms();
				fetchAndDisplayUserChat();
                // 채팅 영역과 입력 폼을 숨김
                messageForm.classList.add('hidden');
                chatArea.classList.add('hidden');
				console.log(chatHeader);
				chatHeader.classList.add('hidden'); // chatHeader 숨김 추가
				console.log('Added hidden class to chatHeader:', chatHeader.classList);


            } else {
                alert('채팅방 삭제에 실패했습니다.');
                console.error('Failed to delete chat room or messages');
            }
        } catch (error) {
            console.error('Error deleting chat room or messages:', error);
            alert('채팅방 삭제 중 오류가 발생했습니다.');
        }
    } else {
        alert('선택된 채팅방이 없습니다.');
    }
}

// document.getElementById('deal-done').addEventListener('click', updateSaleStatus);

async function updateSaleStatus() {
    if (selectedSaleId) {
		const buyerId = selectedUserId;
		
		try {
		    const response = await fetch(`/product/updateStatus`, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: `sale_id=${selectedSaleId}&sale_status=판매완료&member_id=${buyerId}`
		    });

            const result = await response.text();

            if (result === '1') {
                alert('판매완료');
                document.getElementById('transaction-status').innerText = '거래 상태: 판매완료';
				document.getElementById('deal-done').classList.add('disabled');
            } else if (result === 'already_completed') {
                alert('이미 판매 완료된 상품입니다.');
            } else {
                alert('거래 상태 변경에 실패했습니다.');
            }
        } catch (error) {
            console.error('Error updating sale status:', error);
            alert('거래 상태 변경 중 오류가 발생했습니다.');
        }
    } else {
        alert('선택된 상품이 없습니다.');
    }
}

/*document.getElementById('report').addEventListener('click', () => {
    openReportPopup(selectedUserId);
});*/

/*function openReportPopup(selectedUserId) {
    var url = "/product/sale_report?selectedUserId=" + selectedUserId;
    var options = "width=600,height=400";
    window.open(url, "ReportPopup", options);
}*/

function openReportPopup(selectedUserId, userType = 'seller') {
    let url = `/product/sale_report?selectedUserId=${selectedUserId}&userType=${userType}&sale_id=${selectedSaleId}`;
    const options = "width=600,height=400";
    window.open(url, "ReportPopup", options);
}


// messageForm.addEventListener('submit', sendMessage, true);
window.onbeforeunload = () => onLogout();

