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
		
		// userKey�� ������ �Է��� ����Ű, correctKey�� ��Ȯ�� ����Ű
		
		System.out.println("�Է°� : "+userKey);
		System.out.println("������ : "+correctKey);
		
		if(dao.checkJoin(bean.getId())){ // �̹� ������� ���̵� üũ
			model.addAttribute("join", "fail");
			
		} else if(!userKey.equals(correctKey)) { // ����Ű üũ
			model.addAttribute("join", "keyFail");
		} else {
			System.err.println("������� ����");
			System.out.println(bean.getId());
			System.out.println("�н�"+bean.getPass());
			System.out.println(bean.getNick());
			dao.join(bean);
			model.addAttribute("join", "success");
		}
		
		return ".join";
	}
	
}
