package com.gms.demo;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SaveData")
public class SaveData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveData() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String firstName=request.getParameter("fname");
		String lastName=request.getParameter("lname");
		
		String adderess=request.getParameter("address");
		
		String ph=request.getParameter("phone");
		Long phone = Long.parseLong(ph);
	    int status=RegisterUser.updateUser(username, firstName, lastName, adderess, password, phone);
	    HttpSession session = request.getSession();
	    session.setAttribute("username",username);
	    if(status>0){
			request.setAttribute("successmessage", "Profile updated successfully");
			session.setAttribute("username", username);
			RequestDispatcher rd=request.getRequestDispatcher("userview.jsp");
			rd.include(request, response);
		}else{
			request.setAttribute("errormessage","Sorry,Update failed. please try later");
			RequestDispatcher rd=request.getRequestDispatcher("EditFormData.jsp");
			rd.include(request, response);
		}
	}
}
