
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
	//그룹관리
		public List<GroupBean> SpecificTitle(String gtitle){
			List<GroupBean> list = null;
			gtitle="%"+gtitle+"%";
			System.out.println("dao"+gtitle);

				list=session.selectList("group.SpecificGroup",gtitle);
			return list;
	}
	//그룹리스트 뿌려주기 
		public List<GroupBean> selectAllGroup(int num){
			List<GroupBean> list = null;
			
			System.out.println(num);
			
				startNum= (num*10);

				list = session.selectList("admin.selectAllGroup",null ,new RowBounds(startNum, countNum));
			return list;
		}
		//그룹수 count
		public int countAllGroup(){
			int memberNum=0;
				memberNum=(int)session.selectOne("admin.countAllGroup");

			return memberNum;
		}
		
		//특정 모임명 검색
		public List<GroupBean> selectTitle(int num,  String gtitle){
			List<GroupBean> list = null;
			gtitle="%"+gtitle+"%";

			Map<String, Object> map = new HashMap<String, Object>();
				startNum= (num*10);
				map.put("gtitle", gtitle);
				System.out.println("Dao 내 title 확인"+gtitle);
				list = session.selectList("admin.selectAllGroup",map ,new RowBounds(startNum, countNum));
				
			return list;
		}
		//검색한 모임명 갯수
		public int countTitle(String gtitle){
			int countTitle = 0;
				String title = "%"+gtitle+"%";
				countTitle = (int) session.selectOne("admin.countSpecificTitle", title);
			
			return countTitle;
		}
		
		
		
	//멤버관리
	//아이디 추천
	public List<String> suggestId(String keyword){
		List<String> list = null;
			list = session.selectList("admin.suggestMember", "%"+keyword+"%");
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
		
	//특정 검색어 관련 회원수 검색
	public int countId(String pid){
		int countId = 0;
			String id = "%"+pid+"%";
			countId = (int) session.selectOne("admin.countSpecificId", id);
		
		return countId;
	}

	public boolean removeId(String pid){
		//1차 아이디 삭제  삭제/ 임시 보존/ 영구보존
		
		int t = session.update("admin.deleteId",pid);
		System.out.println("pid삭제아이디:"+pid+"t="+t);
		if (t==-1) {return true;}
		else{ return false;}
	}

	public boolean removeId2(String pid){
		//2차 아이디 삭제 임시보존 내용 까지 삭제
		int t=session.update("admin.deleteId2",pid);
		
		if (t==1) return true;
		else return false;
	}
}



