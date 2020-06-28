package com.gms.demo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String firstName=request.getParameter("fname");
		String lastName=request.getParameter("lname");
		
		String amoun=request.getParameter("amount");
		double amount=Double.parseDouble(amoun);
		
		String adderess=request.getParameter("adderess");
		
		String ph=request.getParameter("phone");
		Long phone = Long.parseLong(ph);
		int checkuser = RegisterUser.checkUserAvaiability(username);
		if(checkuser == 0){
		    int status=RegisterUser.register(username, firstName, lastName, adderess, password, amount, phone);
		    HttpSession session = request.getSession();
		    
			if(status>0){
				try {
					Connection con = GetCon.getCon();
					PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where username=? and password=?");
		            ps.setString(1,username);
		            ps.setString(2, password);
					ResultSet rs=ps.executeQuery();
				if(rs.next()){
					request.setAttribute("successmessage", "WELCOME! YOUR ACCOUNT HAS OPENED. Your Account number is: "+rs.getLong(1));
					session.setAttribute("username", username);
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				request.setAttribute("errormessage","Sorry,Registration failed. please try later");
				RequestDispatcher rd=request.getRequestDispatcher("create.jsp");
				rd.include(request, response);
			}
		}else{
	    	request.setAttribute("errormessage","Sorry,Username already Exists. please try other username!");
			RequestDispatcher rd=request.getRequestDispatcher("create.jsp");
			rd.include(request, response);
	    }
		
	out.close();	
	}

}
