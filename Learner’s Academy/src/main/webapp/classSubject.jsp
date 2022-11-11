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
<style>
	*{
		margin: 0;
		padding: 0;
	}
	h1{
		font-size: 26px;
		font-family: sans-serif;
		text-transform: uppercase;
		font-style: italic;
		color: #1098ad;
		background-color: #f7f7f7;
		text-align: center;
		padding: 20px;
		margin-bottom: 100px;
		
	}
	.container{
		width: 700px;
		margin: 0 auto;
	}
	form{
		background-color: #f7f7f7;
		border-top: 5px solid #1098ad;
		border-bottom: 5px solid #1098ad;
		width: 350px;
		padding: 50px;
		margin: 0 auto;
	}
	label{
		font-size: 18px;
		font-family: sans-serif;
		color: #444;	
	}
	select{
		padding: 5px;	
	}
	.button{
		background-color: black;
		border: none;
		color: white;
		font-size: 16px;
		text-transform: uppercase;
		cursor: pointer;
		border: 3px solid white;
		padding: 15px;
		width: 100%;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<div class="container">
	<h1>Assign Subject to Classes</h1>
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
		<input type="submit" value="assign" class="button">
	</form>
	</div>
</body>
</html>