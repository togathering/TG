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
import com.tg.common.dao.ReplyDAO;
import com.tg.common.dao.WishDAO;

@Controller
public class MyPageControl {
	@Autowired
	MemberDAO dao;
	@Autowired
	GroupDAO gdao;
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	WishDAO wdao;
	@Autowired
	ReplyDAO rdao;
	
	
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
		String birth = year+month+day;
		
		m.setBirth(birth);
		m.setId(id);
		dao.upProfile(m);
		
		return "redirect:main";
		
		
	}

	@RequestMapping("/myhost")
	public String myHost(Model model, HttpSession session){
		
		return ".myhost";
	}
	
	@RequestMapping("/myhosting")
	public String myHosting(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		List<GroupBean> list = gdao.hostGx(id);
		int num = gdao.hostNum(id);
		model.addAttribute("list", list);
		model.addAttribute("hNum", num);
		
		return "user/mypage/hosting";
	}
	
	@RequestMapping("/myhostend")
	public String myHostEnd(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		List<GroupBean> list = gdao.hostGxEnd(id);
		int num = gdao.hostNum(id);
		model.addAttribute("list", list);
		model.addAttribute("hNum", num);
		
		return "user/mypage/hostEnd";
	}
	
	@RequestMapping("/mygxgroup")
	public String myGx(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		String gstatus = "모집중";
		List<GroupBean> list = gdao.joinGx(id);
		int num = gdao.joinNum(id);
		model.addAttribute("list", list);
		model.addAttribute("gNum", num);
		model.addAttribute("gstatus", gstatus);
		
		return "user/mypage/processing";
	}
	
	@RequestMapping("/mygxgroupEnd")
	public String myGxEnd(Model model, HttpSession session){
		String id = (String) session.getAttribute("id");
		String gstatus = "모임종료";
		List<GroupBean> list = gdao.joinGxEnd(id);
		int num = gdao.joinNum(id);
		model.addAttribute("list", list);
		model.addAttribute("gNum", num);
		model.addAttribute("gstatus", gstatus);
		
		return "user/mypage/endGroup";
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
		
		if(rdao.delGroup(gno)){
			System.out.println("댓글삭제성공");
		}
		if(pdao.delGroup(gno)){
			System.out.println("참가멤버들 삭제성공");		
		}
		if(wdao.delGroup(gno)){
			System.out.println("원해요 삭제성공");
		}
		
		if(gdao.delGroup(gno)){
			System.out.println("모임삭제성공");
		}else{
			System.out.println("모임삭제실패");
		}
		
		
		return "redirect:myhost";
	}
}
