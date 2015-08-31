package com.tg.invite.control;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.tg.common.dao.ParticipantDAO;

@Controller
public class InviteGroupControl {
	@Autowired
	InviteGroupDAO idao;
	@Autowired
	FriendDAO fdao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	ParticipantDAO pdao;
	
	ArrayList<InviteGroupBean> list;
	
	@RequestMapping("/invitePage")	
	public String invitePage(HttpSession session, Model model){
		String id = (String) session.getAttribute("id");
		
		list = (ArrayList<InviteGroupBean>) idao.loadInvite(id);
		
		model.addAttribute("invite", list);
		
		return "user/mypage/inviteList";
	}
	
	@RequestMapping("/delInvite")
	public String delInvite(@RequestParam(value="sendId")String sendId, 
			@RequestParam(value="gno")Integer gno, 
			@RequestParam(value="reId")String reId){
		
		idao.delInvite(sendId, gno, reId);
		
		return "user/mypage/inviteList";
	}
	
	@RequestMapping("/joinDuplication")
	public String joinDuplication(@RequestParam(value="gno")Integer gno ,
			HttpSession session,
			Model model){
		
		String id = (String) session.getAttribute("id");
		System.out.println("gno:"+gno);
		
		
		ArrayList<FriendBean> list = (ArrayList<FriendBean>) fdao.friendRequestList(id);
		ArrayList<HashMap<String, String>> flist = new ArrayList<HashMap<String, String>>();
		
		for(int i=0;i<list.size();i++){
			String reqId = list.get(i).getId();
			if(fdao.friendCheck(id, reqId)){
				if(pdao.joinDuplication(gno,reqId)){
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("exist", "참여중");
					map.put("fid", reqId);
					flist.add(map);
				}else if(idao.inviteCheck(gno, reqId, id)){
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("exist", "초대중");
					map.put("fid", reqId);
					flist.add(map);
				}
			}
		}
		
		model.addAttribute("joinlist", flist);
		
		
		
		return "user/groupinfo/joinDuplication";
	}
	
}
