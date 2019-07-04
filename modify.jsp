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
<title>Insert title here</title>
</head>
<body>
<%
try {
		 // System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
         con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
    stmt=con.createStatement();
    String userid=(String)request.getSession().getAttribute("userid");
	
		rs=		 stmt.executeQuery("select * from user_details where userid='"+userid+"';");
				 rs.next();
%>				 
<form method="post" action="modify">
NAME:<input id="name" name="name"type="text" value=<%=rs.getString("name") %>><br>
USERID:<input id="userid" name="userid"type="text" value=<%=rs.getString("userid") %> readonly><br>
PASSWORD:<input id= "pwd" name="password" type ="text" value=<%=rs.getString("pwd") %>><br>
LOCALITY:<input id="locality" name="locality" type="text" value=<%=rs.getString("locality") %>><br>
NUMBER:<input id="number" name="number" type="text" value=<%=rs.getString("number") %>><br>

	<%	
//		}

}
catch(ClassNotFoundException e){
	   e.printStackTrace();
	  }
	  catch(SQLException e) {
	   e.printStackTrace();
	  }

%>

<input type="submit" value="modify_record" name="modify_record">
<input type="button" value ="GO BACK" onClick="window.location.href='registered_user.jsp'">

</form>
<%
if(request.getParameter("modify_record")!=null)
{String userid=(String)request.getSession().getAttribute("userid");

	try {
		 // System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
   stmt=con.createStatement();
				 stmt.executeUpdate("update user_details set name='"+request.getParameter("name")+"' where userid ='"+userid+"';");
				 stmt.executeUpdate("update user_details set pwd='"+request.getParameter("password")+"'where userid ='"+userid+"';");
				 stmt.executeUpdate("update user_details set locality='"+request.getParameter("locality")+"'where userid ='"+userid+"';");
				 stmt.executeUpdate("update user_details set number='"+request.getParameter("number")+"'where userid ='"+userid+"';");
				 stmt.executeUpdate("update login set pwd='"+request.getParameter("password")+"'where userid ='"+userid+"';");
		%> <p> MODIFIED RECORD </p> <%
	}catch(ClassNotFoundException e){
		   e.printStackTrace();
		  }
		  catch(SQLException e) {
		   e.printStackTrace();
		  }

	
}

%>
</body>
</html>