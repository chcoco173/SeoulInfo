package com.example.websocket.chatroom;

import com.example.websocket.user.Status;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChatUserDTO {
    private String memberId;
    private Status status;
    private Integer sale_id;
}