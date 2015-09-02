package com.tg.login.control;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.dao.LoginDAO;

@Controller
public class LoginControl {
	@Autowired
	LoginDAO dao;
	
	@RequestMapping("/loginpass")
	public String loginForm(@Param(value="id")String id, 
			@Param(value="pass")String pass, 
			HttpSession session,
			Model model){
		
		String page = "";
					
		if(dao.checkLogin(id,pass)){
			String nick = dao.loginNick(id);
			session.setAttribute("nick", nick);
			//세션로그인
		    session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			dao.changeNewbie(id);
			page = "redirect:main";
		}else{
			model.addAttribute("login", "fail");
			page = ".login";
		}
		
		return page;
	}
	
	@RequestMapping("/logoutpass")
	public String logOut(HttpSession session){
		
		session.removeAttribute("id");
		session.removeAttribute("pass");
		session.removeAttribute("nick");
		
		return "redirect:main";
	}
}
