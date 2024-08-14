package com.example.websocket.chat;

import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class UnreadMessageService {

    private final UnreadMessageRepository unreadMessageRepository;

    public UnreadMessageService(UnreadMessageRepository unreadMessageRepository) {
        this.unreadMessageRepository = unreadMessageRepository;
    }

    public void resetUnreadCount(String userId, String senderId, Integer saleId) {
        Optional<UnreadMessage> unreadMessageOptional = unreadMessageRepository.findByUserIdAndSenderIdAndSaleId(userId, senderId, saleId);
        if (unreadMessageOptional.isPresent()) {
            UnreadMessage unreadMessage = unreadMessageOptional.get();
            unreadMessage.setUnreadCount(0);
            unreadMessageRepository.save(unreadMessage);
        } else {
            System.err.println("UnreadMessage not found for userId: " + userId + ", senderId: " + senderId + ", saleId: " + saleId);
            throw new RuntimeException("UnreadMessage not found");
        }
    }
    public void incrementUnreadCount(String userId, String senderId, Integer saleId) {
        UnreadMessage unreadMessage = unreadMessageRepository.findByUserIdAndSenderIdAndSaleId(userId, senderId, saleId)
                .orElseGet(() -> UnreadMessage.builder()
                        .userId(userId)
                        .senderId(senderId)
                        .saleId(saleId)
                        .unreadCount(0)
                        .build());
        unreadMessage.setUnreadCount(unreadMessage.getUnreadCount() + 1);
        unreadMessageRepository.save(unreadMessage);
    }
    
    public Optional<UnreadMessage> getUnreadCount(String userId, String senderId, Integer saleId) {
        return unreadMessageRepository.findByUserIdAndSenderIdAndSaleId(userId, senderId, saleId);
    }
}
