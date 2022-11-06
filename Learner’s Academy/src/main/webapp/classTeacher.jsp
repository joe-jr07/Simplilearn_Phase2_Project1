<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Teach to Cls</title>
</head>
<body>
	<h2>Assign Teacher to Classes</h2>
	<form action="ClassTeacherServlet">
		<label>Teacher name:</label>
		<select name="teacher">
			<option>Select teacher name</option>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
				Statement statement=connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from teachers");
				while(rs.next()){
					%>
					<option><%=rs.getString("name") %></option>
					<% 
					
				}
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				}
			%>
		</select>
		<br><br>
		<label>Class name:</label>
		<select name="class">
			<option>Select class</option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
			Statement statement1=connection1.createStatement();
			ResultSet rs2 = statement1.executeQuery("select * from classes");
			while(rs2.next()){
				%>
				<option><%=rs2.getString("classname") %></option>
				<% 
				
			}
			%>
			</select><br><br>
		<label>Subject name:</label>
		<select name="subject">
			<option>Select subject</option>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
			Statement statement=connection.createStatement();
			ResultSet rs1 = statement.executeQuery("select * from subjects");
			while(rs1.next()){
				%>
				<option><%=rs1.getString("name") %></option>
				<% 
				
			}
			%>
			
			
		</select><br><br>
		
			
		<input type="submit" value="assign">
	</form>
</body>
</html>