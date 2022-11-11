<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Record</title>
<style>
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
	.heading{
		color: #000;
		font-size: 18px;
		font-family: sans-serif;
		text-transform: uppercase;
	}
	.sub{
		color: #3C4048;
		font-size: 14px;
		font-family: sans-serif;
	}
	a:link{
		font-size: 18px;
		font-family: sans-serif;
		color: #1098ad;
		display: block;
		background-color: #f7f7f7;
		margin: 20px auto;
		padding: 20px; 
		text-align: center;
		width: 100px;
	}
	a:link,a:visited{
		color: #1098ad;
		text-decoration: none;
		
	}
	a:hover,a:active{
		color: orangered;
		font-weight: bold;
		text-decoration: underline orangered; 
	}
	
</style>
</head>
<body>
	<% 	
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="container">
<h1 align="center"><font><strong>Student Record</strong></font></h1>
<table align="center" cellpadding="20" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A" class="heading">
<td><b>Id</b></td>
<td><b>Student Name</b></td>
<td><b>Age</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
statement=connection.createStatement();
String sql ="SELECT * FROM students order by id asc";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887" class="sub">

<td><%=resultSet.getInt("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getInt("age") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
<a href="home.html">Go Back</a>
</div>
</body>
</html>