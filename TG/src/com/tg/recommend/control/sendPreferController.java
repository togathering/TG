package com.tg.recommend.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.WishBean;

@Controller
public class sendPreferController {

	@RequestMapping("/sendPrefer")
	public String aa(@RequestParam(value="prefer") String values, 
			Model model){
		
		System.out.println("v´Â "+values);
		
		// String values = v.substring(0);
		
		String[] value = values.split(",");
		
		for (int i = 0; i < value.length; i++) {
			System.out.println("value["+i+"] = "+value[i]);
			
		}
		
		return "research";
	}
}
