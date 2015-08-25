package guest.control;

import guest.model.GuestDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

public class GuestController extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		String action = request.getParameter("action");
		
		if(action == null || action.equals("list")){
			String pageStr = request.getParameter("page");
			int page=1;//기본페이지로 첫페이지
			
			if(pageStr!=null)//원하는 페이지에 대한 정보를 얻었을때
			  page= Integer.parseInt(pageStr);//page: 1,2,3
			
			int maxRecord = 5;
			int end = page*maxRecord;
			int start= end-(maxRecord-1);
			
			GuestDAO dao = new GuestDAO();
			ArrayList<GuestBean> list = dao.findPage(start,end);
			
			int totalRecord = dao.findCnt();
			int totalPage = totalRecord/maxRecord;
			if(totalRecord%maxRecord != 0)totalPage++;
			request.setAttribute("total", totalPage);
			
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("guest/guest_list.jsp?page="+page);
			dispatcher.forward(request, response);
						
		}else if(action.equals("input")){
			RequestDispatcher dispatcher = request.getRequestDispatcher("guest/guest_input.jsp");
			dispatcher.forward(request, response);
			
		}else if(action.equals("update")){
			GuestDAO dao = new GuestDAO();
			GuestBean gb = dao.find(Integer.parseInt(request.getParameter("id")));
			request.getSession().setAttribute("gb", gb);
			RequestDispatcher dispatcher = request.getRequestDispatcher("guest/guest_update.jsp");
			dispatcher.forward(request, response);
			
		}else if(action.equals("addCon")){
			GuestDAO dao = new GuestDAO();
			GuestBean gb = new GuestBean();
			gb.setName(request.getParameter("name"));
			gb.setPass(request.getParameter("pass"));
			gb.setEmail(request.getParameter("email"));
			gb.setTel(request.getParameter("tel"));
			gb.setContents(request.getParameter("contents"));
			
			dao.addCon(gb);
			
			response.sendRedirect("guest?action=list"); //== response.sendRedirect("guest")
			
		}else if(action.equals("upCon")){
			GuestDAO dao = new GuestDAO();
			GuestBean gb = new GuestBean();
			gb.setId(Integer.parseInt(request.getParameter("id")));
			gb.setName(request.getParameter("name"));
			gb.setPass(request.getParameter("pass"));
			gb.setEmail(request.getParameter("email"));
			gb.setTel(request.getParameter("tel"));
			gb.setContents(request.getParameter("contents"));
			
			dao.upCon(gb);
			
			response.sendRedirect("guest?action=list"); //== response.sendRedirect("guest")
			
		}else if(action.equals("delCon")){
			GuestDAO dao = new GuestDAO();
			dao.delCon(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("guest?action=list"); //== response.sendRedirect("guest")
		}else if(action.equals("check")){
			RequestDispatcher dispatcher = request.getRequestDispatcher("guest/check_pass.jsp");
			dispatcher.forward(request, response);
		}
	}
	
}
