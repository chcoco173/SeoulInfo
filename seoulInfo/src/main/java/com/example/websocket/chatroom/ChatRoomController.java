package com.example.websocket.chatroom;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.MemberVO;
import com.example.websocket.user.User;
import com.example.websocket.user.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatRoomController {

	private final ChatRoomService chatRoomService;
	private final UserService userService;
	private final HttpSession session;

	// member_id 판매자 (recipientId)
	@GetMapping("/product/chatCreate")
	public String createChatRoom(@RequestParam("member_id") String memberId, @RequestParam("sale_id") Integer sale_id, Model model) {

		// Debugging logs
		System.out.println("member_id: " + memberId);
		System.out.println("sale_id: " + sale_id);

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		String senderId = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
		String recipientId = memberId;

		// 새로운 채팅방 ID를 생성하거나 가져옴
		String chatRoomId = chatRoomService.getChatRoomId(senderId, recipientId, true, sale_id)
				.orElseThrow(() -> new RuntimeException("채팅방 생성 실패"));

		model.addAttribute("chatRoomId", chatRoomId);
		return "product/chat"; // product/chat.jsp로 이동

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

	}

	@GetMapping("/product/chat")
	public String getChatPage(@RequestParam String chatRoomId, Model model) {

		model.addAttribute("chatRoomId", chatRoomId);
		return "product/chat"; // product/chat.jsp로 이동
	}

    @GetMapping("/chat/list")
    public ResponseEntity<List<User>> getChatRooms() {
        MemberVO mvo = (MemberVO) session.getAttribute("member");
        String userId = mvo.getMember_id();
        List<ChatRoom> chatRooms = chatRoomService.findAllChatRooms(userId);

        // 현재 사용자가 참여하고 있는 채팅방의 다른 사용자 목록을 가져옴
        List<String> otherUserIds = chatRooms.stream()
                .map(chatRoom -> chatRoom.getRecipientId().equals(userId) ? chatRoom.getSenderId() : chatRoom.getRecipientId())
                .collect(Collectors.toList());

        List<User> connectedUsers = otherUserIds.stream()
                .map(userService::findByUserId)
                .collect(Collectors.toList());

        System.out.println("Connected Users: " + connectedUsers); // 로그 추가
        
        return ResponseEntity.ok(connectedUsers);
    }
}
