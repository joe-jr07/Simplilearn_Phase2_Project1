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



@WebServlet("/AddClassServlet")
public class AddClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		Classes classes = new Classes(0,request.getParameter("classname"));
		
		OperationsDaoImpl operationsDaoImpl = new OperationsDaoImpl();
		try {
			operationsDaoImpl.initDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int res;
		res = operationsDaoImpl.addClasses(classes);
		if(res == 1) {
			out.print("Class name was successfully added");
			RequestDispatcher rd = request.getRequestDispatcher("addClasses.html");
			rd.include(request, response);
		}else {
			out.print("Class name failed to be added");
			RequestDispatcher rd = request.getRequestDispatcher("addClasses.html");
			rd.include(request, response);
		}
		
	}

}
