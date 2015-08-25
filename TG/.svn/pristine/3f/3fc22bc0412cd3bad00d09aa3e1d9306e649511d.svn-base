package com.tg.group.kick.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.ParticipantBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;

@Controller
public class KickControl {
	@Autowired
	GroupDAO gdao;
	@Autowired
	ParticipantDAO pdao;
	
	@RequestMapping("/kickGroup")
	public String kickGroup(ParticipantBean pbean){
		
		int gno = pbean.getGno();
		GroupBean gbean = gdao.wantGsum(gno);
		int gsum = gbean.getGsum();
		gsum--;
		if(gdao.joinGroup(gsum, gno) &&	pdao.cancelJoin(pbean)){
			System.out.println("°­Åð ¼º°ø");				
		}else{
			System.out.println("°­Åð ½ÇÆÐ");				
		}
		
		return "redirect:groupinfo?gno="+gno;
	}
}
