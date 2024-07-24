package com.example.websocket.chatroom;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Document
public class ChatRoom {
    @Id
    private String id;			// 채팅방 id
    private String chatId;		// sender id _ recipient id
    private String senderId;	// 연결 요청 사용자
    private String recipientId;	// 요청 받는 판매자
    private String sale_id;		// 판매 상품 id
}
