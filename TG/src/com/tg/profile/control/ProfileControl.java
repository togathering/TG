package com.tg.profile.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.MemberBeanIn;
import com.tg.common.beans.ReviewBean;
import com.tg.common.dao.MemberDAO;
import com.tg.common.dao.ReportDAO;
import com.tg.common.dao.ReviewDAO;

@Controller
public class ProfileControl {
	@Autowired
	MemberDAO dao;
	@Autowired
	ReportDAO rpdao;
	@Autowired
	ReviewDAO rvdao;

	@RequestMapping("/profile")
	public String profile(@RequestParam(value="id") String id, Model model){
		MemberBeanIn bean = dao.profile(id);
		List<ReviewBean> review = rvdao.rList(id);
		int count = rpdao.reportCount(id);
		int grade = rvdao.reviewGrade(id);
		model.addAttribute("my", bean);
		model.addAttribute("count", count);
		model.addAttribute("review", review);
		model.addAttribute("grade", grade);
		return "user/profile/profile-review";
	}
	
	
}
