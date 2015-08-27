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
		
		System.out.println("�޾ƿ� �̸��� ���� " +id);
		
		String pass = memberDao.getPass(id);
		// ���� pass���� "fail" Ȥ�� �ش� �̸��Ͽ� �ش�Ǵ� ��й�ȣ���� ���� �˴ϴ�.
        
		System.out.println(pass);
		
		if(pass != null){
			email.setContent("�ȳ��ϼ���.\n"+id+"���� ��й�ȣ�� [ "+pass+" ]"+
							" �Դϴ�.\n���õ� toGathering �ϼ���!");
			email.setReceiver(id);
			email.setSubject("���Դ��� : "+id+"���� ��й�ȣ ã�� �����Դϴ�.");
            
            emailSender.SendEmail(email);
            
            return "common/windowClose";
		
		} else return "redirect:login";
	}
}