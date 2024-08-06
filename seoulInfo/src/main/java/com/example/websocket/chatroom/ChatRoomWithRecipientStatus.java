package com.example.websocket.chatroom;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChatRoomWithRecipientStatus {
    private ChatRoom chatRoom;
    private String recipientStatus;
}