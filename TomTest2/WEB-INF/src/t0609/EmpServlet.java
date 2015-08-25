package t0609;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/emp")
public class EmpServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=euc-kr");
		
		ServletContext sc = getServletContext();
		String path = sc.getRealPath("");

		EmpDAO dao = new EmpDAO(path);
		ArrayList<HashMap<String, Object>> list= dao.select();
		PrintWriter out = resp.getWriter();
		
		out.write("<table border = 1>");
		out.write("<tr><td>번호</td><td>이름</td><td>급여</td><td>입사날짜</td><td>부서</td></tr>");
		for (int i=0;i<list.size();i++){
			out.write("<tr>");
			out.write("<td>"+list.get(i).get("empno")+"</td>");
			out.write("<td>"+list.get(i).get("ename")+"</td>");
			out.write("<td>"+list.get(i).get("sal")+"</td>");
			out.write("<td>"+list.get(i).get("hiredate")+"</td>");
			out.write("<td>"+list.get(i).get("dname")+"</td>");
			out.write("</tr>");
		}
		out.write("</table>");
		
	}
}
