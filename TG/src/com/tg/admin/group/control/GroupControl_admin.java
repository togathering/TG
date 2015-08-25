package com.tg.admin.group.control;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.dao.AdminDAO;

@Controller
public class GroupControl_admin {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("/adminGroupList")
	public String groupList(@Param(value="keyword")String keyword,Model model){
		/*System.out.println("그룹검색 검색어"+keyword);*/
		System.out.println("검색어"+keyword);
	
			
		return ".adminGroup_List";
	}
}
