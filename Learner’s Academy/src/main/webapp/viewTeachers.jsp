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
<title>Teacher Record</title>
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
<h2 align="center"><font><strong>Teacher Record</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Id</b></td>
<td><b>Teacher Name</b></td>
<td><b>Designation</b></td>
<td><b>Experience</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost/academy","root","kennaath");
statement=connection.createStatement();
String sql ="SELECT * FROM teachers order by id asc";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getInt("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("designation") %></td>
<td><%=resultSet.getInt("experience") %></td>


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