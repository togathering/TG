package com.tg.common.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.MemberBean;
import com.tg.common.beans.MemberBeanIn;

public class MemberDAO {
	@Autowired
	SqlSession session;
	
	public MemberDAO() {
	
	}
	

	//아이디 추천
	
	
	public String getMemberTel(String id){
		String tel = "";
		tel =  session.selectOne("member.telInfo", id);
		return tel;
	}
	
	public List<MemberBean> mSelectAll(){
		List<MemberBean> list = session.selectList("member.MselectAll");
		return list;
	}
	public List<MemberBean> selectPage(int start, int end){
			 HashMap<Object, Object> map = new HashMap<Object,Object >();
			 String id = "%@%";
			 map.put("s", start);
			 map.put("e", end);
			 map.put("id",id);
			 List<MemberBean> list = session.selectList("member.MselectAll", map);
		
			return list;
	   }//selectPage
	
	public List<MemberBean> mSelectId(String id){
		Map<Object, Object> map = new HashMap<Object, Object>();
		id="%"+id+"%";
		map.put("s",1);
		map.put("e", 500);	
		map.put("id",id );
		List<MemberBean> list = session.selectList("member.MselectAll",map);

		return list;
	}
	public int selectCnt(){
		int cnt = session.selectOne("member.memberCnt");
		return cnt;
	}
	
	public List<MemberBean> searchMember(String search, String id){
		search = "%"+search+"%";		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("id", id);
		List<MemberBean> list = session.selectList("member.searchMember",map);
		
		return list;
	}
	
	public MemberBean selectMem(String id){
		MemberBean bean = session.selectOne("member.selectMem",id);
		return bean;
	}
	public MemberBeanIn profile(String id){
		MemberBeanIn my = session.selectOne("member.my", id);
		return my;
	}
	public boolean upProfile(MemberBeanIn my){
		int t = session.update("member.profile", my);
		if(t==1){
			return true;
		}
		return false;
	}
	
	public String getPass(String id){
		String pass = session.selectOne("member.getPass", id);
		if(pass != null){
			return pass;			
		}
		return "fail";
	}

}
