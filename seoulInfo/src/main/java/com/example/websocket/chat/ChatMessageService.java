package com.example.websocket.chat;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.websocket.chatroom.ChatRoomService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatMessageService {
    private final ChatMessageRepository repository;
    private final ChatRoomService chatRoomService;
    
    // 메세지 저장
    public ChatMessage save(ChatMessage chatMessage) {
        String chatId = chatMessage.getChatId();
        if (chatId == null || chatId.isEmpty()) {
            chatId = chatRoomService
                    .getChatRoomId(chatMessage.getSenderId(), chatMessage.getRecipientId(), true, chatMessage.getSaleId())
                    .orElseThrow(); // 예외 처리 필요 시 여기에 추가
            chatMessage.setChatId(chatId);
        } else {
            Integer saleId = extractSaleIdFromChatId(chatId);
            chatMessage.setSaleId(saleId);
        }

        try {
            ChatMessage savedMessage = repository.save(chatMessage);
            return savedMessage;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error saving message: " + e.getMessage());
            throw e;
        }
    }

    // 채팅방에 들어갔을 때 메세지 목록 찾아오기
    public List<ChatMessage> findChatMessages(Integer saleId, String userId1, String userId2) {
        return repository.findBySaleIdAndUserIds(saleId, userId1, userId2);
    }
    
    // 해당 채팅방에서 상품 번호 추출하기
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
    
    // 채팅방이 삭제 될 때 해당 메세지들도 삭제
    public void deleteMessagesByDetails(Integer saleId, String userId1, String userId2) {
        try {
            repository.deleteBySaleIdAndUserIds(saleId, userId1, userId2);
            System.out.println("ChatMessageService: 메시지 삭제 성공");
        } catch (Exception e) {
            System.err.println("ChatMessageService: 메시지 삭제 실패");
            e.printStackTrace();
        }
    }

}
