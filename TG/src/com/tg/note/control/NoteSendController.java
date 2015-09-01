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

		// 금지어 리스트 작성
		
		List<String> banList = valDao.selectBans(); 
				
		// 받아온 값
		String strTitle = noteBean.getNoteTitle();
		String strContent = noteBean.getNoteContent();
		System.out.println("받아온 쪽지제목="+ strTitle);		
		System.out.println("받아온 쪽지내용="+ strContent);		
		System.out.println("받아온 쪽지내용="+ banList.get(1));		
		System.out.println("받아온 쪽지내용="+ banList.get(2));		
		
		// 신호키 설정
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(strTitle.contains(banList.get(i)) || strContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	
		System.out.println("검사가 되나요?");
	   return flag;
	}//banCheck
	
	
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
