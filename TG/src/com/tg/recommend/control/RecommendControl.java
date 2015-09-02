package com.tg.recommend.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tg.common.beans.GroupPreferenceBean;
import com.tg.common.beans.UserPreferenceBean;
import com.tg.common.dao.CategoryDAO;
import com.tg.common.dao.GroupPreferenceDAO;
import com.tg.common.dao.ProvinceDAO;
import com.tg.common.dao.UserPreferenceDAO;

@Controller
public class RecommendControl {
	@Autowired
	GroupPreferenceDAO gpdao;
	@Autowired
	UserPreferenceDAO updao;
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProvinceDAO prodao;
	
	
	@RequestMapping("/recommend")
	public String recommend(@RequestParam(value="gno")Integer gno, HttpSession session){
		
		String id = (String) session.getAttribute("id");
		
		UserPreferenceBean upbean = updao.select(id);
		String userPro = upbean.getProvince_name();
		int userRatio = upbean.getRatio();
		String userCategory = upbean.getCategory_name();
		
		String user_province_no = prodao.selectNo(userPro);
		String user_category_no = cdao.selectNo(userCategory);
		
		System.out.println("유저:"+user_province_no);
		System.out.println("유저:"+user_category_no);
		System.out.println("유저:"+userRatio);
		
		List<GroupPreferenceBean> list = gpdao.selectAll();
		List<Integer> point = new ArrayList<Integer>();
		for(int i=0;i<list.size();i++){
			String groupPro = list.get(i).getProvince_name();
			int groupRatio = list.get(i).getRatio(); //성비
			String groupCategory = list.get(i).getCategory_name();
			
			String group_province_no = prodao.selectNo(groupPro); //지역의 번호
			String group_category_no = cdao.selectNo(groupCategory); //카테고리의 번호
			
			System.out.println(i+1+"그룹:"+group_province_no);
			System.out.println(i+1+"그룹:"+group_category_no);
			System.out.println(i+1+"그룹:"+groupRatio);
		
		
			int loc = 0;
			int cat = 0;
			int rat = Math.abs(groupRatio - userRatio);
			for(int j=0;j<2;j++){
				
				int t = Math.abs(group_province_no.charAt(j) - user_province_no.charAt(j));
				loc += t;
				
			}
			
			for(int j=0;j<3;j++){
				int t = Math.abs(group_category_no.charAt(j) - user_category_no.charAt(j));
				cat += t;
			}
			
			if(loc<2){
				loc = 100;
			}else if(loc<4){
				loc = 70;
			}else{
				loc = 40;
			}
			
			if(cat<1){
				cat = 100;
			}else if(cat<3){
				cat = 70;
			}else {
				cat = 40;
			}
			
			if(rat<2){
				rat = 100;
			}else if(rat<4){
				rat = 70;
			}else{
				rat = 40;
			}
			
			
			System.out.println((i+1)+"번 지역점수:"+loc);
			System.out.println((i+1)+"번 성향점수:"+cat);
			System.out.println((i+1)+"번 성비점수:"+rat);
			
			int avg = (loc+cat+rat)/3;
			
			point.add(avg);
		}
		
		for(int i = 0;i<point.size();i++){
			System.out.println((i+1)+"번그룹 평균점수"+point.get(i));
		}
		return "";
	}
}
