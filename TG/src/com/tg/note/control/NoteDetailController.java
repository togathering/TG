package com.tg.note.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;

@Controller
public class NoteDetailController {

	@Autowired
	NoteDAO noteDao;
	
	@Autowired
	NoteBean noteBean;
	
	@RequestMapping("/noteDtail")
	public String detail(@RequestParam(value="no", required=false) Integer noteNo, HttpServletRequest req) {
		
		System.out.println("쪽지번호 :"+ noteNo);
		noteBean = noteDao.detailNote(noteNo);
		
		// 쪽지함, 
		if(noteBean.getSenderId().equals("admin")){
			noteBean.setSenderId("관리자");
			req.setAttribute("check", "admin");
			
		}else {
			req.setAttribute("check", "user");
		}
		
		req.setAttribute("noteBean", noteBean);
		
		return "user/note/readNote";
	}

}
