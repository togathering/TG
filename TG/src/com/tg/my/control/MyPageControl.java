package com.tg.my.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	public String gxDelete(HttpServletRequest request, HttpSession session) throws Exception{	
		MemberBeanIn m = new MemberBeanIn();
		String pic = null;
		request.setCharacterEncoding("UTF-8");
		
		String savePath = request.getSession().getServletContext().getRealPath("proimg");

		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "EUC-KR", new DefaultFileRenamePolicy());
		 
		String imgFile = multi.getFilesystemName("imgFile");
		if(imgFile==null){
			String picImg = multi.getParameter("picImg");
			if(picImg != null){
				pic = picImg;
			}else{
				pic = "";
			}
		}else{
			pic = imgFile;		
		}
		
		System.out.println("imgFile"+pic);
		
		String id= (String) session.getAttribute("id");
		String pass = multi.getParameter("pass");
		String nick = multi.getParameter("nick");
		String tel = multi.getParameter("tel");
		String gender = multi.getParameter("gender");
		String favo = multi.getParameter("favo");
		String loc = multi.getParameter("loc");
		String insta = multi.getParameter("insta");
		String fbook = multi.getParameter("fbook");
		String intro = multi.getParameter("intro");
		String year = multi.getParameter("year");
		String month = multi.getParameter("month");
		String day = multi.getParameter("day");
		String birth = year+month+day;
		System.out.println("멤버:"+birth);
		
		m.setId(id);
		m.setPass(pass);
		m.setNick(nick);
		m.setTel(tel);
		m.setGender(gender);
		m.setFavo(favo);
		m.setLoc(loc);
		m.setInsta(insta);
		m.setFbook(fbook);
		m.setIntro(intro);
		m.setBirth(birth);
		m.setPic(pic);
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
