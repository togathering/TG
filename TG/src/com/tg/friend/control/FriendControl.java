package com.tg.friend.control;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.FriendBean;
import com.tg.common.beans.InviteGroupBean;
import com.tg.common.beans.MemberBean;
import com.tg.common.dao.FriendDAO;
import com.tg.common.dao.InviteGroupDAO;
import com.tg.common.dao.MemberDAO;

@Controller
public class FriendControl {
	
	@Autowired
	FriendDAO fdao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	InviteGroupDAO idao;
	
	InviteGroupBean bean;
	
	@RequestMapping("/addFriend")
	public String addFriend(Model model, 
			@RequestParam(value="search", required=false)String search, 
			HttpSession session,
			FriendBean fbean){

		String id = (String) session.getAttribute("id");
		fbean.setId(id);
		
		if(fdao.addFriend(fbean)){
			System.out.println("친추성공");
		}else{
			System.out.println("친추실패");
		}
		return "redirect:searchuser?search="+search;
	}
	
	@RequestMapping("/myFriendReq")
	public String friendReq(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		
		ArrayList<FriendBean> list = (ArrayList<FriendBean>) fdao.friendRequestList(id);
		ArrayList<MemberBean> freq = new ArrayList<MemberBean>();
		for(int i=0;i<list.size();i++){
			String reqId = list.get(i).getId();
			if(!fdao.friendCheck(id, reqId)){				
				freq.add(mdao.selectMem(reqId));
				
			}
		}		
		model.addAttribute("freq", freq);
		
		return "user/mypage/friendReq";
	}
	
	@RequestMapping("/myFriendList")
	public String friendList(HttpSession session, Model model, 
			@RequestParam(value="page", required=false)String reqPage,
			@RequestParam(value="gno", required=false)Integer gno){		
		String rePage = "";
		
		String id = (String) session.getAttribute("id");
			
		ArrayList<FriendBean> list = (ArrayList<FriendBean>) fdao.friendRequestList(id);
		ArrayList<MemberBean> flist = new ArrayList<MemberBean>();
		for(int i=0;i<list.size();i++){
			String reqId = list.get(i).getId();
			if(fdao.friendCheck(id, reqId)){
				flist.add(mdao.selectMem(reqId));				
			
			}
		}			
		model.addAttribute("flist", flist);
		if(reqPage.equals("myPage")){
			rePage= "user/mypage/friendList";
		}else if(reqPage.equals("invite")){
			model.addAttribute("gno", gno);
			rePage= "user/groupinfo/inviteFriendList";
		}
		
		return rePage;
	}
	
	@RequestMapping("/acceptFriend")
	public String acceptFriend(HttpSession session, FriendBean fbean){
		
		String id = (String) session.getAttribute("id");

		fbean.setId(id);
		
		fdao.addFriend(fbean);

		return "redirect:myFriend";
	}
	
	@RequestMapping("/rejectFriend")
	public String refectFriend(@RequestParam(value="rejectId")String rejectId){
		
		fdao.delRequest(rejectId);

		return "redirect:myFriend";
	}
	
	@RequestMapping("/delFriend")
	public String delFriend(HttpSession session, @RequestParam(value="delId")String delId){
		String id = (String) session.getAttribute("id");
		fdao.delFriend(id, delId);
		fdao.delFriend(delId, id);
		
		return "redirect:myFriend";
	}
	
	@RequestMapping("/inviteGroup")
	public String inviteGroup(HttpSession session, 
			@RequestParam(value="gno")Integer gno,
			@RequestParam(value="friends")String friend){
	
		String id = (String) session.getAttribute("id");
		
		String [] friends = friend.split(",");
		
		for(int i=0;i<friends.length;i++){
			bean = new InviteGroupBean();
			bean.setId(id);
			bean.setFid(friends[i]);
			bean.setGno(gno);
			idao.invite(bean);
		}
		
		return "user/groupinfo/inviteSuccess";
	}
}
