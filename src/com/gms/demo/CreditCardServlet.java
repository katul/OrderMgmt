package com.gms.demo;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageTestServlet
 */
@WebServlet("/CreditCardServlet")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CreditCardServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShowCreditCard test = new ShowCreditCard();
		try {
			test.ImageGenerete(request,response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
