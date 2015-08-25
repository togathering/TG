package t0605;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NameServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=euc-kr");
		
		
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		PrintWriter out = resp.getWriter();
		
		out.write("폼에서 전달받은 이름: "+ name);
		out.write("폼에서 전달받은 비번: "+ pass);
	}
}
