package t0619;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTagHandler extends TagSupport{
	
	@Override
	public int doStartTag() throws JspException {
		//화면에 출력할 내용
//		pageContext.getRequest();
//		pageContext.getResponse();
//		pageContext.getSession();
//		pageContext.getServletContext();
		JspWriter out = pageContext.getOut();
		try {
			for(int i=0 ;i<10;i++){
				if(i%2 == 1){
					out.print("<font size=6 color=red>안녕, 커스텀태그</font>");
				}else{
					out.print("<font size=6 color=blue>안녕, 커스텀태그</font>");
				}
				out.print("<br>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
}
