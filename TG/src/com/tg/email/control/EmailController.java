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

	
	// ��й�ȣ�� ã�� ���� �޼ҵ�
	@RequestMapping("/getPw")
	public String sendEmailAction (@RequestParam (value="id", required=false) String id, 
									Model model, MemberBean memberBean,
									@RequestParam (value="nick", required=false) String nick) 
											throws Exception {
		System.out.println("�޾ƿ� �̸��� ���� " +id);
		System.out.println("�޾ƿ� �г��� ���� " +nick);
		
		memberBean.setId(id);
		
		// ID�� DB�� �ְ�, ID�� ��ȸ�� nick�� �Է¹��� nick�� ��ġ�Ѵٸ�..
		if(joinDao.checkNickAndId(id,nick)){ 
			
			System.out.println("�Է��� ���̵� �ֽ��ϴ�.");
			//��������
			Random random = new Random();
			
			String confirmKey = Character.toString((char)((Math.random() * 26)+97));

			int arr[] = new int[6];		
			for (int i = 0; i < arr.length; i++) {
				arr[i] = random.nextInt(10);
			}
			
			//������ ���� String������ ��ġ��
			for (int i = 0; i < arr.length; i++) {
				confirmKey += String.valueOf(arr[i]);
			}
			
			confirmKey += Character.toString((char)((Math.random() * 26)+97));
			
			// ������ ������ memberBean Ŭ������ pass ������ ����
			memberBean.setPass(confirmKey);
			
			System.out.println("������ �����Ǿ����ϴ�. "+confirmKey);
			System.out.println("ID�� "+memberBean.getId());
			System.out.println("PASS�� "+memberBean.getPass());

			// DB�� �ִ� ��й�ȣ ����
			memberDao.changePass(memberBean);
			
			String pass = memberDao.getPass(id);
			// ���� pass���� "fail" Ȥ�� �ش� �̸��Ͽ� �ش�Ǵ� ��й�ȣ���� ���� �˴ϴ�.
	        
			System.out.println(pass);
			
			if(pass != null){
				email.setContent("�ȳ��ϼ���.\n\n"+id+"���� �ӽ� ��й�ȣ�� [ "+pass+" ]"+
								" �Դϴ�.\n\n���õ� toGathering �ϼ���!");
				email.setReceiver(id);
				email.setSubject("���Դ��� : "+id+"���� ��й�ȣ ã�� �����Դϴ�.");
	            
	            emailSender.SendEmail(email);
	            
	            model.addAttribute("result", "passSendSuccess");
	            
	            return "common/windowClose";
			
			} else {
				model.addAttribute("result", "fail");
				return "common/sendPass";
			}
		
		} else { // id�� nick�� Ʋ�ȴٸ�..
			model.addAttribute("result", "failGetPw");
			return "common/sendPass";
		}
	}

	
	//////////////////////////////////////////////////////////
	
	
	// ȸ������ �� �̸��� ������ ���� �޼ҵ�
	@RequestMapping("/emailConfirm")
	public String confirmEmail( @RequestParam(value="nick", required=false) String nick,
								@RequestParam(value="pass", required=false) String pass,
								@RequestParam(value="id", required=false) String id,
								Model model) throws Exception {
		
		System.out.println("���°�"+id+", "+nick);
		System.out.println("�н����� : "+pass);

		//��������
		Random random = new Random();
		
		String confirmKey = Character.toString((char)((Math.random() * 26)+97));

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
			email.setReceiver(id);
			email.setSubject("�ȳ��ϼ���. ���Դ��� ȸ�������� ���� �����Դϴ�.");
			email.setContent("���Դ��� : ȸ�������� ���� ��Ű�� [ "+ confirmKey +" ] �Դϴ�.");
            emailSender.SendEmail(email);
            
            // ������ �̵� �� �ʿ��� �� ����
            model.addAttribute("result", "confirmSuccess");
            model.addAttribute("mail", id);
            model.addAttribute("nick", nick);
            model.addAttribute("key", confirmKey);
            model.addAttribute("pass", pass);
          
            // ������ �̵�
            return ".join2";
		
		} else { // ���� ������ �����ߴٸ�..
			model.addAttribute("result", "dontCreateRandom");
			return ".join";
		}
	}
}