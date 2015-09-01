package com.tg.group.list.control;

import java.util.List;

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
	List<GroupBean> list;
	
	@RequestMapping("/groupsearch")
	public String groupList(Model model, 
			@RequestParam(value="search", required=false, defaultValue="")String keyword, 
			@RequestParam(value="order", required=false, defaultValue="gday")String order,
			@RequestParam(value="day", required=false, defaultValue="")String day,
			@RequestParam(value="cnt", required=false)Integer cnt){		
		String movePage = "";		
		
		if(cnt == null){
			cnt = 6;
			movePage = ".tglist";
		}else{
			movePage = "user/grouplist/addlist";
		}
		
		list = dao.conditionSearch(keyword, order, cnt, day);		
		
		model.addAttribute("tglist", list);
		model.addAttribute("size", list.size());
		model.addAttribute("keyword", keyword);
		
		
		
		
		return movePage;
	}
	
	
}
