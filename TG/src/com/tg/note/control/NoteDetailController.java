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
	public String detail(@RequestParam(value="no", required=false) Integer noteNo, 
						@RequestParam(value="senderId",required=false) String sender,
						HttpServletRequest req) {
		
		System.out.println("�������"+sender);
		System.out.println("������ȣ :"+noteNo);
		
		if(sender.equals("������")){
			noteBean = noteDao.detailNoteAdmin(noteNo);
		} else {
			noteBean = noteDao.detailNote(noteNo); 
		}
		
		if(noteBean.getSenderId().equals("admin")){
			noteBean.setSenderId("������");
			req.setAttribute("check", "admin");
			
		}else {
			req.setAttribute("check", "user");
		}
		
		req.setAttribute("noteBean", noteBean);
		
		return "user/note/readNote"; 
	}

}
