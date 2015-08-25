package t0605;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//resp.setContentType("text/html; charset=euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		PrintWriter out = resp.getWriter();
		out.write("<html><head><title>¾È³çÅ×½ºÆ®</title></head>");
		
		for(int i=0;i<10;i++){
			if(i%2 == 0){
				out.write("<body><font size=10 color = blue>¾È³ç~</font><br>");
			} else {
				out.write("<body><font size=10 color = red>¾È³ç~</font><br>");
			}
		}
		out.write("</body></html>");
	}
}
