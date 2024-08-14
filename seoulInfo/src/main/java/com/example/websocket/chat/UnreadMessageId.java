package com.example.websocket.chat;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UnreadMessageId implements Serializable {
    private String userId;
    private String senderId;
    private String saleId;
}
