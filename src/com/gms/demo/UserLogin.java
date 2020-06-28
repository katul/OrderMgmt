package com.gms.demo;

import java.io.IOException;
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


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserLogin() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=GetCon.getCon();
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		try {
			PreparedStatement ps=con.prepareStatement("Select * from login where username = ? and password =?");
			ps.setString(1,username);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				if(rs.getString(4).equalsIgnoreCase("Active")){
						session.setAttribute("username", username);
						RequestDispatcher rd = request.getRequestDispatcher("userview.jsp");
						rd.include(request, response);
					}else{
						request.setAttribute("error", "Account Not active. Please contact your nearest branch. ");
						RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
						rd.include(request, response);
				}
			}else{
				request.setAttribute("error", "Invalid Credentials, Try again!!");
				RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
				rd.include(request, response);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
