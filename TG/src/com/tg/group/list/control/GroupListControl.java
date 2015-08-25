package com.tg.group.list.control;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;

@Controller
public class GroupListControl {
	
	@Autowired
	GroupDAO dao;
	ArrayList<GroupBean> list;
	
	@RequestMapping("/groupsearch")
	public String groupList(Model model, 
			@RequestParam(value="search", required=false)String keyword, 
			@RequestParam(value="order", required=false)String order,
			@RequestParam(value="day", required=false)String day,
			@RequestParam(value="cnt", required=false)Integer cnt){		
		String movePage = "";
		if(cnt == null){
			cnt = 6;
			movePage = ".tglist";
		}else{
			movePage = "user/grouplist/addlist";
		}
		
		
		if(keyword != null){
			if(order != null && !order.equals("")){
				list = (ArrayList<GroupBean>) dao.search(keyword, order, cnt);
			}else{
				list = (ArrayList<GroupBean>) dao.search(keyword, "gday", cnt);
			}
			model.addAttribute("keyword", keyword);
					
		}else{
			if(order != null && !order.equals("")){
				list = (ArrayList<GroupBean>) dao.listAll(order, cnt);
			}else {
				list = (ArrayList<GroupBean>) dao.listAll("gday", cnt);
			}
		}
		
		if(day != null && !day.equals("") ){
			list = (ArrayList<GroupBean>) dao.searchDay(day);
		}
		
		model.addAttribute("tglist", list);
		model.addAttribute("size", list.size());
		
		return movePage;
	}
	
	
}
