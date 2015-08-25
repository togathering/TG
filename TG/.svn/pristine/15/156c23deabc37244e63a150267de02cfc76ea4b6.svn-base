package com.tg.group.reply.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.ReplyBean;
import com.tg.common.dao.ReplyDAO;

@Controller
public class GroupReplyControl {
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping("/loadReply")
	public String loadReply(Model model ,@RequestParam(value="gno") String gxno ,@RequestParam(value="end", required=false)String replyend){
		int end = Integer.parseInt(replyend);
		int gno = Integer.parseInt(gxno);		
		
		ArrayList<ReplyBean> list = (ArrayList<ReplyBean>) dao.pageReply(end, gno);
		int size = dao.countReply(gno);
		if(list!=null){
			model.addAttribute("list", list);
			model.addAttribute("size", size);
			System.out.println("댓글가져오기 성공");
		}else{
			System.out.println("댓글 가져오기 실패");			
		}
		return "user/groupreply/replys";
	}
	
	
	@RequestMapping("/addReply")
	public String addReply(Model model ,HttpSession session, 
			@RequestParam(value="gno") Integer gno ,
			@RequestParam(value="end", required=false)Integer end, 
			ReplyBean bean){
		
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("nick");
		
		bean.setId(id);
		bean.setName(name);
		
		if(dao.addReply(bean)){
			System.out.println("댓글등록성공");
		}else{
			System.out.println("댓글등록실패");
		}
		
		return "redirect:loadReply?end="+end+"&gno="+gno;
	}
	
	
	@RequestMapping("/upReply")
	public String upReply(Model model ,HttpSession session, 
			@RequestParam(value="gno") Integer gno ,
			@RequestParam(value="end", required=false)Integer end,
			ReplyBean bean){
		
		if(dao.upReply(bean)){
			System.out.println("댓글수정성공");
		}else {
			System.out.println("댓글수정실패");
		}	
		
		return "redirect:loadReply?end="+end+"&gno="+gno;
	}
	
	@RequestMapping("/delReply")
	public String delReply(Model model ,HttpSession session, 
			@RequestParam(value="gno") Integer gno ,
			@RequestParam(value="end", required=false)Integer end,
			@RequestParam(value="no")Integer no){
	
		if(dao.delReply(no)){
			System.out.println("댓글삭제성공");		
		}else{
			System.out.println("댓글삭제실패");
		}		
		
		return "redirect:loadReply?end="+end+"&gno="+gno;
	}
}
