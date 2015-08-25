package com.tg.common.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.tg.common.beans.NoteBean;
import com.tg.iba.MySqlMapConfig;

public class NoteDAO {
	
	@Autowired
	SqlSession session;
	
	public NoteDAO() {

	}

	public List<NoteBean> selectNote(String receiverId){
		List<NoteBean> list = session.selectList("note.select", receiverId);
		return list;
	}

	
	public boolean insertNote(NoteBean bean){
		try {
			smc.insert("note.insert", bean);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}

	
	public NoteBean detailNote(int noteNo){
		NoteBean bean = null; 
		try {
			bean = (NoteBean) smc.queryForObject("note.spec", noteNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return bean;
	}

}
