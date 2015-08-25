package com.tg.user.member.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.MemberBean;
import com.tg.common.dao.MemberDAO;


@Controller
public class UserlistControl {
	@Autowired
	MemberDAO dao;
	
	ArrayList<MemberBean> list;
	
	@RequestMapping("/searchuser")
	public String userList(@RequestParam(value="search", required=false)String search, HttpSession session, Model model){
		
		if(!search.equals("")){
			String id = (String) session.getAttribute("id");
			
			list = (ArrayList<MemberBean>) dao.searchMember(search, id);
			model.addAttribute("list", list);
		}
		return "user/memberlist/searchmemlist";
	}
}
