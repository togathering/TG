package t0604;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		// 초기화 작업, 브라우저 서비스 전에 선행작업, 가장먼저 한번 호출
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 브라우저 서비스메소드
		
		resp.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = resp.getWriter();
		out.write("<html><head><title>서블릿테스트</title></head>");
		out.write("<body><center><font color=blue size=10>Hello, Servlet~~!!");
		out.write("</font><center></body></html>");
	}
	
	@Override
	public void destroy() {
		// 서블릿 종료 직전에 호출되는 메소드
	}

}
