<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<script type="text/javascript">
function alertName(){
alert("Garbage Collector please login, you have waste to collect");
} 
</script>

<%
try {
		 // System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
         con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
    stmt=con.createStatement();
		rs=		 stmt.executeQuery("select * from user_details where garbage_level>2 ;");
				 boolean v=rs.next();
				 if(v)
				 {
				%><script type="text/javascript"> window.onload = alertName; </script>	
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

 <h1>Login to Waste Management System</h1>
 <p> ${message }</p>
 <div align="center">
  <form action="login" method="post">
  Username: <input type="text" name="userid" required="required"><br>
  Password: <input type="password" name="password" required="required"><br>
  <input type="submit" value="Login"><br>
 <input type="button" value ="REGISTER" onclick="window.location.href='register.jsp'">
  </form>
 </div>
</body>
</html>