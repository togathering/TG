package com.tg.group.info.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.ParticipantBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.MemberDAO;
import com.tg.common.dao.ParticipantDAO;
import com.tg.common.dao.WishDAO;

@Controller
public class GroupInfoControl {
	
	@Autowired
	GroupDAO gdao;
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	WishDAO wdao;
	@Autowired
	MemberDAO mdao;
	
	@RequestMapping("/groupinfo")
	public String groupInfo(Model model, @RequestParam(value="gno")String gxno, HttpSession session){
		
		int gno = Integer.parseInt(gxno);
		String id = (String) session.getAttribute("id");
		if(id !=null){			
			if(pdao.dupCheck(gno, id) != null){
				model.addAttribute("join", "ok");
			}else{
				model.addAttribute("join", "no");
			}
			
			if(wdao.checkWish(gno, id) != null){
				model.addAttribute("wish", "ok");
			}else{
				model.addAttribute("wish", "no");				
			}
			
		}		
		GroupBean bean = gdao.selectGroupInfo(gno);

		System.out.println(bean.getGtag());	
		// ���� ����� �������� �ִ�.

		// �±׵��� ���ҽ�Ų��.
		if(bean.getGtag() != null){
			String tags = bean.getGtag().substring(1);
			String[] arrTag = tags.split("#");			
			// �±��� �յ� ������ �����Ѵ�.
			for (int i = 0; i < arrTag.length; i++) {
				arrTag[i] = arrTag[i].trim();
			}
			model.addAttribute("tags", arrTag);
		}
		
		
		// ���� �� �� �ִ� ������..
		// select ghost, gtitle, gday, gloc, gstatus, 
		// gmin, gmax, gimg, gintro, gsum, nick, gtag
		
		String tel = mdao.getMemberTel(id);
		String gender = mdao.getMemberGender(id);
		model.addAttribute("tel", tel);
		model.addAttribute("gender", gender);
		
		if(bean != null){
			bean.setGno(gno);
			model.addAttribute("group", bean);	
			
		}
		ArrayList<ParticipantBean> list = (ArrayList<ParticipantBean>) pdao.joinList(gno);
		
		if(list.size() != 0){
			model.addAttribute("joinlist", list);
		}else {
			System.out.println("�����ھ���");
		}
		
		return ".tginfo";
	}
}
