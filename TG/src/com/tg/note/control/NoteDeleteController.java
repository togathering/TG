package com.tg.note.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.dao.NoteDAO;

@Controller
public class NoteDeleteController {
	
	@Autowired
	NoteDAO noteDao;
	
	@RequestMapping("/deleteNote")
	public String noteDelete(@RequestParam(value="noteNo", required=false) Integer noteNo){
		noteDao.deleteNote(noteNo);
		return "redirect:noteList";
	}
}
