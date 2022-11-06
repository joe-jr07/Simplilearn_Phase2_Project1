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
import model.Student;
import model.Teacher;


@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String studentname = request.getParameter("studentname");
		int age = Integer.parseInt(request.getParameter("age"));
		
		Student student = new Student(0,studentname,age);
		
		OperationsDaoImpl operationsDaoImpl = new OperationsDaoImpl();
		try {
			operationsDaoImpl.initDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int res;
		res = operationsDaoImpl.addStudent(student);
		if(res == 1) {
			out.print("Student details was successfully added");
			RequestDispatcher rd = request.getRequestDispatcher("addStudents.html");
			rd.include(request, response);
		}else {
			out.print("Student details failed to be added");
			RequestDispatcher rd = request.getRequestDispatcher("addStudents.html");
			rd.include(request, response);
		}
	}

}
