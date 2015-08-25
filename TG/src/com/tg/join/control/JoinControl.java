package com.tg.join.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.MemberBean;
import com.tg.common.dao.JoinDAO;

@Controller
public class JoinControl{
	@Autowired
	JoinDAO dao;
	
	@RequestMapping("/joinpass")
	public String memberJoin(Model model, MemberBean bean, @RequestParam(value="id")String id){
		
		if(dao.checkJoin(id)){
			model.addAttribute("join", "fail");
			
		}else{
			dao.join(bean);
			model.addAttribute("join", "success");
		}
		
		return ".join";
	}
	
}
