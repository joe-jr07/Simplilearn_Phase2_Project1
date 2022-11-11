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
<title>Backend Class Report</title>
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
	#table1{
		margin-bottom: 50px;
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
<h1 align="center"><font><strong>Backend Class Records</strong></font></h1>
<table align="center" cellpadding="20" cellspacing="5" border="1" id="table1">
<tr>

</tr>
<tr bgcolor="#f7f7f7" class="heading">
<td><b>Teachers</b></td>
<td><b>Subjects</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
statement=connection.createStatement();
String sql ="SELECT * FROM classteacher where classname = 'Backend'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#f7f7f7" class="sub">

<td><%=resultSet.getString("teachername") %></td>
<td><%=resultSet.getString("subjectname") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<table align="center" cellpadding="20" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#f7f7f7" class="heading">
<td><b>Students</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
statement=connection.createStatement();
String sql ="SELECT * FROM classstudent where classname = 'Backend'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#f7f7f7" class="sub">

<td><%=resultSet.getString("studentname") %></td>


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