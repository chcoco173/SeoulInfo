package com.example.websocket.user;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SynchronizationService {

    private final MySQLUserRepository mySQLUserRepository;
    private final UserRepository userRepository;

    @PostConstruct
    public void synchronizeMemberIds() {
        List<String> member_ids = mySQLUserRepository.findAllMemberIds();

        for (String member_id : member_ids) {
            if (!userRepository.existsById(member_id)) {
                User user = new User();
                user.setUserId(member_id);
                user.setStatus(Status.OFFLINE); // or whatever the initial status should be
                userRepository.save(user);
            }
        }
    }
}