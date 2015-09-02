package com.tg.validity.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println("받아온 쪽지제목 : "+noteBean.getNoteTitle());
		// DB에서 금지어 리스트 조회	
		List<String> banList = valDao.selectBans(); 
				
		// 받아온 내용
		String noteTitle = noteBean.getNoteTitle();
		String noteContent = noteBean.getNoteContent();	
		
		// 신호키 설정
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(noteTitle.contains(banList.get(i)) || noteContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	
		return flag;
	}//banCheck
	
	
	// 그룹만들기 금지 단어 체크
	@RequestMapping("/gxCreatebanCheck")
	@ResponseBody	
	public String banCheckforGxCreate(NoteBean noteBean){

		// DB에서 금지어 리스트 조회	
		List<String> banList = valDao.selectBans(); 
		System.out.println("금지어거르는 메소드는 실행");		
		// 받아온 내용
		String noteTitle = noteBean.getNoteTitle();
		String noteContent = noteBean.getNoteContent();	
		
		System.out.println("모임명은 "+noteTitle);
		System.out.println("모임소개는 "+noteContent);
		
		// 신호키 설정
		String flag = "ok";
		for (int i = 0; i < banList.size(); i++) {
			if(noteTitle.contains(banList.get(i)) || noteContent.contains(banList.get(i))){
				flag = banList.get(i);
				break;
			}
		}	System.out.println("flag는 "+flag);
		return flag;
	}//banCheck
}
