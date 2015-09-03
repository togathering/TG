package com.tg.login.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tg.common.dao.LoginDAO;
import com.tg.webSocket.control.ChatHandler;

@Controller
public class LoginControl {
	@Autowired
	LoginDAO dao;
	
	ChatHandler ch;
	 private Map<String, WebSocketSession> users;
	  public LoginControl() {
		 users = new HashMap<String, WebSocketSession>();
	  }	
	
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
			
			String status = dao.checkNewbie(id);
			
			System.out.println("로그인 컨트롤러 실행결과는 "+status);
			
			// 채팅 소켓 연결 
			
			try {
				WebSocketSession wSession = (WebSocketSession) new TextWebSocketHandler();
				ch.afterConnectionEstablished(wSession);
			    System.out.println("["+wSession.getId()+ "] 연결");
			    users.put((String)session.getAttribute("id") ,  wSession);
			    session.setAttribute("map", users);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			System.out.println(status);
			if(status.equals("newbie")){
				page = "redirect:research";
			
			} else{

				page = "redirect:main";				
			}
			System.out.println("페이지는 "+page);
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
