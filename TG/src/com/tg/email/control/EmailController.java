package com.tg.email.control;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tg.common.beans.MemberBean;
import com.tg.common.dao.JoinDAO;
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
	
	@Autowired
	JoinDAO joinDao;
	
	@Autowired
	MemberBean memberBean;
	
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
	
	
	@RequestMapping("/emailConfirm")
	public String confirmEmail(@RequestParam(value="id", required=false) String mail, 
								@RequestParam(value="nick", required=false) String nick,
								@RequestParam(value="pass", required=false) String pass,
								@RequestParam(value="id", required=false) String id,
								Model model) throws Exception {
		
		System.out.println("���°�"+mail+", "+nick);
		System.out.println("�н����� : "+pass);

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
			
			// �ߺ����̵� üũ
			memberBean.setId(id);
			if(joinDao.checkJoin(memberBean.getId())){ // �̹� ������� ���̵� üũ
				model.addAttribute("join", "fail");
				return ".join";
			}
			
			// �̸��� �߼�
			email.setReceiver(mail);
			email.setSubject("�ȳ��ϼ���. ���Դ��� ȸ�������� ���� �����Դϴ�.");
			email.setContent("���Դ��� : ȸ�������� ���� ��Ű�� [ "+ confirmKey +" ] �Դϴ�.");
            emailSender.SendEmail(email);
            
            // ������ �̵� �� �ʿ��� �� ����
            model.addAttribute("result", "confirmSuccess");
            model.addAttribute("mail", mail);
            model.addAttribute("nick", nick);
            model.addAttribute("key", confirmKey);
            model.addAttribute("pass", pass);
          
            // ������ �̵�
            return ".join2";
		
		} else {
			model.addAttribute("result", "confirmFail");
			return ".join2";
		}
	}
}