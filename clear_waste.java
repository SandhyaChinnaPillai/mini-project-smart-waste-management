package minijava;
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
import java.io.IOException;


@WebServlet("/clear_waste")
public class clear_waste extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 response.setContentType("text/html");
         try {
   		 // System.out.println("entered try");
   		  Class.forName("com.mysql.cj.jdbc.Driver");
             Connection conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/swm","root","root");
             Statement stmt1 = conn.createStatement();
             stmt1.executeUpdate("update user_details set garbage_level =0 where garbage_level>2;");
             request.setAttribute("message", "Succesfully cleaned waste ");
             out.println("Cleared waste");
             RequestDispatcher red=request.getRequestDispatcher("Garbage_user.jsp");
             red.include(request, response);
      
         }
         catch(ClassNotFoundException e){
      	   e.printStackTrace();
      	  }
      	  catch(SQLException e) {
      	   e.printStackTrace();
      	  }
	}
}
