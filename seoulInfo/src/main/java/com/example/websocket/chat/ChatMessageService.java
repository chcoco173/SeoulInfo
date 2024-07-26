package com.example.websocket.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.websocket.chatroom.ChatRoomService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatMessageService {
    private final ChatMessageRepository repository;
    private final ChatRoomService chatRoomService;

    public ChatMessage save(ChatMessage chatMessage) {
        Integer sale_id = chatMessage.getSale_id();  // saleId 가져오기

        var chatId = chatRoomService
                .getChatRoomId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true, sale_id)  // saleId 전달
                .orElseThrow(); // You can create your own dedicated exception
        chatMessage.setChatId(chatId);
        repository.save(chatMessage);
        return chatMessage;
    }

    public List<ChatMessage> findChatMessages(String senderId, String recipientId, Integer sale_id) {  // saleId 추가
        var chatId = chatRoomService.getChatRoomId(senderId, recipientId, false, sale_id);  // saleId 전달
        return chatId.map(repository::findByChatId).orElse(new ArrayList<>());
    }
}
