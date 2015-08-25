package t0626;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/jstl")
public class JSTLServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Person p = new Person(1,"����ȣ",13,"�л�");
		request.setAttribute("per", p);
		
		
		List<Person> list = new ArrayList<Person>();
		list.add(p);
		list.add(new Person(2,"����",13,"������"));
		list.add(new Person(3,"������",14,"ȣī��"));
		list.add(new Person(4,"����",15,"�μ���"));
		request.setAttribute("list", list);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("driver", "OracleDriver");
		map.put("name", "�ŵ�");
		map.put("passward", "1234");
		request.setAttribute("map", map);	
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("0626/jstl_test.jsp?b=rain");
		dispatcher.forward(request, response);
		
	}
}
