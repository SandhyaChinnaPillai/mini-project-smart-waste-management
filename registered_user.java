package minijava;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

@WebServlet("/registered_user")

public class registered_user extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
      
 if(request.getParameter("add_garbage") !=null)
{
	 try {
		  System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  PrintWriter out = response.getWriter();

	      Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
	      Statement stmt = conn.createStatement();   
	      String userid=(String)request.getSession().getAttribute("userid");
	      ResultSet rs;
	      request.setAttribute("message", userid);
	 out.println(userid);
	System.out.println(userid);
	
   
   // stmt.executeUpdate("update user_details set garbage_level ="+g+" where userid ='"+userid+"';");
    //System.out.println("incre");
   // request.setAttribute("message1", "garbage added succesfully");
 	request.getRequestDispatcher("registered_user.jsp").forward(request, response);
	
}
 catch(ClassNotFoundException e){
   e.printStackTrace();
 }
 catch(SQLException e) {
		   e.printStackTrace();
  }
}
 if(request.getParameter("personal_details") !=null)
	{   

	 //rs=stmt.executeQuery("select * from user_details where userid ='"+userid+"' ;");
		//boolean v1=rs.next();
		//System.out.println(v1);
		//String u=rs.getString("userid");System.out.print(u);
		//String n=rs.getString("name");System.out.print(n);
		//String p=rs.getString("pwd");System.out.print(p);
		//String l=rs.getString("locality");System.out.print(l);
		//String nu=rs.getString("number");System.out.print(nu);
		//int g=rs.getInt("garbage_level");System.out.print(g);
		//out.println("userid:'"+u +"' <br>password:'"+p+"' <br>password:'"+p+"'<br>name:'"+ n+"'<br>locality: '"+l+"'<br>waste_level: '"+g+"'");
		//out.println("password:'"+p+"'" );
		//out.println("name:'"+ n+"'");
		//out.println("locality: '"+l+"'");
		//out.println("number:'"+nu+"'");
		//out.println("waste_level: '"+g+"'");

	     request.setAttribute("message1", "showing");
	 	//out.println
		request.getRequestDispatcher("registered_user.jsp").forward(request, response);
		
		}
 if(request.getParameter("delete_acc")!=null)
 {
	 try {
		  System.out.println("entered try for delete_acc");
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  PrintWriter out = response.getWriter();

	      Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
	      Statement stmt = conn.createStatement();   
	      String userid=(String)request.getSession().getAttribute("userid");
	      ResultSet rs;
	      request.setAttribute("message", "ACCOUNT DELETED");
	 out.println("account deleted");
	System.out.println(userid);

	 stmt.executeUpdate("delete from user_details where userid='"+userid+"';");
	 stmt.executeUpdate("delete from login where userid='"+userid+"';");
	 //request=null;
	 
	 request.getRequestDispatcher("login.jsp").forward(request, response);
	 }
	 catch(ClassNotFoundException e){
	   e.printStackTrace();
	 }
	 catch(SQLException e) {
			   e.printStackTrace();
	  }
}
 
  	}
	
	
	
}
