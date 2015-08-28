package com.tg.review.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.NodeList;

import com.tg.common.beans.ReviewBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;
import com.tg.common.dao.ReviewDAO;

@Controller
public class ReviewControl {
	
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	GroupDAO gdao;
	@Autowired
	ReviewDAO rdao;
	
	@RequestMapping("/openReview")
	public String openReview(Model model, HttpSession session, @RequestParam(value="gno")Integer gno){
		
		model.addAttribute("list", rdao.reviewList(gno, (String) session.getAttribute("id")));
		
		return "user/review/review";
	}
	
	@RequestMapping("/review")
	public String review(ReviewBean bean, HttpSession session, Model model){
		String evaluator = (String) session.getAttribute("id");
		bean.setEvaluator(evaluator);
		rdao.upEvaluate(bean);
		
		
		return "redirect:main";
	}
}
