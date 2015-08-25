package t0609;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=euc-kr");
		PrintWriter out = resp.getWriter();
		
		out.write("<form method='post'>");
		out.write("<input type='text' name='su1'>");
		out.write("<select name='sel'>"
				+ "<option>+</option>"
				+ "<option>-</option>"
				+ "<option>*</option>"
				+ "<option>/</option>"
				+"</select>");
		out.write("<input type='text' name='su2'>");
		out.write("<input type='submit' value='계산'><br>");
		out.write("</form>");
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=euc-kr");
		int result = 0;
		int su1 = Integer.parseInt(req.getParameter("su1"));
		int su2 = Integer.parseInt(req.getParameter("su2"));
		String sel = req.getParameter("sel");
		
		Calculater cal = new Calculater(su1, su2, sel);
		
		doGet(req, resp);
		PrintWriter out = resp.getWriter();
		out.write("<hr>결과: "+ cal.getResultStr());
		
	}
}
