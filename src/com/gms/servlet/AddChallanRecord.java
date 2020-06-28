package com.gms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gms.service.*;

/**
 * Servlet implementation class AddChallanRecord
 */
@WebServlet("/AddChallanRecord")
public class AddChallanRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddChallanRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<Integer, List<String>> map = new HashMap<Integer, List<String>>();
		ProcessChallanData processchallan = new ProcessChallanData();
		System.out.println("welcome");
		String challanName = request.getParameter("challanName");
		int rowCount = Integer.valueOf(request.getParameter("rowcount"));
		System.out.println("Row count for challan name "+challanName+" is "+rowCount);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		for(int i = 0 ; i < rowCount;i++)
		{
			String itemName = request.getParameter("item["+i+"]");
			String itemQuantity = request.getParameter("quantity["+i+"]");
			String itemUnit = request.getParameter("unit["+i+"]");
			List<String> list = new ArrayList<String>();
			list.clear();
			list.add(itemName);
			list.add(itemQuantity);
			list.add(itemUnit);
			map.put(i,list);
		}
		
		int status = processchallan.processData(challanName,map);
		System.out.println(status);
		if(status!=0) {
			out.append("Success");
		}else {
			out.append("Error in Saving Value to DB");
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
