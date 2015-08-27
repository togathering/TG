package com.tg.group.join.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.ParticipantBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;

@Controller
public class GroupJoinControl {
	@Autowired
	GroupDAO gdao;
	@Autowired
	ParticipantDAO pdao;

	@RequestMapping("/joingroup")
	public String groupJoin(@RequestParam(value="gno")String gxno, HttpSession session){
		
		int gno = Integer.parseInt(gxno);
		String id = (String) session.getAttribute("id");
		
		GroupBean bean = gdao.wantGsum(gno);
		int gsum = bean.getGsum();
		int gmax = bean.getGmax();
		String gstatus = null;
		
		gsum++;
		
		if(gsum==gmax){
			gstatus = "�����Ϸ�";
		}else{
			gstatus = "������";
		}		
		
		if(gdao.joinG(gsum, gno, gstatus) && pdao.joinGroup(gno, id)){
			System.out.println("���� ����");						
		}else{
			System.out.println("���� ����");			
		}
		
		return "redirect:main";
	}
	
	@RequestMapping("/cancelJoin")
	public String cancelJoin(@RequestParam(value="gno")Integer gno, ParticipantBean pbean, HttpSession session){
		
		String id = (String) session.getAttribute("id");
		pbean.setPid(id);
	
		GroupBean gbean = gdao.wantGsum(gno);
		int gsum = gbean.getGsum();
		gsum--;
		if(gdao.joinG(gsum, gno, "������") &&	pdao.cancelJoin(pbean)){
			System.out.println("������� ����");				
		}else{
			System.out.println("������� ����");				
		}
		
		return "redirect:main";
	}
}
