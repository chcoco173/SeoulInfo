package com.example.websocket.user;


import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.example.websocket.chatroom.ChatRoom;
import com.example.websocket.chatroom.ChatRoomRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;
//    private final ChatRoomRepository chatRoomRepository;

	/*
	 * public List<User> findAllUsers() { return repository.findAll(); }
	 */
    
    public User findByUserId(String userId) {
        System.out.println("Finding User by ID: " + userId); // 로그 추가
        return repository.findById(userId).orElse(null);
    }
    
    
    public void saveUser(User user) {
        user.setStatus(Status.ONLINE);
        repository.save(user);
    }

	/*
	 * public List<User> findOtherUsers(String userId) { // ChatRoomRepository의
	 * findBySenderIdOrRecipientId 메서드를 사용하여 주어진 userId가 senderId나 recipientId로 있는
	 * 모든 채팅방을 가져옵니다. List<ChatRoom> chatRooms =
	 * chatRoomRepository.findBySenderIdOrRecipientId(userId, userId); // 주어진
	 * userId가 참여하고 있는 모든 채팅방 목록을 얻기 위함입니다. List<String> otherUserIds =
	 * chatRooms.stream() .map(chatRoom -> chatRoom.getRecipientId().equals(userId)
	 * ? chatRoom.getSenderId() : chatRoom.getRecipientId())
	 * .collect(Collectors.toList());
	 * 
	 * return repository.findAllById(otherUserIds); }
	 */
    
    public void disconnect(User user) {
        var storedUser = repository.findById(user.getUserId()).orElse(null);
        if (storedUser != null) {
            storedUser.setStatus(Status.OFFLINE);
            repository.save(storedUser);
        }
    }
    
    public List<User> findConnectedUsers() {
        return repository.findAllByStatus(Status.ONLINE);
    }
}
