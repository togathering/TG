package com.tg.common.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tg.common.beans.GroupBean;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.MemberBean;
import com.tg.iba.MySqlMapConfig;

public class AdminDAO {
	SqlMapClient smc;
	HttpServletRequest request;
	
	int startNum =0; //���ۼ���
	int countNum= 10; // ���������� ������ ���� 
	
	
	public AdminDAO() {
		smc = MySqlMapConfig.getSqlMapInstance();
	}
	
	public boolean loginCheck(String id, String pass){
		
		try{
		// ���� ���� ���� 
		request.getSession().removeAttribute("id");
		request.getSession().removeAttribute("pass");
		request.getSession().removeAttribute("nick"); 
		}catch(NullPointerException e){
			e.getStackTrace();
		}
			try {
				System.out.println("id&pass="+id+"&"+pass);
				
				if(pass.equals(((String)smc.queryForObject("admin.login",id)))){
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}

		
	//���̵� ��õ
	public List<String> suggestId(String keyword){
		List<String> list = null;
		try {
			list = smc.queryForList("admin.suggestMember", "%"+keyword+"%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<GroupBean> AdminSearchTitle(String gtitle){
		List<GroupBean> list = null;
		gtitle="%"+gtitle+"%";
		System.out.println("dao"+gtitle);

		try {
			list=smc.queryForList("group.MsearchTitle",gtitle);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	//����Ʈ �ѷ��ֱ� 
	public List<MemberBean> selectAll(int num){
		List<MemberBean> list = null;
		
		System.out.println(num);
		
		try {
			startNum= (num*10)+1;
			list = smc.queryForList("admin.selectAll",null ,startNum, countNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//ȸ���� count
	public int countAll(){
		int memberNum=0;
		try {
			memberNum=(int)smc.queryForObject("admin.countAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberNum;
	}

	
	//Ư�� ȸ�� �˻�
	public List<MemberBean> selectId(int num,  String id){
		List<MemberBean> list = null;
		String searchId = "%"+id+"%";
		
		try {
			
			startNum= (num*10)+1;
			System.out.println(searchId);
			list = smc.queryForList("admin.selectAll",searchId ,startNum, countNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
		
	//Ư�� �˻��� ���� ȸ�� �˻�
	public int countId(String id){
		int countId = 0;
		try {
			countId = (int) smc.queryForObject("admin.countSpecificId", "id");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return countId;
	}

}