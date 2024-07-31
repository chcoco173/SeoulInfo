package com.example.websocket.chatroom;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.example.websocket.user.User;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {

    private final ChatRoomRepository chatRoomRepository;
    
    // 사용자가 있는 채팅방을 다 찾기 (구매자든 판매자든)
    public List<ChatRoom> findAllChatRooms(String userId) {
        return chatRoomRepository.findBySenderIdOrRecipientId(userId, userId);
    }

    // 채팅방 id 가져오기
    public Optional<String> getChatRoomId(
            String senderId,
            String recipientId,
            boolean createNewRoomIfNotExists,
            Integer saleId
    ) {
    	System.out.println("chatroomservice%%%%%%%%%member_id: " + senderId+createNewRoomIfNotExists+recipientId+saleId);
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


//    private String createChatId(String senderId, String recipientId, Integer saleId) {
//    	var chatId = String.format("%s_%s_%d", senderId, recipientId, saleId);
//
//        ChatRoom senderRecipient = ChatRoom
//                .builder()
//                .chatId(chatId)
//                .senderId(senderId)
//                .recipientId(recipientId)
//                .saleId(saleId)
//                .build();
//
//        ChatRoom recipientSender = ChatRoom
//                .builder()
//                .chatId(chatId)
//                .senderId(recipientId)
//                .recipientId(senderId)
//                .saleId(saleId)
//                .build();
//
//        chatRoomRepository.save(senderRecipient);
//        chatRoomRepository.save(recipientSender);
//
//        return chatId;
//    }
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

	public List<ChatRoom> findChatRooms(String userId) {
    	// ChatRoomRepository의 findBySenderIdOrRecipientId 메서드를 사용하여 주어진 userId가 senderId나 recipientId로 있는 모든 채팅방을 가져옵니다.
        List<ChatRoom> chatRooms = chatRoomRepository.findBySenderIdOrRecipientId(userId, userId);
        return chatRooms;
	}

}
