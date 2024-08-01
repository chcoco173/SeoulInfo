package com.example.websocket.chatroom;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface ChatRoomRepository extends MongoRepository<ChatRoom, String> {
    Optional<ChatRoom> findBySenderIdAndRecipientIdAndSaleId(String senderId, String recipientId, Integer saleId);
    List<ChatRoom> findBySenderIdOrRecipientId(String senderId, String recipientId);
    @Modifying
    @Query(value = "{ 'saleId': ?0, '$or': [ { 'senderId': ?1, 'recipientId': ?2 }, { 'senderId': ?2, 'recipientId': ?1 } ] }", delete = true)
    long deleteBySaleIdAndUserIds(Integer saleId, String userId1, String userId2);

}
