package com.tg.group.select.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.MemberDAO;

@Controller
public class GroupSelectControl {
	@Autowired
	GroupDAO dao;
	@Autowired
	MemberDAO mdao;
	
	
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
}
