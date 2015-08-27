package com.tg.email.control;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String sendEmailAction (@RequestParam (value="id", required=false) String id, Model model) throws Exception 
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
            
            model.addAttribute("result", "passSendSuccess");
            
            return "common/windowClose";
		
		} else {
			model.addAttribute("result", "fail");
			return "common/sendPass";
		}
	}
	
	@RequestMapping("/confirmEmail")
	public String confirmEmail(@RequestParam(value="email", required=false) String confirmEmail, 
								Model model) throws Exception{
		
		System.out.println(confirmEmail);

		Random random = new Random();
		
		String confirmKey = Character.toString((char)((Math.random() * 26)+97));

		//��������
		int arr[] = new int[5];		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(10);
		}
		
		//������ ���� String������ ��ġ��
		for (int i = 0; i < arr.length; i++) {
			confirmKey += String.valueOf(arr[i]);
		}
		
		if(confirmKey != null){
			email.setReceiver(confirmEmail);
			email.setSubject("�ȳ��ϼ���.\n ���Դ��� ȸ�������� ���� �����Դϴ�.");
			email.setContent("���Դ��� : ȸ�������� ���� ��Ű��"+ confirmKey+"�Դϴ�.");
            
            emailSender.SendEmail(email);
            
            model.addAttribute("result", "confirmSuccess");
            model.addAttribute("email", confirmEmail);
            model.addAttribute("key", confirmKey);
            
            return "redirect:emailConfirm";
		
		} else {
			model.addAttribute("result", "confirmFail");
			return "redirect:emailConfirm";
		}
	}
}