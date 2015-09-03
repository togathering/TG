package com.tg.faq.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqControl {

	@RequestMapping("faqStart")
	public String faqStart(){
		System.out.println("�ƴ�!");
		return ".faq";
	}
	
	@RequestMapping("faqJoin")
	public String faqJoin(){
		System.out.println("����!");
		return ".faqJoin";
	}
}
