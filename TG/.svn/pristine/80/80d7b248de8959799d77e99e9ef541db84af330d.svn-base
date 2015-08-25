package com.tg.admin.board.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.QnaBean;
import com.tg.common.beans.ReportBean;
import com.tg.common.dao.QnaDAO;

@Controller
public class QnaControl_admin {
	@Autowired
	QnaDAO dao;

	@RequestMapping("/adminQna")
	public String qna(){
		return ".adminQna";
	}
	
	@RequestMapping("/adminQnaList")
	public String qnaList(Model model){
		String qstatus="N";
		List<QnaBean> list = dao.qnaList(qstatus);
		model.addAttribute("list", list);
		return "admin/qna/AdminQlist";
	}
	
	@RequestMapping("/adminQnaReply")
	public String qnaReply(@RequestParam(value="qno") Integer qno, Model model){
		QnaBean bean = dao.QnaSelect(qno);
		model.addAttribute("bean", bean);
		return ".adminQnaReply";
	}
	
	@RequestMapping("/adminQnaOk")
	public String qnaOk(@RequestParam(value="qno") Integer qno, @RequestParam(value="rcont") String rcont){
		QnaBean bean = new QnaBean();
		String qstatus = "Y";
		bean.setQno(qno);
		bean.setRcont(rcont);
		bean.setQstatus(qstatus);
		dao.QnaReply(bean);
		return "redirect:adminQna";
	}
}
