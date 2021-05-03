package com.Exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex011")
public class member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwcheck = request.getParameter("pwcheck");
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		String birth = request.getParameter("birth");
		String []hobby = request.getParameterValues("hobby");
		String color = request.getParameter("color");		
		String text = request.getParameter("text");	
		
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		
		out.println(id);
		out.println(pw);
		out.println(pwcheck);
		out.println(gender);
		out.println(blood);
		out.println(birth);
		for ( int i = 0; i<hobby.length; i++) {
			out.println(hobby[i]);
		}
	
		out.println(color);
		out.println(text);
		out.print("</html>");
	}

}
