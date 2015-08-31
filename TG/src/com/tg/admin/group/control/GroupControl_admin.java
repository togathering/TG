package com.tg.admin.group.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tg.common.dao.AdminDAO;

@Controller
public class GroupControl_admin {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping("/adminGroupList")
	public String groupList(@Param(value="pageNum")String pageNum,Model model, HttpServletRequest request){
		int pageMaxNum =  0;
		
		if(dao.countAllGroup()%10==0){
		pageMaxNum= dao.countAllGroup()/10;
		}else{
		pageMaxNum= dao.countAllGroup()/10+1;
		}
		
		request.setAttribute("pageMaxNum", pageMaxNum);
		
		int pNum=0;
		if(pageNum==null){
			pNum=0;
		}else{
			pNum = Integer.parseInt(pageNum)-1;
		}
	
	request.setAttribute("list",dao.selectAllGroup(pNum));
	request.setAttribute("pageNum", pNum);
	
			
		return ".adminGroup_List";
	}
	 @RequestMapping("/specificGroup")
	 public String specificId(@RequestParam(value="keyword")String gtitle,@Param(value="pageNum")String pageNum,Model model, HttpServletRequest request){
		 
		 int pageMaxNum =0;
		 
		 System.out.println("검색결과 : "+dao.countTitle(gtitle));
			if(dao.countTitle(gtitle)%10==0){
				pageMaxNum= dao.countTitle(gtitle)/10;
				}else{
				pageMaxNum= dao.countTitle(gtitle)/10+1;
				}
		System.out.println("pageMaxNum in search result: "+pageMaxNum);	
		 request.setAttribute("pageMaxNum",	pageMaxNum);
		 
			int pNum=0;
			if(pageNum==null){
				pNum=0;
			}else{
				 pNum = Integer.parseInt(pageNum)-1;
			}
		 
			request.setAttribute("keyword", gtitle);
			request.setAttribute("list", dao.selectTitle(pNum, gtitle));
			request.setAttribute("pageNum", pNum);
			
		 int t = dao.selectTitle(0,gtitle).size();
		 System.out.println(gtitle+"요기"+t+"개 : "+dao.selectTitle(pNum,gtitle));
		 return "admin/group/SpecificGroup";
		 
	 }

	 @RequestMapping("deleteG")
	 @ResponseBody
	 public String deleteG (@RequestParam(value="delGno")String delGno){
		if( dao.removeG(delGno)){
			System.out.println("그룹삭제 완료 : 그룹번호 : "+delGno);
			return "success";
		}else {
			System.out.println("그룹삭제 실패 : 그룹번호 : "+delGno);
			return "fail";
		} 
	 } 

}
