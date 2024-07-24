package com.example.websocket.chat;

import lombok.AllArgsConstructor;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Document
public class ChatMessage {
    @Id
    private String id;			// 메세지 id
    private String chatId;		// sender id _ recipient id
    private String senderId;	// 전송자
    private String recipientId;	// 수신자
    private String content;		// 메세지 내용
    private Date timestamp;		// 전송 시간
}
