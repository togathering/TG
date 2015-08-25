package com.tg.admin.board.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.ReportBean;
import com.tg.common.dao.ReportDAO;

@Controller
public class ReportControl_admin {
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("/adminReport")
	public String report(){
		return ".adminReport";
	}
	
	@RequestMapping("/adminReportList")
	public String reportList(Model model){
		List<ReportBean> list = dao.reportList();
		model.addAttribute("list", list);
		return "admin/report/AdminRlist";
	}
	
	@RequestMapping("/adminReportConfirm")
	public String reportConfirm(Model model, @RequestParam(value="rno") Integer rno){
		ReportBean bean = dao.reportCon(rno);
		model.addAttribute("bean", bean);
		model.addAttribute("rno", rno);
		System.out.println("»Æ¿Œ");
		return "admin/report/AdminReportConfirm";
	}
	
	@RequestMapping("/adminReportOk")
	public String reportOk(@RequestParam(value="upno") Integer no){
		System.out.println("##"+no+"##");
		dao.reportUp(no);
		return "redirect:adminReportList";
	}
	
}
