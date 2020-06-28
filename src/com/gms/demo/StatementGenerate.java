package com.gms.demo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PdfGenerate")
public class StatementGenerate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StatementGenerate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Long acc = (Long)session.getAttribute("accountno");
		System.out.println("PDFGen:"+acc);
		PdfGen pdf = new PdfGen();
		pdf.generteStatement(acc);
		request.setAttribute("accountno", acc);
		RequestDispatcher rd = request.getRequestDispatcher("statement2.jsp");
		rd.forward(request, response);
	}
}
