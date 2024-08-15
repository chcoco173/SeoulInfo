package com.example.websocket.chat;

import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface UnreadMessageRepository extends MongoRepository<UnreadMessage, String> {
    Optional<UnreadMessage> findByUserIdAndSenderIdAndSaleId(String userId, String senderId, Integer saleId);
}