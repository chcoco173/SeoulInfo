package com.example.websocket.user;

import java.util.List;

import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository repository;

//    public List<User> findAllUsers() {
//        return repository.findAll();
//    }
    
    public Status getStatusByUserId(String userId) {
        System.out.println("유저 상태 가져오기 userservice: " + userId);
        return repository.getStatusByUserId(userId);
    }
    
    
    public void saveUser(User user) {
        user.setStatus(Status.ONLINE);
        repository.save(user);
    }
    
    public void disconnect(User user) {
        var storedUser = repository.findById(user.getUserId()).orElse(null);
        if (storedUser != null) {
            storedUser.setStatus(Status.OFFLINE);
            repository.save(storedUser);
        }
    }
    
//    public List<User> findConnectedUsers() {
//        return repository.findAllByStatus(Status.ONLINE);
//    }
}
