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
		// �ʱ�ȭ �۾�, ������ ���� ���� �����۾�, ������� �ѹ� ȣ��
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// ������ ���񽺸޼ҵ�
		
		resp.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = resp.getWriter();
		out.write("<html><head><title>�����׽�Ʈ</title></head>");
		out.write("<body><center><font color=blue size=10>Hello, Servlet~~!!");
		out.write("</font><center></body></html>");
	}
	
	@Override
	public void destroy() {
		// ���� ���� ������ ȣ��Ǵ� �޼ҵ�
	}

}
