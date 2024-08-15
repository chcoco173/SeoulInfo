package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String mainPage(HttpServletRequest request ) {
		HttpSession session = request.getSession();
		Boolean hasSeenLandingPage = (Boolean) session.getAttribute("hasSeenLandingPage");

		if (hasSeenLandingPage == null || !hasSeenLandingPage) {
            session.setAttribute("hasSeenLandingPage", true);
            return "landingpage"; // JSP 파일 이름 (WEB-INF/views/landingPage.jsp)
        } else {
        	return "index"; // JSP 파일 이름 (WEB-INF/views/index.jsp)
           
        }
	}
	

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		System.out.println(step);
		return step;
	}
	
	
	
}
