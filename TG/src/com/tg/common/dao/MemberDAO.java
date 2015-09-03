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
		if(id != null){
			tel = session.selectOne("member.telInfo", id);			
		}
		return tel;
	}
	
	public String getMemberGender(String id){
		String gender = "";
		if(id != null){
			gender = session.selectOne("member.genderInfo", id);			
		}
		return gender;
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
	
	// 비밀번호 찾기 시 비밀번호 자동변경
	public boolean changePass(MemberBean bean){
		System.out.println("DAO changePass() 메소드입니다.");
		System.out.println(bean.getId());
		System.out.println(bean.getPass());
		
		int t = session.update("member.changePass", bean);
		
		System.out.println("쿼리문 실행 여부를 확인하겠습니다. "+t);
		
		if(t == 1){
			return true;
		
		} else {
			return false;			
		}
	}
	
	// 뉴비검사
	public String checkNewbie(String id){
		String chekcNewbie = session.selectOne("member.checkNewbie", id);
		return chekcNewbie;
	}

}
