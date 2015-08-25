package t0608;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CountServlet extends HttpServlet{
	
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ServletContext sc = getServletContext(); // WebContext 정보 얻어오기
		String path = sc.getRealPath("");
		System.out.println(path);
		
		DAO d = new DAO(path);
		int cnt = d.select();
		resp.setContentType("text/html;charset=euc-kr");
		
		HttpSession session = req.getSession();
		if(session.isNew())cnt++;//처음접속(session)하는 사람에게만 더하기 수행
		
		PrintWriter out = resp.getWriter();
		out.print("조회수: "+ cnt);
		
		d.update(cnt);
	}
	
	
}
