package com.example.websocket.chatroom;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {

    private final ChatRoomRepository chatRoomRepository;

    // 채팅방 id 가져오기. 없으면 새로운 chatId 생성하기
    public Optional<String> getChatRoomId(
            String senderId,
            String recipientId,
            boolean createNewRoomIfNotExists,
            Integer saleId
    ) {
        return chatRoomRepository
                .findBySenderIdAndRecipientIdAndSaleId(senderId, recipientId, saleId)
                .map(ChatRoom::getChatId)
                .or(() -> {
                    if(createNewRoomIfNotExists) {
                        var chatId = createChatId(senderId, recipientId, saleId);
                        return Optional.of(chatId);
                    }

                    return  Optional.empty();
                });
    }

    // chatId 생성 (채팅방 생성)
    private String createChatId(String senderId, String recipientId, Integer saleId) {
        var chatId = String.format("%s_%s_%d", senderId, recipientId, saleId);

        // Check if a chat room already exists in either direction
        if (chatRoomRepository.findBySenderIdAndRecipientIdAndSaleId(senderId, recipientId, saleId).isPresent() ||
            chatRoomRepository.findBySenderIdAndRecipientIdAndSaleId(recipientId, senderId, saleId).isPresent()) {
            return chatId; // Return existing chatId
        }

        ChatRoom chatRoom = ChatRoom.builder()
                .chatId(chatId)
                .senderId(senderId)
                .recipientId(recipientId)
                .saleId(saleId)
                .build();

        chatRoomRepository.save(chatRoom);

        return chatId;
    }

    // 
	public List<ChatRoom> findChatRooms(String userId) {
    	// ChatRoomRepository의 findBySenderIdOrRecipientId 메서드를 사용하여 주어진 userId가 senderId나 recipientId로 있는 모든 채팅방을 가져옵니다.
        List<ChatRoom> chatRooms = chatRoomRepository.findBySenderIdOrRecipientId(userId, userId);
        return chatRooms;
	}
	
	// 채팅방 삭제
    public void deleteChatRoomByDetails(Integer saleId, String userId1, String userId2) {
        try {
            chatRoomRepository.deleteBySaleIdAndUserIds(saleId, userId1, userId2);
            System.out.println("ChatRoomService: 채팅방 삭제 성공");
        } catch (Exception e) {
            System.err.println("ChatRoomService: 채팅방 삭제 실패");
            e.printStackTrace();
        }
    }
    
}
