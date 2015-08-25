package com.tg.invite.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.InviteGroupBean;
import com.tg.common.dao.InviteGroupDAO;

@Controller
public class InviteGroupControl {
	@Autowired
	InviteGroupDAO idao;
	
	ArrayList<InviteGroupBean> list;
	
	@RequestMapping("/invitePage")	
	public String invitePage(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		
		list = (ArrayList<InviteGroupBean>) idao.loadInvite(id);
		
		model.addAttribute("invite", list);
		
		return "user/mypage/inviteList";
	}
	
	@RequestMapping("/delInvite")
	public String delInvite(@RequestParam(value="sendId")String sendId, 
			@RequestParam(value="gno")Integer gno, 
			@RequestParam(value="reId")String reId){
		
		idao.delInvite(sendId, gno, reId);
		
		return "user/mypage/inviteList";
	}
}
