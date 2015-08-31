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
            
            model.addAttribute("result", "passSendSuccess");
            
            return "common/windowClose";
		
		} else {
			model.addAttribute("result", "fail");
			return "common/sendPass";
		}
	}
	
	
	@RequestMapping("/emailConfirm")
	public String confirmEmail(@RequestParam(value="id", required=false) String mail, 
								@RequestParam(value="nick", required=false) String nick,
								@RequestParam(value="pass", required=false) String pass,
								Model model) throws Exception {
		
		System.out.println("들어온값"+mail+", "+nick);
		System.out.println("패스워드"+pass);

		Random random = new Random();
		
		String confirmKey = Character.toString((char)((Math.random() * 26)+97));

		//난수생성
		int arr[] = new int[5];		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(10);
		}
		
		//생성된 난수 String형으로 합치기
		for (int i = 0; i < arr.length; i++) {
			confirmKey += String.valueOf(arr[i]);
		}
		
		if(confirmKey != null){
			email.setReceiver(mail);
			email.setSubject("안녕하세요. 투게더링 회원가입을 위한 메일입니다.");
			email.setContent("투게더링 : 회원가입을 위한 핫키는 [ "+ confirmKey +" ] 입니다.");
            
            emailSender.SendEmail(email);
            
            model.addAttribute("result", "confirmSuccess");
            model.addAttribute("mail", mail);
            model.addAttribute("nick", nick);
            model.addAttribute("key", confirmKey);
            model.addAttribute("pass", pass);
            
            return ".join2";
		
		} else {
			model.addAttribute("result", "confirmFail");
			return "user/main/joinFail";
		}
	}
}