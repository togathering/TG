package com.tg.report.control;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.ReportBean;
import com.tg.common.dao.ReportDAO;

@Controller
public class ReportControl {

	@Autowired
	ReportDAO dao;
	
	@RequestMapping("/report")
	public String report(@Param(value="accused") String accused, HttpServletRequest request){//�Ű��ϱ�
		return "user/report/report";
	}
	
	@RequestMapping("/reportSend")
	public String reportSend(@Param(value="accused") String accused, @Param(value="category") String category, 
			@Param(value="content") String content, HttpServletRequest request){//�Ű��ϱ�
		String reporter= (String) request.getSession().getAttribute("id");
		String status = "N";
		
		ReportBean bean = new ReportBean();
		bean.setReporter(reporter);
		bean.setAccused(accused);
		bean.setCategory(category);
		bean.setContent(content);
		bean.setStatus(status);
		
		System.out.println("�����ʹ� "+ bean.getReporter());
		System.out.println("�ǽŰ��ڴ� "+bean.getAccused());
		
		if(dao.report(bean)) return "redirect:myFriendList";
		
		System.out.println("##id##"+reporter+":"+category);
		//if(dao.report(bean)) return ".userlist";
		return "redirect:myFriendList";
	}
}
