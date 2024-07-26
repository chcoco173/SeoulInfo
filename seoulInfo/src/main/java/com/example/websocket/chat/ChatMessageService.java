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
        String chatId = chatMessage.getChatId();
        if (chatId == null || chatId.isEmpty()) {
            chatId = chatRoomService
                    .getChatRoomId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true, chatMessage.getSale_id())
                    .orElseThrow(); // 예외 처리 필요 시 여기에 추가
            chatMessage.setChatId(chatId);
        } else {
            Integer sale_id = extractSaleIdFromChatId(chatId);
            chatMessage.setSale_id(sale_id);
        }

        return repository.save(chatMessage);
    }

    public List<ChatMessage> findChatMessages(String senderId, String recipientId, Integer sale_id) {
        var chatId = chatRoomService.getChatRoomId(senderId, recipientId, false, sale_id);
        return chatId.map(repository::findByChatId).orElse(new ArrayList<>());
    }
    
    private Integer extractSaleIdFromChatId(String chatId) {
        if (chatId != null && !chatId.isEmpty()) {
            String[] parts = chatId.split("_");
            if (parts.length == 3) {
                try {
                    return Integer.parseInt(parts[2]);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Invalid sale_id in chatId: " + chatId);
                }
            }
        }
        throw new IllegalArgumentException("Invalid chatId: " + chatId);
    }

	/*
	 * public ChatMessage save(ChatMessage chatMessage) { Integer sale_id =
	 * chatMessage.getSale_id(); // saleId 가져오기
	 * 
	 * var chatId = chatRoomService .getChatRoomId(chatMessage.getSenderId(),
	 * chatMessage.getRecipientId(), true, sale_id) // saleId 전달 .orElseThrow(); //
	 * You can create your own dedicated exception chatMessage.setChatId(chatId);
	 * repository.save(chatMessage); return chatMessage; }
	 */
    
//    public ChatMessage save(ChatMessage chatMessage) {
//        String chatId = chatMessage.getChatId();
//        if (chatId == null || chatId.isEmpty()) {
//            Integer sale_id = extractSaleIdFromChatId(chatId);
//            chatId = chatRoomService
//                    .getChatRoomId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true, sale_id)
//                    .orElseThrow(); // 예외 처리 필요 시 여기에 추가
//        } else {
//            Integer sale_id = extractSaleIdFromChatId(chatId);
//            chatMessage.setSale_id(sale_id);
//        }
//
//        chatMessage.setChatId(chatId);
//        return repository.save(chatMessage);
//    }
//
//    public List<ChatMessage> findChatMessages(String senderId, String recipientId, Integer sale_id) {  // saleId 추가
//        var chatId = chatRoomService.getChatRoomId(senderId, recipientId, false, sale_id);  // saleId 전달
//        return chatId.map(repository::findByChatId).orElse(new ArrayList<>());
//    }
//    
//    private Integer extractSaleIdFromChatId(String chatId) {
//        if (chatId != null && !chatId.isEmpty()) {
//            String[] parts = chatId.split("_");
//            if (parts.length == 3) {
//                try {
//                    return Integer.parseInt(parts[2]);
//                } catch (NumberFormatException e) {
//                    throw new IllegalArgumentException("Invalid sale_id in chatId: " + chatId);
//                }
//            }
//        }
//        throw new IllegalArgumentException("Invalid chatId: " + chatId);
//    }
}
