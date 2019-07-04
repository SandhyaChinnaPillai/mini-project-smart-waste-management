<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.SQLException"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>hey user</title>
<style> 
table, th, td{ 
    border: 1px solid black; 
} 
th, td { 
    padding: 20px; 
}
</style>
</head>
<body>
<form action="registered_user" method= "post" >
<p>HI : ${message}</p>
<p> ${message1}</p>

<input type="submit" value="add_garbage" name="add_garbage"  >
<input type="submit" value="View Personal Details" name="personal_details" >
<input type="submit" value="delete account" name="delete_acc">
<input type ="button" value="modify" name="modify" onClick="window.location.href='modify.jsp'">
<input type="button" value ="GO BACK" onClick="window.location.href='login.jsp'">
</form>
<%
if(request.getParameter("personal_details") !=null)
	{   
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
		Statement stmt = conn.createStatement();   
		String userid=(String)request.getSession().getAttribute("userid");
		ResultSet rs;
		request.setAttribute("message", userid);

		rs=stmt.executeQuery("select * from user_details where userid ='"+userid+"' ;");
		boolean v1=rs.next();
		System.out.println(v1);
		String u=rs.getString("userid");//System.out.print(u);
		String n=rs.getString("name");//System.out.print(n);
		String p=rs.getString("pwd");//System.out.print(p);
		String l=rs.getString("locality");//System.out.print(l);
		String nu=rs.getString("number");//System.out.print(nu);
		int g=rs.getInt("garbage_level");//System.out.print(g);
		%>
		<table style="width:50%">
		<tr><th>userid</th><th>password</th><th>name</th><th>locality</th><th>number</th><th>waste_level</th></tr>
		<tr><td><%=u%></td><td><%=p %></td><td><%=n%></td><td><%=l%></td><td><%=nu %></td><td><%=g %></td></tr>
		</table>
<%
	     request.setAttribute("message1", "showing");
	 	//out.println
	//request.getRequestDispatcher("registered_user.jsp").include(request, response);
		
	}catch(ClassNotFoundException e){
		   e.printStackTrace();
		  }
		  catch(SQLException e) {
		   e.printStackTrace();
		  }
		}
if(request.getParameter("add_garbage") !=null)
{	try{
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
	Statement stmt = conn.createStatement();   
	String userid=(String)request.getSession().getAttribute("userid");
	ResultSet rs;
	request.setAttribute("message", userid);

	//out.println("helo");
	System.out.println(userid);
	System.out.println("in jsp");
	
	   String query1 = "select garbage_level from user_details where userid ='"+userid+"';";
      rs= stmt.executeQuery(query1);
     boolean v1=rs.next();
    int g= rs.getInt("garbage_level");
     g=g+1;
    stmt.executeUpdate("update user_details set garbage_level ="+g+" where userid ='"+userid+"';");
     System.out.println("incre");
     //request.setAttribute("message1", "garbage added succesfully in jsp");
     %> 
     GARBAGE ADDED SUCCESFULLY<br>
<%
 	
}
catch(ClassNotFoundException e){
	   e.printStackTrace();
	  }
	  catch(SQLException e) {
	   e.printStackTrace();
	  }
}
 %>

</body>
</html>