package com.tg.search.comtrol;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;

@Controller
public class TagSearchController {
	
	@Autowired
	GroupDAO groupDao;
	
	List<GroupBean> list;
	
	@RequestMapping("/tagResult")
	public String TagSearchResult(@RequestParam(value="tag", required=false) String tag,
									Model model, HttpServletRequest req){
		
		System.out.println("ÅÂ±×´Â"+req.getParameter("tag"));
		list = groupDao.tagResult(tag);
		System.out.println(list.size());
		
		model.addAttribute("tglist", list);
		model.addAttribute("size", list.size());
		
		return ".tglist";
	}
}
