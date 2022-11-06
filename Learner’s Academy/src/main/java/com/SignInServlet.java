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

import model.User;
import model.UserDAOImpl;



@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		User user = new User(0, request.getParameter("username"), request.getParameter("password"));
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		
		try {
			UserDAOImpl.initDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		boolean res = userDAOImpl.signIn(user);
		
		if(res) {
			out.println("<h2>Sign In Successfull !</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("home.html");
			rd.forward(request, response);
		}
		
		else {
			out.println("<h2>Credentials did not match</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("welcome.html");
			rd.include(request, response);
		}
	}

}
