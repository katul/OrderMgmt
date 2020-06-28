package com.gms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gms.service.ProcessChallanData;

/**
 * Servlet implementation class SearchChallanServlet
 */
@WebServlet("/SearchChallan")
public class SearchChallanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchChallanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("SearchChallanServlet Class Invoked");
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    String challanName = request.getParameter("searchChallan");
	    System.out.println(challanName);
		ProcessChallanData processData = new ProcessChallanData();
		JSONObject challanList = processData.getChallanData(challanName);
		
        PrintWriter out = response.getWriter();
        try {
            out.println(challanList.toJSONString());
        } finally {
            out.close();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
