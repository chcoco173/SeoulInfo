package com.example.websocket.user;

import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    
    // 유저가 채팅 페이지에 들어오면 온라인 상태로 추가
    @MessageMapping("/user.addUser")
    @SendTo("/user/public")
    public User addUser(
            @Payload User user
    ) {
        userService.saveUser(user);
        return user;
    }

    // 유저가 채팅 페이지 나가면 오프라인 상태로 변경
    @MessageMapping("/user.disconnectUser")
    @SendTo("/user/public")
    public User disconnectUser(
            @Payload User user
    ) {
        userService.disconnect(user);
        return user;
    }

    // 유저 온라인 상태 가져오기
    @GetMapping("/users")
    public ResponseEntity<Status> findUserStatus(@RequestParam String userId) {
        Status status = userService.getStatusByUserId(userId);
        return ResponseEntity.ok(status);
    }
  
}
