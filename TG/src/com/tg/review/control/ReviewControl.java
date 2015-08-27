package com.tg.review.control;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;

@Controller
public class ReviewControl {
	
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	GroupDAO gdao;
	
	@RequestMapping("/review")
	public String review(Model model, @RequestParam(value="gno")Integer gno){
		
		model.addAttribute("host", gdao.selectGroupInfo(gno).getGhost());
		model.addAttribute("list", pdao.joinList(gno));
		
		return "user/review/review";
	}
}
