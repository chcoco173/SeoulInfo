package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailVO {
	
	private String receiver;
	private String title;
	private String content;
	
    private String address;
    private String message;	

}
