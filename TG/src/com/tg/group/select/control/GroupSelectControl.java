package com.tg.group.select.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.MemberDAO;
import com.tg.webSocket.control.ChatHandler;

@Controller
public class GroupSelectControl {
	@Autowired
	GroupDAO dao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	ChatHandler chat;
	
	
	@RequestMapping("selectGx")
	public String selectGx(HttpSession session, Model model){
		
		String id = (String) session.getAttribute("id");
		String tel = mdao.getMemberTel(id);
		String gender = mdao.getMemberGender(id);
		
		model.addAttribute("tel",tel);
		model.addAttribute("gender",gender);
		
		return ".selectGx";
	}
	
	@RequestMapping("selectGxList")
	public String selectGxList(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		List<GroupBean> list = dao.hostGxEnd(id);
		model.addAttribute("list", list);
		return ".selectGxList";
	}
	
	@RequestMapping("createGx")
	public String createGx(@RequestParam(value="gno", required=true)Integer gno, Model model){
		
		GroupBean bean = dao.selectGroupInfo(gno);
		model.addAttribute("bean", bean);
		if(bean.getGintro() != null){
			System.out.println("#####");
			String intro = "Yes";
			model.addAttribute("intro", intro);
		}
		return ".createSelect";
	}
	
	@RequestMapping("/chatId")
	@ResponseBody
	public String getUser(@RequestParam(value="id") String id,
			               @RequestParam(value="nick") String nick){
		
		chat.setId(id);
		chat.setNickName(nick);
		
		String result="";
		List<String> list = dao.roomTitle(id);
		if(list==null||list.size()==0) result = "0|";
		else result=list.size()+"|";
		for(int i=0; i< list.size(); i++){
			result+=list.get(i);
			if(i < list.size()-1)result+="¡×";
		}
		return result;
	}
}
