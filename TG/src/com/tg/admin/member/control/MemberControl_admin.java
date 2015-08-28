package com.tg.admin.member.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.dao.AdminDAO;
   
   
@Controller
public class MemberControl_admin {
	
	@Autowired
	AdminDAO dao;  
	
	
	@RequestMapping("/suggestId")
	public String suggestId(@Param(value="keyword")String keyword,Model model){
		System.out.println("검색어 : "+keyword);
	 List list	 = dao.suggestId(keyword);
	 
	 model.addAttribute("list", list);
//		System.out.println(list);
		return "admin/member/SuggestMember";
	}
	
	 @RequestMapping("/specificId")
	 public String specificId(@RequestParam(value="keyword")String id,@Param(value="pageNum")String pageNum,Model model, HttpServletRequest request){
		 
		 int pageMaxNum =0;
		 
		 System.out.println("검색결과 : "+dao.countId(id));
			if(dao.countId(id)%10==0){
				pageMaxNum= dao.countId(id)/10;
				}else{
				pageMaxNum= dao.countId(id)/10+1;
				}
		System.out.println("pageMaxNum in search result: "+pageMaxNum);	
		 request.setAttribute("pageMaxNum",	pageMaxNum);
		 
			int pNum=0;
			if(pageNum==null){
				pNum=0;
			}else{
				 pNum = Integer.parseInt(pageNum)-1;
			}
		 
			request.setAttribute("keyword", id);
			request.setAttribute("list", dao.selectId(pNum, id));
			request.setAttribute("pageNum", pNum);
			
		 int t = dao.selectId(0,id).size();
		 System.out.println(id+"요기"+t+"개 : "+dao.selectId(0,id));
		 return "admin/member/SpecificMember";
		 
	 }
	
	 @RequestMapping("removeId")
	 public String removeId(@RequestParam(value="delId")String eraseId){
		 if(dao.removeId(eraseId)){
			 System.out.println("삭제아이디:"+eraseId+"삭제 성공");
			
		 }else{
			 System.out.println("삭제아이디:"+eraseId+"삭제 실패");
		 }
		 return ".adminMember_List";
	 }
		 
		 @RequestMapping("removeId2")
		 public boolean removeId2(@RequestParam(value="delId")String eraseId){
			 if(eraseId.substring(0, 5).equals("(탈퇴회원)")){
				return true;
			 }else{
				 
				 if(dao.removeId2(eraseId)){
					 System.out.println("삭제아이디:"+eraseId+"삭제 성공");
					 return true; 
				 }else{
					 System.out.println("삭제아이디:"+eraseId+"삭제 실패");
					 return false;
				 }
			 
			 }
	 }


}
