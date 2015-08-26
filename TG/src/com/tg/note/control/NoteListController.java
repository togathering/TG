package com.tg.note.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.NoteDAO;


@Controller
public class NoteListController{
	
	List<NoteBean> list;
	
	@Autowired
	NoteDAO noteDao;	
	
	@Autowired
	NoteBean noteBean;
	
	@RequestMapping("/noteList")
	public String noteListing(HttpSession session, Model model, @RequestParam(value = "page", required = false)Integer page){
		
		String id = (String) session.getAttribute("id");
		
		int pres_page = page == null ? 1 : page;
		int totalCount = noteDao.selectNoteCount(id);
		int max_element = 10, page_div = 5;
		int start_idx = (pres_page - 1) * max_element;
		int max_page = (int)(totalCount / max_element) + (totalCount % max_element == 0 ? 0 : 1);
		int begin_page = ((int)((pres_page - 1) / page_div)) * page_div + 1;
		int end_page = ((int)((pres_page - 1) / page_div) + 1) * 5;
		end_page = end_page > max_page ? max_page : end_page;
		
		List<NoteBean> list = noteDao.selectNote(id, start_idx, max_element);
		
		for (NoteBean bean : list) {
			if (bean.getSenderId().equals("admin")) {
				bean.setSenderId("°ü¸®ÀÚ");
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noteList", list);
		map.put("begin_page", begin_page);
		map.put("end_page", end_page);
		map.put("max_page", max_page);
		map.put("pres_page", pres_page);
		
		model.addAllAttributes(map);
		return ".noteList";
	}
}
