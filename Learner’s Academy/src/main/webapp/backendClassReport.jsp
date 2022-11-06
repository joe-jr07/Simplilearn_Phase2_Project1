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
	a{

text-align: center;

display: block;

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
<h2 align="center"><font><strong>Backend Class Records</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
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
<tr bgcolor="#DEB887">

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
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
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
<tr bgcolor="#DEB887">

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
</body>
</html>