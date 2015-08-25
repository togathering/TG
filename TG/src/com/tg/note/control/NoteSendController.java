package com.tg.note.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;

@Controller
public class NoteSendController{
	
	@Autowired
	NoteDAO noteDao;

	@RequestMapping("/noteSendAction")
	public String noteSend(NoteBean noteBean, HttpSession session){
        
		noteBean.setSenderId((String) session.getAttribute("id"));;
		
		// insertNote() �޼ҵ� ȣ��
		noteDao.insertNote(noteBean);
		
		// ������ �̵�
		return "user/main/main";
	}
}