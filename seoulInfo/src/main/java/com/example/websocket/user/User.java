package com.example.websocket.user;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document
public class User {
    @Id
    private String user_id;			// 로그인 회원 id
    private Status status;			// 유저 온라인 상태
}	
