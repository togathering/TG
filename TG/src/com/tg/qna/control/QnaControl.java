package com.tg.qna.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.QnaBean;
import com.tg.common.dao.QnaDAO;

@Controller
public class QnaControl {
	@Autowired
	QnaDAO dao;
	
	@RequestMapping("qna")
	public String qna(){
		return ".qna";
	}
	
	@RequestMapping("qnaSend")
	public String qnaSend(@Param(value="title") String title, @Param(value="content") String content, 
			@Param(value="tel") String tel, HttpServletRequest request){
		String id = (String) request.getSession().getAttribute("id");
		QnaBean bean = new QnaBean();
		bean.setId(id);
		bean.setQtitle(title);
		bean.setQcont(content);
		bean.setTel(tel);
		if(dao.qnaInsert(bean)){ return ".main";}
		return ".qna";
	}

	@RequestMapping("qnaList")
	public String qnaList(){
	
		return ".qnaList";
	}
	
	@RequestMapping("/qnaRe")
	public String qnad(@Param(value="answer") String answer, Model model, HttpSession session){
		String qstatus = null;
		String page = "user/qna/qlist";
		String id=(String) session.getAttribute("id");
		if(answer.equalsIgnoreCase("n")){
			qstatus = "N";
			List<QnaBean> list = dao.QnaReplyConfirm(qstatus, id);
			model.addAttribute("list", list);
			return page;
		}else if(answer.equalsIgnoreCase("y")){
			qstatus = "Y";
			List<QnaBean> list = dao.QnaReplyConfirm(qstatus, id);
			model.addAttribute("list", list);
			return page;
		}
		return page;
	}
	@RequestMapping("qnaReplyConfirm")
	public String qnaReConfirm(@Param(value="qno") Integer qno, Model model){
		QnaBean bean = dao.QnaSelect(qno);
		model.addAttribute("bean", bean);
		return ".qnaReConfirm";
	}
	
}
