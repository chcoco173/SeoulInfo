package com.example.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDAO;
import com.example.domain.MailVO;
import com.example.domain.MemberVO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	
//    private final JavaMailSender javaMailSender;
//
//    private static final String senderEmail= "juliahan0722@gmail.com";
//
//    public void CreateMail(MailVO mailVo){
//
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(mailVo.getReceiver());
//        message.setFrom(senderEmail);
//        message.setSubject(mailVo.getTitle());
//        message.setText(mailVo.getContent());
//
//        javaMailSender.send(message);
//    }
	
    private final JavaMailSender javaMailSender;
    private static final String senderEmail= "juliahan0722@gmail.com";
    private static int number;

    public static void createNumber(){
       number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String mail){
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("서울지역안내서비스 이메일 인증");
            String body = "";
            body += "<h3>" + "본 메일은 발신 전용메일입니다." + "</h3>";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public int sendMail(String mail){

        MimeMessage message = CreateMail(mail);

        javaMailSender.send(message);

        return number;
    }	
 
    
    
    //임시비밀번호 전송
    public void sendTemporaryPassword(String member_email, String tempPassword) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(senderEmail);
            helper.setTo(member_email);
            helper.setSubject("서울지역안내서비스 임시비밀번호");

            String body = "";
            body += "<h3>" + "본 메일은 발신 전용메일입니다." + "</h3>";
            body += "<h3>" + "요청하신 임시 비밀번호입니다." + "</h3>";
            body += "<h1>" + tempPassword + "</h1>";
            body += "<h3>" + "로그인 후에 마이페이지에서 비밀번호를 변경해주세요!" + "</h3>";

            helper.setText(body, true); // HTML 형식의 이메일로 설정

            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            // 에러 처리 로직을 추가할 수 있습니다.
        }
    }        
    
       

}
