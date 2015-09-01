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

@Controller
public class GroupSelectControl {
	@Autowired
	GroupDAO dao;
	
	@RequestMapping("selectGx")
	public String selectGx(){
		return ".selectGx";
	}
	
	@RequestMapping("selectGxList")
	public String selectGxList(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		List<GroupBean> list = dao.hostGxEnd(id);
		if(list.size()!=0){
			
			System.out.println("º±≈√!"+list.get(0).getGtitle());
		}
		model.addAttribute("list", list);
		return ".selectGxList";
	}
	
	@RequestMapping("create")
	public String createGx(@RequestParam(value="gno", required=false)Integer gno, Model model){
		GroupBean bean = dao.selectGroupInfo(gno);
		model.addAttribute("bean", bean);
		System.out.println(bean.getGtitle());
		return ".create";
	}
}
