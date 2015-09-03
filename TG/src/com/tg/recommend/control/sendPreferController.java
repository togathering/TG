package com.tg.recommend.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.UserPreferenceBean;
import com.tg.common.beans.WishBean;
import com.tg.common.dao.LoginDAO;
import com.tg.common.dao.UserPreferenceDAO;



@Controller
public class sendPreferController {
	
	@Autowired
	UserPreferenceBean bean;
	
	@Autowired
	UserPreferenceDAO dao;
	
	@Autowired
	LoginDAO loginDao;
	
	@RequestMapping("/sendPrefer")
	public String aa(@RequestParam(value="prefer") String values, 
			Model model, HttpSession session){
		
		String id = (String) session.getAttribute("id");
		bean.setId(id);
		
		String[] value = values.split(",");
		
		
		for (int i = 0; i < value.length; i++) {
			
			System.out.println("value["+i+"] = "+value[i]);
			String[] info = value[i].split("z");
			
			bean.setCategory_name(info[0]);
			bean.setProvince_name(info[1]);
			bean.setRatio(Integer.valueOf(info[2]));
			
			if(dao.insert(bean)){
				loginDao.changeNewbie(id);
			}
		}

		model.addAttribute("msg", "제출성공");
		return "redirect:main";
	}
}
