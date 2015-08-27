package com.tg.note.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;

@Controller
public class NoteSendController{
	
	@Autowired
	NoteDAO noteDao;

	@RequestMapping("/noteSendAction")
	public String noteSend(NoteBean noteBean, HttpSession session, Model model){
        
		noteBean.setSenderId((String) session.getAttribute("id"));;
		
		// insertNote() 메소드 호출
		noteDao.insertNote(noteBean);
		
		// result 키 값에 쪽지발송 했다는 문장 저장
		model.addAttribute("result", "noteSendSuccess");

		// 페이지 이동
		return "common/windowClose";
	}
}
