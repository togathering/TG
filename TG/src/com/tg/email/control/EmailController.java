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

	
	// 비밀번호를 찾기 위한 메소드
	@RequestMapping("/getPw")
	public String sendEmailAction (@RequestParam (value="id", required=false) String id, 
									Model model, MemberBean memberBean,
									@RequestParam (value="nick", required=false) String nick) 
											throws Exception {
		System.out.println("받아온 이메일 값은 " +id);
		System.out.println("받아온 닉네임 값은 " +nick);
		
		memberBean.setId(id);
		
		// ID가 DB에 있고, ID로 조회한 nick과 입력받은 nick이 일치한다면..
		if(joinDao.checkNickAndId(id,nick)){ 
			
			System.out.println("입력한 아이디가 있습니다.");
			//난수생성
			Random random = new Random();
			
			String confirmKey = Character.toString((char)((Math.random() * 26)+97));

			int arr[] = new int[6];		
			for (int i = 0; i < arr.length; i++) {
				arr[i] = random.nextInt(10);
			}
			
			//생성된 난수 String형으로 합치기
			for (int i = 0; i < arr.length; i++) {
				confirmKey += String.valueOf(arr[i]);
			}
			
			confirmKey += Character.toString((char)((Math.random() * 26)+97));
			
			// 생성된 난수를 memberBean 클래스의 pass 변수에 저장
			memberBean.setPass(confirmKey);
			
			System.out.println("난수가 생성되었습니다. "+confirmKey);
			System.out.println("ID는 "+memberBean.getId());
			System.out.println("PASS는 "+memberBean.getPass());

			// DB에 있는 비밀번호 변경
			memberDao.changePass(memberBean);
			
			String pass = memberDao.getPass(id);
			// 변수 pass에는 "fail" 혹은 해당 이메일에 해당되는 비밀번호값이 담기게 됩니다.
	        
			System.out.println(pass);
			
			if(pass != null){
				email.setContent("안녕하세요.\n\n"+id+"님의 임시 비밀번호는 [ "+pass+" ]"+
								" 입니다.\n\n오늘도 toGathering 하세요!");
				email.setReceiver(id);
				email.setSubject("투게더링 : "+id+"님의 비밀번호 찾기 메일입니다.");
	            
	            emailSender.SendEmail(email);
	            
	            model.addAttribute("result", "passSendSuccess");
	            
	            return "common/windowClose";
			
			} else {
				model.addAttribute("result", "fail");
				return "common/sendPass";
			}
		
		} else { // id와 nick이 틀렸다면..
			model.addAttribute("result", "failGetPw");
			return "common/sendPass";
		}
	}

	
	//////////////////////////////////////////////////////////
	
	
	// 회원가입 전 이메일 인증을 위한 메소드
	@RequestMapping("/emailConfirm")
	public String confirmEmail( @RequestParam(value="nick", required=false) String nick,
								@RequestParam(value="pass", required=false) String pass,
								@RequestParam(value="id", required=false) String id,
								Model model) throws Exception {
		
		System.out.println("들어온값"+id+", "+nick);
		System.out.println("패스워드 : "+pass);

		//난수생성
		Random random = new Random();
		
		String confirmKey = Character.toString((char)((Math.random() * 26)+97));

		int arr[] = new int[5];		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(10);
		}
		
		//생성된 난수 String형으로 합치기
		for (int i = 0; i < arr.length; i++) {
			confirmKey += String.valueOf(arr[i]);
		}
		
		if(confirmKey != null){	
			
			// 중복아이디 체크
			memberBean.setId(id);
			if(joinDao.checkJoin(memberBean.getId())){ // 이미 사용중인 아이디 체크
				model.addAttribute("join", "fail");
				return ".join";
			}		

			// 이메일 발송
			email.setReceiver(id);
			email.setSubject("안녕하세요. 투게더링 회원가입을 위한 메일입니다.");
			email.setContent("투게더링 : 회원가입을 위한 핫키는 [ "+ confirmKey +" ] 입니다.");
            emailSender.SendEmail(email);
            
            // 페이지 이동 후 필요한 값 저장
            model.addAttribute("result", "confirmSuccess");
            model.addAttribute("mail", id);
            model.addAttribute("nick", nick);
            model.addAttribute("key", confirmKey);
            model.addAttribute("pass", pass);
          
            // 페이지 이동
            return ".join2";
		
		} else { // 난수 생성에 실패했다면..
			model.addAttribute("result", "dontCreateRandom");
			return ".join";
		}
	}
}