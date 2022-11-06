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

import model.OperationsDaoImpl;


@WebServlet("/ClassSubjectServlet")
public class ClassSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String clas = request.getParameter("class");
		String subject = request.getParameter("subject");
				
		Connection con;
		int res = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver is loaded");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
			System.out.println("connection is establsihed");
			PreparedStatement pst = con.prepareStatement("insert into classsubject(classname,subjectname) values(?,?)");
			pst.setString(1, clas);
			pst.setString(2, subject);
			res = pst.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res == 1) {
			out.print("Subject assigned to Class successfully");
			RequestDispatcher rd = request.getRequestDispatcher("home.html");
			rd.include(request, response);
		}else {
			out.print("Subject failed to assigned to Class");
			RequestDispatcher rd = request.getRequestDispatcher("home.html");
			rd.include(request, response);
		}
	}

}
