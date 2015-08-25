package com.tg.admin.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.dao.AdminDAO;

@Controller
public class AdminLoginControl {

	@Autowired
	AdminDAO dao;
	
	@RequestMapping("/adminLoginSuccess")
	public String adminLogin(@Param(value="id")String id, @Param(value="pass")String pass, HttpSession session, HttpServletRequest request){
		String page="";
		
		if(dao.loginCheck(id, pass)){
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);	
			request.setAttribute("login", "succcess");
			System.out.println("관리자 로그인 성공");
			page = ".adminMember_List";
			
			int pageMaxNum =  0;
			
			if(dao.countAll()%10==0){
				pageMaxNum= dao.countAll()/10;
				}else{
				pageMaxNum= dao.countAll()/10+1;
				}
			
			request.setAttribute("pageMaxNum", pageMaxNum);
			
			if(pageMaxNum!=0) 
			{request.setAttribute("list",dao.selectAll(0));}
	//		System.out.println(dao.selectAll(0));
		}else{
			request.setAttribute("login", "fail");
			page = ".adminLogin";
			System.out.println("관리자 로그인 실패");
		}
			
		return page;
	}

	
	@RequestMapping("/adminMemberList")
	public String memberListPage(@Param(value="pageNum")String pageNum,Model model, HttpServletRequest request){

		int pageMaxNum =  0;
		
		if(dao.countAll()%10==0){
		pageMaxNum= dao.countAll()/10;
		}else{
		pageMaxNum= dao.countAll()/10+1;
		}
		
		request.setAttribute("pageMaxNum", pageMaxNum);
		
		int pNum=0;
	if(pageNum==null){
		pNum=0;
	}else{
		 pNum = Integer.parseInt(pageNum)-1;
	}
	
	request.setAttribute("list",dao.selectAll(pNum));
	request.setAttribute("pageNum", pNum);
	
	return".adminMember_List";
}
}
