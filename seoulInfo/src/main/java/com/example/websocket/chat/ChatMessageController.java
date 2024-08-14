package com.example.websocket.chat;

import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatMessageController {

    private final SimpMessagingTemplate messagingTemplate;
    private final ChatMessageService chatMessageService;
    private final UnreadMessageService unreadMessageService;


    // 메세지 저장하기
    @MessageMapping("/chat")
    public void processMessage(@Payload ChatMessage chatMessage) {
        ChatMessage savedMsg = chatMessageService.save(chatMessage);
        messagingTemplate.convertAndSendToUser(
                chatMessage.getRecipientId(), "/queue/messages",
                new ChatNotification(
                        savedMsg.getId(),
                        savedMsg.getSenderId(),
                        savedMsg.getRecipientId(),
                        savedMsg.getContent()
                )
        );

        // UnreadMessage 증가 처리
        unreadMessageService.incrementUnreadCount(
                chatMessage.getRecipientId(),
                chatMessage.getSenderId(),
                chatMessage.getSaleId()
        );
    }
    
    // 채팅방에 들어갔을 때 해당 상품번호, 전송자, 수신자 id 로 메세지 찾아오기
    @GetMapping("/messages")
    public ResponseEntity<List<ChatMessage>> findChatMessages(
            @RequestParam Integer saleId, 
            @RequestParam String userId1, 
            @RequestParam String userId2) {
        return ResponseEntity.ok(chatMessageService.findChatMessages(saleId, userId1, userId2));
    }
    
    // 채팅방이 삭제 될 때 그 채팅방의 모든 메세지들을 삭제
    @PostMapping("/chat/leaveChatMessage")
    public ResponseEntity<Void> leaveChatMessage(@RequestParam Integer saleId, @RequestParam String userId1, @RequestParam String userId2) {
        try {
            chatMessageService.deleteMessagesByDetails(saleId, userId1, userId2);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
    }
    
    // 채팅방 클릭 시 읽지 않은 메시지 수 초기화
    @PostMapping("/resetUnreadCount")
    public ResponseEntity<Void> resetUnreadCount(@RequestParam String userId,
                                                 @RequestParam String senderId,
                                                 @RequestParam Integer saleId) {
        try {
            unreadMessageService.resetUnreadCount(userId, senderId, saleId);
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            return ResponseEntity.status(500).build();
        }
    }
    
    @GetMapping("/unreadCount")
    public ResponseEntity<Integer> getUnreadCount(@RequestParam String userId,
                                                  @RequestParam String senderId,
                                                  @RequestParam Integer saleId) {
        Optional<UnreadMessage> unreadMessage = unreadMessageService.getUnreadCount(userId, senderId, saleId);
        return unreadMessage.map(message -> ResponseEntity.ok(message.getUnreadCount()))
                            .orElseGet(() -> ResponseEntity.ok(0));
    }
}
