package com.tg.recommend.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tg.common.beans.GroupBean;
import com.tg.common.beans.GroupPreferenceBean;
import com.tg.common.dao.CategoryDAO;
import com.tg.common.dao.GroupDAO;
import com.tg.common.dao.GroupPreferenceDAO;
import com.tg.common.dao.MemberDAO;
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
	@Autowired
	GroupDAO gdao;
	@Autowired
	MemberDAO mdao;
	
	
	@RequestMapping("/recommend")
	public String recommend(HttpSession session, Model model){
		
		String id = (String) session.getAttribute("id");
		
		String userPro = updao.selectTopProvince(id);
		int userRatio = updao.selectRatioSum(id);
		String userCategory = updao.selectTopCategory(id);
		
		String user_province_no = prodao.selectNo(userPro);
		String user_category_no = cdao.selectNo(userCategory);
		
		List<GroupPreferenceBean> list = gpdao.selectAll();
		List<HashMap<String, Integer>> point = new ArrayList<HashMap<String, Integer>>();
		for(int i=0;i<list.size();i++){
			String groupPro = list.get(i).getProvince_name();
			int groupRatio = list.get(i).getRatio(); //성비
			String groupCategory = list.get(i).getCategory_name();
			int gno = list.get(i).getGno();
			
			String group_province_no = prodao.selectNo(groupPro); //지역의 번호
			String group_category_no = cdao.selectNo(groupCategory); //카테고리의 번호
		
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
			
			loc = loc * 10;
			cat = cat * 7;
			
			
			if(loc<1){
				loc = 100;
			}else if(loc<2){
				loc = 80;
			}else if(loc<3){
				loc = 60;
			}else if(loc<4){
				loc = 40;
			}else if(loc<5){
				loc = 20;
			}else {
				loc = 0;
			}
			
			if(cat<1){
				cat = 100;
			}else if(cat<2){
				cat = 66;
			}else if(cat<3){
				cat = 33;
			}else {
				cat = 0;
			}
			
			if(rat<2){
				rat = 100;
			}else if(rat<4){
				rat = 80;
			}else if(rat<6){
				rat = 60;
			}else if(rat<8){
				rat = 40;
			}else if(rat<10){
				rat = 20;
			}else{
				rat = 0;
			}
			
			loc = loc*50/100;
			cat = cat*30/100;
			rat = rat*20/100;
			
			int sum = loc+cat+rat;
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("gno", gno);
			map.put("sum", sum);
			
			point.add(map);
		}
		
		for(int i = 0;i<point.size();i++){
			
			for(int j = i+1;j<point.size();j++){
				if(point.get(i).get("sum")<point.get(j).get("sum")){
					HashMap<String, Integer> temp = point.get(i);
					point.set(i, point.get(j));
					point.set(j, temp);
				}
				
			}
		}
		
		List<GroupBean> recomlist = new ArrayList<GroupBean>();
		for(int idx=0;idx<3;idx++){
			System.out.println("상위"+(idx+1)+"번그룹 :"+point.get(idx).get("gno")+" 점수:"+point.get(idx).get("sum"));
			recomlist.add(gdao.recommend(point.get(idx).get("gno")));
			
		}
		model.addAttribute("recommendList", recomlist);
		
		return "user/main/recommend";
	}
}
