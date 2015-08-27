
package com.tg.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.MemberBean;
import com.tg.iba.MySqlMapConfig;

public class AdminDAO {

	@Autowired
	private SqlSession session;
	HttpServletRequest request;
	
	int startNum =0; //시작숫자
	int countNum= 10; // 한페이지에 보여줄 숫자 
	
	
	public AdminDAO() {
		
	}
	
	public boolean loginCheck(String id, String pass){
		
		try{
		// 이전 세션 끊기 
		request.getSession().removeAttribute("id");
		request.getSession().removeAttribute("pass");
		request.getSession().removeAttribute("nick"); 
		}catch(NullPointerException e){
			e.getStackTrace();
		}
				System.out.println("id&pass="+id+"&"+pass);
				
				if(pass.equals((session.selectOne("admin.login",id)))){
					return true;
				}else{
					return false; }
		}

		
	//아이디 추천
	public List<String> suggestId(String keyword){
		List<String> list = null;
			list = session.selectList("admin.suggestMember", "%"+keyword+"%");
		return list;
	}

	public List<GroupBean> AdminSearchTitle(String gtitle){
		List<GroupBean> list = null;
		gtitle="%"+gtitle+"%";
		System.out.println("dao"+gtitle);

			list=session.selectList("group.MsearchTitle",gtitle);
		return list;
	}

	
	//리스트 뿌려주기 
	public List<MemberBean> selectAll(int num){
		List<MemberBean> list = null;
		
		System.out.println(num);
		
			startNum= (num*10);
//			list = session.selectList("admin.selectAll",null ,startNum, countNum);
			list = session.selectList("admin.selectAll",null ,new RowBounds(startNum, countNum));
		return list;
	}
	
	//회원수 count
	public int countAll(){
		int memberNum=0;
			memberNum=(int)session.selectOne("admin.countAll");

		return memberNum;
	}

	
	//특정 회원 검색
	public List<MemberBean> selectId(int num,  String pid){
		List<MemberBean> list = null;
		String id = "%"+pid+"%";
		Map<String, Object> map = new HashMap<String, Object>();
			startNum= (num*10);
			map.put("id", id);
			System.out.println(id);
			list = session.selectList("admin.selectAll",map ,new RowBounds(startNum, countNum));
	
		return list;
	}
		
	//특정 검색어 관련 회원 검색
	public int countId(String pid){
		int countId = 0;
			String id = "%"+pid+"%";
			countId = (int) session.selectOne("admin.countSpecificId", id);
		
		return countId;
	}

}



