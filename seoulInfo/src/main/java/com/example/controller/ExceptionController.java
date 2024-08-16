package com.example.controller;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
public class ExceptionController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(WebRequest webRequest, Model model) {
        Integer statusCode = (Integer) webRequest.getAttribute("javax.servlet.error.status_code", WebRequest.SCOPE_REQUEST);
        String errorMessage = "알 수 없는 오류가 발생했습니다.";

        if (statusCode != null) {
            if (statusCode == 404) {
                errorMessage = "페이지를 찾을 수 없습니다.";
                return "exception/404"; // 404 에러 페이지로 이동
            } else if (statusCode == 401) {
                errorMessage = "서버 오류가 발생했습니다.";
                return "exception/401"; // 500 에러 페이지로 이동
            }
        }

        model.addAttribute("errorMessage", errorMessage);
        return "exception/GeneralExceptionHandler"; // 일반적인 에러 페이지로 이동
    }
}
