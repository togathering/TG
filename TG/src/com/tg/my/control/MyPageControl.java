package com.tg.my.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.MemberBean;
import com.tg.common.beans.MemberBeanIn;
import com.tg.common.beans.ParticipantBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.MemberDAO;
import com.tg.common.dao.ParticipantDAO;

@Controller
public class MyPageControl {
	@Autowired
	MemberDAO dao;
	@Autowired
	GroupDAO gdao;
	@Autowired
	ParticipantDAO pdao;
	
	@RequestMapping("/mypage")
	public String myPage(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		MemberBeanIn bean = dao.profile(id);
		model.addAttribute("my", bean);
		return ".mypage";
	}
	
	@RequestMapping("/myupdate")
	public String gxDelete(MemberBeanIn m, HttpSession session,
			@RequestParam(value="year")String year,
			@RequestParam(value="month")String month,
			@RequestParam(value="day")String day) {
		String id= (String) session.getAttribute("id");
		
		m.setBirth(year+month+day);
		m.setId(id);
		
		dao.upProfile(m);					
		
		return ".main";		
	}

	@RequestMapping("/myhost")
	public String myHost(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		List<GroupBean> list = gdao.hostGx(id);
		int num = gdao.hostNum(id);
		model.addAttribute("list", list);
		model.addAttribute("hNum", num);
		
		return ".myhost";
	}
	
	@RequestMapping("/mygx")
	public String myGx(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		String gstatus = "¸ðÁýÁß";
		List<GroupBean> list = gdao.joinGx(id, gstatus);
		int num = gdao.joinNum(id);
		model.addAttribute("list", list);
		model.addAttribute("gNum", num);
		
		return ".mygx";
	}
	
	@RequestMapping("/gxcancel")
	public String cancelJoin(@RequestParam(value="gno") Integer gno, ParticipantBean pbean, HttpSession session){
		
		String id = (String) session.getAttribute("id");
		pbean.setPid(id);
		GroupBean bean = gdao.wantGsum(gno);
		int gsum = bean.getGsum();
		gsum--;
		if(gdao.joinGroup(gsum, gno) &&	pdao.cancelJoin(pbean)){
		}else{
			return ".mygx";
		}
		return "redirect:mygx";
	}
	
	@RequestMapping("/gxdelete")
	public String gxDelete(@RequestParam(value="gno") Integer gno){
		if(gdao.delGroup(gno)) return "redirect:myhost";
		
		return "redirect:myhost";
	}
}
