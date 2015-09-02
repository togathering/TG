package com.tg.group.create.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;





import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tg.common.beans.GroupBean;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.ParticipantDAO;
import com.tg.common.dao.ReplyDAO;
import com.tg.common.dao.WishDAO;

@Controller
public class CreateControl{
	
	@Autowired
	ReplyDAO rdao;
	@Autowired
	ParticipantDAO pdao;
	@Autowired
	GroupDAO dao;
	@Autowired
	WishDAO wdao;
	
	@Autowired
	GroupBean bean;
	
	@RequestMapping("/gxcreate")
	public String groupCreate(HttpServletRequest request) throws Exception{	
		String gimg = null;
		request.setCharacterEncoding("UTF-8");
		
		String savePath = request.getSession().getServletContext().getRealPath("upimg");

		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "EUC-KR", new DefaultFileRenamePolicy());
		 
		String imgfile = multi.getFilesystemName("imgfile");
		if(imgfile==null){
			String gxImg = multi.getParameter("gxImg");
			gimg = gxImg;
		}else{
			gimg = imgfile;		
		}
		
		
		
		String [] day = multi.getParameter("gdate").split("-");
		String date = "";
		for(int i=0;i<day.length;i++){
			if(i!=0){
				if(day[i].length()==1){
					day[i] = "0"+day[i];
				}
			}
			date += day[i];
		}
		String hour = multi.getParameter("hour");
		String minute = multi.getParameter("minute");
		String id = (String) request.getSession().getAttribute("id");
		String gdate = date + hour + minute;
		String gloc = multi.getParameter("loc");
		int gmin = Integer.parseInt(multi.getParameter("min"));
		int gmax = Integer.parseInt(multi.getParameter("max"));
		String gtitle = multi.getParameter("title");
		String gintro = multi.getParameter("message");
		String gtag = multi.getParameter("tag");
		String goption = multi.getParameter("joinOption");

		if(gimg == null){
			gimg = "Tg_Default_Img.png";
		}
		
		bean.setGdate(gdate);
		bean.setGhost(id);
		bean.setGintro(gintro);
		bean.setGloc(gloc);
		bean.setGmax(gmax);
		bean.setGmin(gmin);
		bean.setGtitle(gtitle);
		bean.setGtag(gtag);
		bean.setGimg(gimg);
		bean.setGoption(goption);
		
		if(dao.create(bean)){
			System.out.println("모임생성성공");
		}else {
			System.out.println("모임생성실패");
		}
				
		return "redirect:main";
	}
	
	@RequestMapping("/delGroup")
	public String delGroup(@RequestParam(value="gno")Integer gno){
		
		if(rdao.delGroup(gno)){
			System.out.println("댓글삭제성공");
		}
		if(pdao.delGroup(gno)){
			System.out.println("참가멤버들 삭제성공");		
		}
		if(wdao.delGroup(gno)){
			System.out.println("원해요 삭제성공");
		}
		
		if(dao.delGroup(gno)){
			System.out.println("모임삭제성공");
		}else{
			System.out.println("모임삭제실패");
		}
		return "redirect:main";
	}
}
