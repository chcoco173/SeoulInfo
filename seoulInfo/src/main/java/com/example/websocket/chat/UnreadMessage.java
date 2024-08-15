package com.example.websocket.chat;

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
@Document(collection = "unread_messages")
public class UnreadMessage {
    @Id
    private String id;
    private String userId;
    private String senderId;
    private Integer saleId;
    private int unreadCount;
}