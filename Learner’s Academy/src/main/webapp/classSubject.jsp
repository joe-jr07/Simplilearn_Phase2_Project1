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
<title>Assign Sub to Cls</title>
</head>
<body>
	<h2>Assign Subject to Classes</h2>
	<form action="ClassSubjectServlet">
		<label>Class name:</label>
		<select name="class">
			<option>Select Class</option>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
				Statement statement=connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from classes");
				while(rs.next()){
					%>
					<option><%=rs.getString("classname") %></option>
					<% 
					
				}
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				}
			%>
		</select>
		<br><br>
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