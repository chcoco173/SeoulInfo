package com.example.websocket.chat;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface ChatMessageRepository extends MongoRepository<ChatMessage, String> {
//    List<ChatMessage> findByChatId(String chatId);
    @Query("{ 'saleId': ?0, '$or': [ { 'senderId': ?1, 'recipientId': ?2 }, { 'senderId': ?2, 'recipientId': ?1 } ] }")
    List<ChatMessage> findBySaleIdAndUserIds(Integer saleId, String userId1, String userId2);

    @Modifying
    @Query(value = "{ 'saleId': ?0, '$or': [ { 'senderId': ?1, 'recipientId': ?2 }, { 'senderId': ?2, 'recipientId': ?1 } ] }", delete = true)
    long deleteBySaleIdAndUserIds(Integer saleId, String userId1, String userId2);
}
