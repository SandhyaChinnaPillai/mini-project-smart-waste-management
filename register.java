package minijava;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public register()
	{}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 String userid = (String)request.getParameter("userid");
		 System.out.println(userid);
         String password =(String) request.getParameter("password");
         String name=(String)request.getParameter("name");
         String locality=(String)request.getParameter("locality");
         String number=(String)request.getParameter("number");
         response.setContentType("text/html");
         try {
   		 // System.out.println("entered try");
   		  Class.forName("com.mysql.cj.jdbc.Driver");
             Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
             Statement stmt1 = conn.createStatement();
             Statement stmt2 = conn.createStatement();
            ResultSet rs;
             rs=stmt1.executeQuery("select * from user_details where userid ='"+userid+"' ;");
             boolean v1=rs.next();
             if(!v1) {
             stmt1.executeUpdate("insert into login values('"+ userid +"','"+ password+"');");
             System.out.println("entered try1");
             stmt2.executeUpdate("insert into user_details values('"+ name +"','"+ userid +"','"+ password +"','"+ locality +"','"+ number +"',0);");
             System.out.println("entered try2");
             //stmt2.executeUpdate("insert into user_details values('"+ name +"','"+ userid +"','"+ password +"','"+ locality +"','"+ number +"');");
             
             out.println("Succesfully registered");
             request.setAttribute("message", "Registeration succesfull");
             RequestDispatcher red=request.getRequestDispatcher("login.jsp");
             red.forward(request, response);
      
             }
             else {       
         //   	request.setAttribute("message", "REgisteration unsuccesfull(userid already exists)"); 
           out.println("Userid has already been taken use another one");
            	 RequestDispatcher red=request.getRequestDispatcher("register.jsp");
             red.include(request, response);}
      
         }
         catch(ClassNotFoundException e){
      	   e.printStackTrace();
      	  }
      	  catch(SQLException e) {
      	   e.printStackTrace();
      	  }
         
        
	}

}
