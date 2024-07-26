package com.example.service;


import java.util.Properties;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;



@Service
public class EmailServiceImpl implements EmailService{

	
	//이메일인증(확인코드 전송)
//    @Autowired
//    private JavaMailSender mailSender;
//
//    private Random random = new Random();
//
//    public String sendVerificationCode(String toEmail) {
//        String verificationCode = String.valueOf(random.nextInt(999999));
//
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(toEmail);
//        message.setSubject("Your Verification Code");
//        message.setText("Your verification code is: " + verificationCode);
//
//        mailSender.send(message);
//
//        return verificationCode;
//    }	
//    
//
//    public void sendEmail(String to, String subject, String text) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(to);
//        message.setSubject(subject);
//        message.setText(text);
//        mailSender.send(message);
//    }
    
   
	

}
