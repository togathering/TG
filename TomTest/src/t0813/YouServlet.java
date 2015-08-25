package t0813;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YouServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=euc-kr");
		PrintWriter out = resp.getWriter();
		//out.print("HTML코드");
		ServletConfig config = getServletConfig();
		String name = config.getInitParameter("name1");
		ServletContext context = getServletContext();
		String name1 = context.getInitParameter("name1");
		out.print("[You]hello, "+name1);
		out.print("<br>책정보: "+ context.getAttribute("book"));
	}
}
