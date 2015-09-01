package com.tg.note.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;
import com.tg.common.dao.ValidityDAO;

@Controller
public class NoteSendController{
	
	@Autowired
	NoteDAO noteDao;
	
	@RequestMapping("/noteSendAction")
	public String noteSend(NoteBean noteBean, HttpSession session, Model model,
							@RequestParam(value="receiverNick", required=false) String nick, 
							@RequestParam(value="receiverId", required=false) String id, 
							@RequestParam(value="noteTitle", required=false) String noteTitle,
							@RequestParam(value="noteContent", required=false) String noteContent){
        
		noteBean.setSenderId((String) session.getAttribute("id"));;
		System.out.println("받아온 id는 "+id);
		System.out.println("받아온 nick는 "+nick);
		System.out.println("받아온 noteTitle은 "+noteTitle);
		System.out.println("받아온 noteContent는 "+noteContent);
		 
		// insertNote() 메소드 호출
		noteDao.insertNote(noteBean);
		// result 키 값에 쪽지발송 했다는 문장 저장
		model.addAttribute("result", "noteSendSuccess");
		// 페이지 이동
		return "common/windowClose";
		
	}//noteSend
}
