package com.example.websocket.chatroom;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.MemberVO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatRoomController {

	private final ChatRoomService chatRoomService;
	private final HttpSession session;

	// 채팅방 생성. member_id 판매자 (recipientId)
	@GetMapping("/product/chatCreate")
	public String createChatRoom(@RequestParam("member_id") String memberId, @RequestParam("sale_id") Integer saleId, Model model) {

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		String senderId = mvo.getMember_id(); // 현재 로그인한 사용자의 ID
		String recipientId = memberId;

		// 새로운 채팅방 ID를 생성하거나 가져옴
		String chatRoomId = chatRoomService.getChatRoomId(senderId, recipientId, true, saleId)
				.orElseThrow(() -> new RuntimeException("채팅방 생성 실패"));

		model.addAttribute("chatRoomId", chatRoomId);
		return "redirect:/product/chat"; // chat.jsp로 리디렉션

	}
	
	@GetMapping("/product/chat")
	public String getChatPage() {
		return "product/chat"; // product/chat.jsp로 이동
	}

    // 로그인 된 회원 id 가 들어있는 채팅방 찾아오기
    @GetMapping("/findChatRooms")
    public ResponseEntity<List<ChatRoom>> getChatRooms() {
        MemberVO mvo = (MemberVO) session.getAttribute("member");
        String userId = mvo.getMember_id();
        List<ChatRoom> chatRooms = chatRoomService.findChatRooms(userId);
                       
        return ResponseEntity.ok(chatRooms);
    }
    
    // 채팅방 삭제
    @PostMapping("/chat/leaveChatRoom")
    public ResponseEntity<Void> leaveChatRoom(@RequestParam Integer saleId, @RequestParam String userId1, @RequestParam String userId2) {
        try {
            chatRoomService.deleteChatRoomByDetails(saleId, userId1, userId2);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
    }

}
