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
		System.out.println("�޾ƿ� id�� "+id);
		System.out.println("�޾ƿ� nick�� "+nick);
		System.out.println("�޾ƿ� noteTitle�� "+noteTitle);
		System.out.println("�޾ƿ� noteContent�� "+noteContent);
		 
		// insertNote() �޼ҵ� ȣ��
		noteDao.insertNote(noteBean);
		// result Ű ���� �����߼� �ߴٴ� ���� ����
		model.addAttribute("result", "noteSendSuccess");
		// ������ �̵�
		return "common/windowClose";
		
	}//noteSend
}
