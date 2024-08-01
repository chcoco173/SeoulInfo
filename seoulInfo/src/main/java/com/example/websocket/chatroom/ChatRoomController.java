package com.example.websocket.chatroom;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.MemberVO;
//import com.example.websocket.user.User;
//import com.example.websocket.user.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatRoomController {

	private final ChatRoomService chatRoomService;
//	private final UserService userService;
	private final HttpSession session;

	// member_id 판매자 (recipientId)
	@GetMapping("/product/chatCreate")
	public String createChatRoom(@RequestParam("member_id") String memberId, @RequestParam("sale_id") Integer saleId, Model model) {

		// Debugging logs
		System.out.println("createChatRoom@@@@@@@@member_id: " + memberId);
		System.out.println("createChatRoom@@@@@@@@sale_id: " + saleId);

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		String senderId = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
		String recipientId = memberId;

		System.out.println("createChatRoom@@@@@@@@senderId: " + senderId);
		System.out.println("createChatRoom@@@@@@@@recipientId: " + recipientId);
		
		// 새로운 채팅방 ID를 생성하거나 가져옴
		String chatRoomId = chatRoomService.getChatRoomId(senderId, recipientId, true, saleId)
				.orElseThrow(() -> new RuntimeException("채팅방 생성 실패"));

		model.addAttribute("chatRoomId", chatRoomId);
		return "product/chat"; // product/chat.jsp로 이동

	}
	
//    @GetMapping("/users")
//    public ResponseEntity<List<User>> findOtherUsers() {
//		MemberVO mvo = (MemberVO) session.getAttribute("member");
//		String user = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
//        return ResponseEntity.ok(userService.fi ndOtherUsers(user));
//    }
//
	@GetMapping("/product/chat")
	public String getChatPage() {
		return "product/chat"; // product/chat.jsp로 이동
	}

//    @GetMapping("/users")
//    public ResponseEntity<List<User>> getChatRooms() {
//        MemberVO mvo = (MemberVO) session.getAttribute("member");
//        String userId = mvo.getMember_id();
//        List<User> otherUsers = userService.findOtherUsers(userId);
//        
//        System.out.println("Connected Users: " + otherUsers);
//        return ResponseEntity.ok(otherUsers);
//    }
    
    @GetMapping("/findChatRooms")
    public ResponseEntity<List<ChatRoom>> getChatRooms() {
        MemberVO mvo = (MemberVO) session.getAttribute("member");
        String userId = mvo.getMember_id();
        System.out.println("ChatRoomController 1"+userId);
        List<ChatRoom> chatRooms = chatRoomService.findChatRooms(userId);
        System.out.println("ChatRoomController 2"+chatRooms);
        return ResponseEntity.ok(chatRooms);
    }
    
    @PostMapping("/chat/leaveChatRoom")
    public ResponseEntity<Void> leaveChatRoom(@RequestParam Integer saleId, @RequestParam String userId1, @RequestParam String userId2) {
        System.out.println("ChatRoomController: 채팅방 삭제 " + saleId + " " + userId1 + " " + userId2);

        try {
            chatRoomService.deleteChatRoomByDetails(saleId, userId1, userId2);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
    }
//    private Integer getSaleId(String senderId, String recipientId) {
//        // 해당 사용자의 채팅방에서 sale_id를 찾아 반환하는 로직을 구현
//        List<ChatRoom> chatRooms = chatRoomService.findAllChatRooms(senderId);
//        return chatRooms.stream()
//                .filter(room -> room.getSenderId().equals(recipientId) || room.getRecipientId().equals(recipientId))
//                .findFirst()
//                .map(ChatRoom::getSaleId)
//                .orElse(null);
//    }
    

}
