package com.example.websocket.chatroom;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

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
            Integer sale_id
    ) {
        return chatRoomRepository
                .findBySenderIdAndRecipientId(senderId, recipientId, sale_id)
                .map(ChatRoom::getChatId)
                .or(() -> {
                    if(createNewRoomIfNotExists) {
                        var chatId = createChatId(senderId, recipientId, sale_id);
                        return Optional.of(chatId);
                    }

                    return  Optional.empty();
                });
    }


    private String createChatId(String senderId, String recipientId, Integer sale_id) {
    	var chatId = String.format("%s_%s_%d", senderId, recipientId, sale_id);

        ChatRoom senderRecipient = ChatRoom
                .builder()
                .chatId(chatId)
                .senderId(senderId)
                .recipientId(recipientId)
                .sale_id(sale_id)
                .build();

        ChatRoom recipientSender = ChatRoom
                .builder()
                .chatId(chatId)
                .senderId(recipientId)
                .recipientId(senderId)
                .sale_id(sale_id)
                .build();

        chatRoomRepository.save(senderRecipient);
        chatRoomRepository.save(recipientSender);

        return chatId;
    }
}
