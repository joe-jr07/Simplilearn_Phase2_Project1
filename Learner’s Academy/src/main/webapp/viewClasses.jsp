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
<title>Class Record</title>
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
<h2 align="center"><font><strong>Class Records</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>classname</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
statement=connection.createStatement();
String sql ="SELECT * FROM classes order by id asc";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("classname") %></td>


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