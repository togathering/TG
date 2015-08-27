package com.tg.profile.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.MemberBeanIn;
import com.tg.common.dao.MemberDAO;
import com.tg.common.dao.ReportDAO;

@Controller
public class ProfileControl {
	@Autowired
	MemberDAO dao;
	@Autowired
	ReportDAO rdao;

	@RequestMapping("/profile")
	public String profile(@RequestParam(value="id") String id, Model model){
		MemberBeanIn bean = dao.profile(id);
		int count = rdao.reportCount(id);
		model.addAttribute("my", bean);
		model.addAttribute("count", count);
		return "user/profile/profile";
	}
	
	
}
