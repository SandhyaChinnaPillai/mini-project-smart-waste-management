<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.SQLException"%>   

<%
ResultSet rs=null;
Statement stmt=null;
Connection con;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waste_Collector</title>
<style> 
table, th, td { 
    border: 1px solid black; 
} 
th, td { 
    padding: 20px; 
}
<%
try {
		 // System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
         con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
    stmt=con.createStatement();
		rs=		 stmt.executeQuery("select * from user_details where garbage_level > 2 ;");
		while(rs.next())
		{%>
		
tr#<%=rs.getString("userid")%> 

{ background-color:red;}		
		
		<%	
		}

}
catch(ClassNotFoundException e){
	   e.printStackTrace();
	  }
	  catch(SQLException e) {
	   e.printStackTrace();
	  }

%>
</style> 

</head>
<body>

<H1>residents details</H1>
<table style="width:100%">
<tr>
<th>NAME</th>
<th>NUMBER</th>
<th>LOCALITY</th>
<th>WASTE_QTY</th>
</tr>
<%
try {
		 // System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
         con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
    stmt=con.createStatement();
		rs=		 stmt.executeQuery("select * from user_details ;");
		while(rs.next())
		{
			%>
		<tr id =<%= rs.getString("userid")%>>

<td ><%=rs.getString("name") %></td>
<td><%=rs.getString("number") %></td>
<td><%=rs.getString("locality") %></td>
<td><%=rs.getString("garbage_level") %></td>

</tr>
		
		<%	
		}

}
catch(ClassNotFoundException e){
	   e.printStackTrace();
	  }
	  catch(SQLException e) {
	   e.printStackTrace();
	  }

%>

</table>
<p> ${message}</p>
<form action="clear_waste" method="post">
<input type="submit" value ="Clear waste of those marked in red">
<input type="button" value ="LOGOUT" onClick="window.location.href='login.jsp'">
</form>
</body>

</html>