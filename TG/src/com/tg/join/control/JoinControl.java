package com.tg.join.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.MemberBean;
import com.tg.common.dao.JoinDAO;

@Controller
public class JoinControl{
	@Autowired
	JoinDAO dao;
	
	@RequestMapping("/joinpass")
	public String memberJoin(Model model, MemberBean bean, 
								@RequestParam(value="userKey") String userKey, 
								@RequestParam(value="correctKey") String correctKey) {
		
		// userKey는 유저가 입력한 인증키, correctKey는 정확한 인증키
		
		System.out.println("입력값 : "+userKey);
		System.out.println("받은값 : "+correctKey);
		
		if(dao.checkJoin(bean.getId())){ // 이미 사용중인 아이디 체크
			model.addAttribute("join", "fail");
			
		} else if(!userKey.equals(correctKey)) { // 인증키 체크
			model.addAttribute("join", "keyFail");
		} else {
			System.err.println("여기까지 도달");
			System.out.println(bean.getId());
			System.out.println("패스"+bean.getPass());
			System.out.println(bean.getNick());
			dao.join(bean);
			model.addAttribute("join", "success");
		}
		
		return ".join";
	}
	
}
