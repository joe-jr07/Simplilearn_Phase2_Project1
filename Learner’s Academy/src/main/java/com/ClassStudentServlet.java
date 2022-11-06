package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ClassStudentServlet")
public class ClassStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String clas = request.getParameter("class");
		String student = request.getParameter("student");
				
		Connection con;
		int res = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver is loaded");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
			System.out.println("connection is established");
			PreparedStatement pst = con.prepareStatement("insert into classstudent(classname,studentname) values(?,?)");
			pst.setString(1, clas);
			pst.setString(2, student);
			res = pst.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res == 1) {
			out.print("Student assigned to Class successfully");
			RequestDispatcher rd = request.getRequestDispatcher("home.html");
			rd.include(request, response);
		}else {
			out.print("Student failed to assigned to Class");
			RequestDispatcher rd = request.getRequestDispatcher("home.html");
			rd.include(request, response);
		}
	}

}
