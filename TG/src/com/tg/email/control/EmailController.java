package com.tg.email.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tg.common.dao.MemberDAO;
import com.tg.email.model.Email;
import com.tg.email.model.EmailSender;

@Controller
public class EmailController {
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email email;
	
	@Autowired
	MemberDAO memberDao;
	
	@RequestMapping("/getPw")
	public String sendEmailAction (@RequestParam (value="id", required=false) String id) throws Exception 
		{
		
		System.out.println("받아온 이메일 값은 " +id);
		
		String pass = memberDao.getPass(id);
		// 변수 pass에는 "fail" 혹은 해당 이메일에 해당되는 비밀번호값이 담기게 됩니다.
        
		System.out.println(pass);
		
		if(pass != null){
			email.setContent("안녕하세요.\n"+id+"님의 비밀번호는 [ "+pass+" ]"+
							" 입니다.\n오늘도 toGathering 하세요!");
			email.setReceiver(id);
			email.setSubject("투게더링 : "+id+"님의 비밀번호 찾기 메일입니다.");
            
            emailSender.SendEmail(email);
            
            return "common/windowClose";
		
		} else return "redirect:login";
	}
}