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

import model.OperationsDaoImpl;
import model.Teacher;


@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String teachername = request.getParameter("teachername");
		String designation = request.getParameter("designation");
		int experience = Integer.parseInt(request.getParameter("experience"));
		
		Teacher teacher = new Teacher(0,teachername,designation,experience);
		
		OperationsDaoImpl operationsDaoImpl = new OperationsDaoImpl();
		try {
			operationsDaoImpl.initDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int res;
		res = operationsDaoImpl.addTeacher(teacher);
		if(res == 1) {
			out.print("Teacher details was successfully added");
			RequestDispatcher rd = request.getRequestDispatcher("addTeachers.html");
			rd.include(request, response);
		}else {
			out.print("Teacher details failed to be added");
			RequestDispatcher rd = request.getRequestDispatcher("addTeachers.html");
			rd.include(request, response);
		}
	}

}
