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
	
	@Autowired
	ValidityDAO valDao;

	
	@RequestMapping("/banCheck")
	@ResponseBody
	public String banCheck(NoteBean noteBean){

		// ������ ����Ʈ �ۼ�
		
		List<String> banList = valDao.selectBans(); 
				
		// �޾ƿ� ��
		String strTitle = noteBean.getNoteTitle();
		String strContent = noteBean.getNoteContent();
		System.out.println("�޾ƿ� ��������="+ strTitle);		
		System.out.println("�޾ƿ� ��������="+ strContent);		
		System.out.println("�޾ƿ� ��������="+ banList.get(1));		
		System.out.println("�޾ƿ� ��������="+ banList.get(2));		
		
		// ��ȣŰ ����
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(strTitle.contains(banList.get(i)) || strContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	
		System.out.println("�˻簡 �ǳ���?");
	   return flag;
	}//banCheck
	
	
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
