package com.gms.demo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PullRecords
 */
@WebServlet("/PullRecords")
public class PullRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PullRecords() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stmt = request.getParameter("stmt");
		int checkVal = Integer.parseInt(request.getParameter("checkVal"));
		System.out.println(checkVal);
		CustomerRecords custRec = new CustomerRecords();
		if(checkVal == 1){								//All Customer Data					
			custRec.generatePDF(stmt,checkVal);
			request.setAttribute("checkVal", checkVal);
			RequestDispatcher rd = request.getRequestDispatcher("DownloadReports.jsp");
			rd.forward(request, response);
		}else if(checkVal == 2){						//Unique Customer Data
			long accountno = Long.parseLong(request.getParameter("accno"));
			custRec.generateUniqueCustomerViewPDF(stmt,accountno);
			request.setAttribute("statement", stmt);
			request.setAttribute("checkVal", checkVal);
			request.setAttribute("accno", accountno);
			RequestDispatcher rd = request.getRequestDispatcher("DownloadReports.jsp");
			rd.forward(request, response);
		}else if(checkVal == 3){						//Active Customer Data
			custRec.generatePDF(stmt,checkVal);
			request.setAttribute("statement", stmt);
			request.setAttribute("checkVal", checkVal);
			RequestDispatcher rd = request.getRequestDispatcher("DownloadReports.jsp");
			rd.forward(request, response);
		}else if(checkVal == 4){						//Credit Card Customer Data
			custRec.generatePDF(stmt,checkVal);
			request.setAttribute("statement", stmt);
			request.setAttribute("checkVal", checkVal);
			RequestDispatcher rd = request.getRequestDispatcher("DownloadReports.jsp");
			rd.forward(request, response);
		}
	}
}


