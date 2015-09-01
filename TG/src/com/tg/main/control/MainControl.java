package com.tg.main.control;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;

@Controller
public class MainControl {
	@Autowired
	GroupDAO dao;
	
	@RequestMapping("/mainlist")
	public String mainView(Model model){
		
		ArrayList<GroupBean> list = (ArrayList<GroupBean>) dao.mainList();
		model.addAttribute("list", list);
		
		return "user/main/mainlist";
	}
	
	@RequestMapping("/mainSearchGroup")
	public String searchGroup(Model model){
		
		return"user/main/mainSearchList";
	}

}
