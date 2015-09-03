package com.tg.admin.login;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSessionVali {
	
	@RequestMapping("/vali")
	public String aa(HttpSession session){
		System.out.println("¼¼¼ÇÀº "+session.getAttribute("id"));
		session.invalidate();
		return "redirect:adminLogin";
	}
}
