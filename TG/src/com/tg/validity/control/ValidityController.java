package com.tg.validity.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tg.common.beans.NoteBean;
import com.tg.common.dao.ValidityDAO;

@Controller
public class ValidityController {
	
	@Autowired
	ValidityDAO valDao;
	
	@RequestMapping("/banCheck")
	@ResponseBody
	public String banCheck(NoteBean noteBean){
		System.out.println("�޾ƿ� �������� : "+noteBean.getNoteTitle());
		// DB���� ������ ����Ʈ ��ȸ	
		List<String> banList = valDao.selectBans(); 
				
		// �޾ƿ� ����
		String noteTitle = noteBean.getNoteTitle();
		String noteContent = noteBean.getNoteContent();	
		
		// ��ȣŰ ����
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(noteTitle.contains(banList.get(i)) || noteContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	
		return flag;
	}//banCheck
	
	
	// �׷츸��� ���� �ܾ� üũ
	@RequestMapping("/banCheckforGxCreate")
	@ResponseBody	
	public String banCheckforGxCreate(NoteBean noteBean){

		// DB���� ������ ����Ʈ ��ȸ	
		List<String> banList = valDao.selectBans(); 
				
		// �޾ƿ� ����
		String noteTitle = noteBean.getNoteTitle();
		String noteContent = noteBean.getNoteContent();	
		
		// ��ȣŰ ����
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(noteTitle.contains(banList.get(i)) || noteContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	
		return flag;
	}//banCheck
}
