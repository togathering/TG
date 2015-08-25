package com.tg.group.wish.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.WishBean;
import com.tg.common.dao.WishDAO;

@Controller
public class GroupWishControl {
	
	@Autowired
	WishDAO wdao;
	
	@RequestMapping("/wishgroup")
	public String wishGroup(HttpSession session, 
			@RequestParam(value="gno")Integer gno,
			WishBean bean){
		String id = (String) session.getAttribute("id");
		
		bean.setId(id);
		
		if(wdao.wishGroup(bean)){
			System.out.println("좋아요 성공");
		}else{
			System.out.println("좋아요 실패");				
		}
		return "redirect:groupinfo?gno="+gno;
	}
	
	@RequestMapping("/cancelWish")
	public String cancelWish(HttpSession session, 
			@RequestParam(value="gno")Integer gno){
		
		String id = (String) session.getAttribute("id");
		
		wdao.cancelWish(gno, id);
		
		return "redirect:groupinfo?gno="+gno;
	}
}
