package com.tg.note.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;

@Controller
public class NoteDeleteController {
	
	@Autowired
	NoteDAO noteDao;
	
	@RequestMapping("/deleteNote")
	public String noteDelete(@RequestParam(value="noteNo", required=false) Integer noteNo,
							HttpSession session, Model model){
		
		System.out.println("받아온 번호는 "+noteNo);
		
		noteDao.deleteNote(noteNo); // 쪽지 삭제 끝.
		
		// 쪽지를 뿌려주기 위한 설정
		String id = (String) session.getAttribute("id");
		
		List<NoteBean> list = noteDao.selectNote(id);
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getSenderId().equals("admin")) {
				list.get(i).setSenderId("관리자");
			}
		}	
		model.addAttribute("noteList", list);
		
		return ".noteList";
	}
}
