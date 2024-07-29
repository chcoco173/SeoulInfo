package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.example.domain.MailVO;
import com.example.service.MailService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
    private final MailService mailService;

    @GetMapping("/id_search")
    public String MailPage(){
//        return "mailPage";
    	return "id_search";
    }
    
    @GetMapping("/pw_search")
    public String MailPage2(){
//        return "mailPage2";
    	return "pw_search";
    }    

//    @PostMapping("/mail")
//    public void MailSend(MailVO mailVo){
//        mailService.CreateMail(mailVo);
//    }
    
    @ResponseBody
    @PostMapping("/mailSend")
    public String MailSend(String mail){

       int number = mailService.sendMail(mail);

       String num = "" + number;

       return num;
    }
        

}
