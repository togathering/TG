package com.tg.review.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.ReviewBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;

@Controller
public class ReviewControl {
	
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	GroupDAO gdao;
	
	@RequestMapping("/openReview")
	public String openReview(Model model, @RequestParam(value="gno")Integer gno){
		
		model.addAttribute("host", gdao.selectGroupInfo(gno).getGhost());
		model.addAttribute("list", pdao.joinList(gno));
		
		return "user/review/review";
	}
	
	@RequestMapping("/review")
	public String review(ReviewBean rbean, HttpSession session){
		String id = (String) session.getAttribute("id");
		
		System.out.println(id);
		System.out.println(rbean.getGno());
		System.out.println(rbean.getId());
		System.out.println(rbean.getComment());
		
		return "redirect:mygx";
	}
}
