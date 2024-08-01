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
	public String createChatRoom(@RequestParam("member_id") String member_id, @RequestParam("sale_id") Integer sale_id, Model model) {

		// Debugging logs
		System.out.println("member_id: " + member_id);
		System.out.println("sale_id: " + sale_id);

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		String senderId = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
		String recipientId = member_id;

		// 새로운 채팅방 ID를 생성하거나 가져옴
		String chatRoomId = chatRoomService.getChatRoomId(senderId, recipientId, true, sale_id)
				.orElseThrow(() -> new RuntimeException("채팅방 생성 실패"));

		model.addAttribute("chatRoomId", chatRoomId);
		return "product/chat"; // product/chat.jsp로 이동

<<<<<<< Updated upstream
		// session member 값은 VO 에서 리스트로 오기 때문에 id 만 추출해야한다.
		/*
		 * MemberVO mvo = (MemberVO) session.getAttribute("member"); String senderId =
		 * mvo.getMember_id();
		 * 
		 * String recipientId = member_id;
		 * 
		 * 
		 * if (senderId == null) { // 세션에 로그인 정보가 없는 경우 로그인 페이지로 리다이렉트 하거나 에러 처리 return
		 * "redirect:/login"; }
		 * 
		 * 
		 * Optional<String> chatRoomId = chatRoomService.getChatRoomId(senderId,
		 * recipientId, sale_id, true);
		 * 
		 * model.addAttribute("chatRoomId", chatRoomId.orElse(""));
		 * model.addAttribute("senderId", senderId); model.addAttribute("recipientId",
		 * recipientId); model.addAttribute("sale_id", sale_id);
		 */

=======
>>>>>>> Stashed changes
	}
	
//    @GetMapping("/users")
//    public ResponseEntity<List<User>> findOtherUsers() {
//		MemberVO mvo = (MemberVO) session.getAttribute("member");
//		String user = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
//        return ResponseEntity.ok(userService.fi ndOtherUsers(user));
//    }
//
	@GetMapping("/product/chat")
	public String getChatPage(@RequestParam String chatRoomId, Model model) {

		model.addAttribute("chatRoomId", chatRoomId);
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
    
    @GetMapping("/users")
    public ResponseEntity<List<ChatUserDTO>> getChatRooms() {
        MemberVO mvo = (MemberVO) session.getAttribute("member");
        String userId = mvo.getMember_id();
        List<User> otherUsers = userService.findOtherUsers(userId);
        
        List<ChatUserDTO> userDTOs = otherUsers.stream()
                .map(user -> new ChatUserDTO(user.getMember_id(), user.getStatus(), getSaleId(userId, user.getMember_id())))
                .collect(Collectors.toList());

        return ResponseEntity.ok(userDTOs);
    }
    
<<<<<<< Updated upstream
    private Integer getSaleId(String senderId, String recipientId) {
        // 해당 사용자의 채팅방에서 sale_id를 찾아 반환하는 로직을 구현
        List<ChatRoom> chatRooms = chatRoomService.findAllChatRooms(senderId);
        return chatRooms.stream()
                .filter(room -> room.getSenderId().equals(recipientId) || room.getRecipientId().equals(recipientId))
                .findFirst()
                .map(ChatRoom::getSale_id)
                .orElse(null);
=======
    @PostMapping("/chat/leaveChatRoom")
    public ResponseEntity<Void> leaveChatRoom(@RequestParam Integer saleId, @RequestParam String userId1, @RequestParam String userId2) {
        System.out.println("ChatRoomController: 채팅방 삭제 " + saleId + " " + userId1 + " " + userId2);

        try {
            chatRoomService.deleteChatRoomByDetails(saleId, userId1, userId2);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
>>>>>>> Stashed changes
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
