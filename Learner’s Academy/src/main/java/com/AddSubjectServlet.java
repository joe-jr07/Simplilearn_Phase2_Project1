package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Classes;
import model.OperationsDaoImpl;
import model.Subject;


@WebServlet("/AddSubjectServlet")
public class AddSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		Subject subject = new Subject(0,request.getParameter("subjectname"));
		
		OperationsDaoImpl operationsDaoImpl = new OperationsDaoImpl();
		try {
			operationsDaoImpl.initDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int res;
		res = operationsDaoImpl.addSubject(subject);
		if(res == 1) {
			out.print("Subject name was successfully added");
			RequestDispatcher rd = request.getRequestDispatcher("addSubjects.html");
			rd.include(request, response);
		}else {
			out.print("Subject name failed to be added");
			RequestDispatcher rd = request.getRequestDispatcher("addSubjects.html");
			rd.include(request, response);
		}
	}

}
