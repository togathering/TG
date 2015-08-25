package com.tg.note.control;

import java.nio.channels.SeekableByteChannel;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;


@Controller
public class NoteListController{
	
	List<NoteBean> list ;
	
	@Autowired
	NoteDAO noteDao;	
	
	@Autowired
	NoteBean noteBean;
	
	@RequestMapping("/noteList")
	public String noteListing(HttpSession session, Model model){
		
		String id = (String) session.getAttribute("id");
		
		List<NoteBean> list = noteDao.selectNote(id);
		
		for (int i = 0; i < list.size(); i++) {
			/*NoteBean b = list.get(i);*/
			if (list.get(i).getSenderId().equals("admin")) {
				list.get(i).setSenderId("°ü¸®ÀÚ");
			}
		}
		
		model.addAttribute("noteList", list);
		
		return "";
		
		
	}
}
