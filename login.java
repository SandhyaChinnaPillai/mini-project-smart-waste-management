package minijava;
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class login extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 //public ServletContext session;
	
	   
	    public login() {
	        // TODO Auto-generated constructor stub
	    }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 }
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
			
		 PrintWriter out = response.getWriter();
		 String userid = request.getParameter("userid");
         String password = request.getParameter("password");
         HttpSession session=request.getSession(true);
		
         if((userid.equals("collector"))&& password.equals("collector"))
         {
        	 RequestDispatcher red=request.getRequestDispatcher("Garbage_user.jsp");
             red.forward(request, response);
         }
         else { 
	  try {
		   userid = request.getParameter("userid");
	          password = request.getParameter("password");
	         
		  System.out.println("entered try");
		  Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
          Statement stmt = conn.createStatement();    
	  
          ResultSet rs=stmt.executeQuery("select * from user_details;");   	  

          while(rs.next())
          {
        	  System.out.println(rs.getString("userid"));
          }
          
	
	   String query1 = "select * from login where userid ='"+userid+"' and pwd = '"+password+"';";
        rs= stmt.executeQuery(query1);
       
       boolean v1=rs.next();
       System.out.println(v1);
       if(v1)
       {
		   out.println("Valid user");
		   session.setAttribute("userid", userid);
		   request.setAttribute("message",userid );
           RequestDispatcher red=request.getRequestDispatcher("registered_user.jsp");
           red.forward(request, response);
       }
       else
       {
           out.println("InValid user");
           RequestDispatcher red=request.getRequestDispatcher("login.jsp");
           red.include(request, response);
       }


	  } 
	  catch(ClassNotFoundException e){
	   e.printStackTrace();
	  }
	  catch(SQLException e) {
	   e.printStackTrace();
	  }
	 }}

}
