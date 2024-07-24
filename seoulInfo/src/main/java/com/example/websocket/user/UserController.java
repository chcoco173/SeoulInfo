package com.example.websocket.user;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final HttpSession session;
    
	/*
	 * @MessageMapping("/user.addUser")
	 * 
	 * @SendTo("/user/public") public User addUser(
	 * 
	 * @Payload User user ) { userService.saveUser(user); return user; }
	 */
    
    @MessageMapping("/user.addUser")
    @SendTo("/user/public")
    public User addUser(@Payload User user) {
        // Get the logged-in user_id from the session
        String userId = (String) session.getAttribute("member_id");

        // Set the user_id in the User object
        user.setUser_id(userId);
        
        userService.saveUser(user);
        return user;
    }

	/*
	 * @MessageMapping("/user.disconnectUser")
	 * 
	 * @SendTo("/user/public") public User disconnectUser(
	 * 
	 * @Payload User user ) { userService.disconnect(user); return user; }
	 */
    
    @MessageMapping("/user.disconnectUser")
    @SendTo("/user/public")
    public User disconnectUser(@Payload User user) {
        // Get the logged-in user_id from the session
        String userId = (String) session.getAttribute("member_id");
        
        if (userId != null && userId.equals(user.getUser_id())) {
            userService.disconnect(user);
        }
        return user;
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>> findAllUsers() {
        return ResponseEntity.ok(userService.findAllUsers());
    }
}
