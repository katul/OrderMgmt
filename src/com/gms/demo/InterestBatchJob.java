package com.gms.demo;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class InterestBatchJob
 */
@WebServlet("/InterestBatchJob")
public class InterestBatchJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public InterestBatchJob() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		addInterest(request, response);
	}
	
	public void addInterest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		Connection con = GetCon.getCon();
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement("select Accountno, balance from accountinfo where Accountno in (select Accountno from newaccount where status=?)");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				long accno = rs.getLong(1);
				double balance = rs.getDouble(2);
				double updatedBalance = calculateInterest(balance);
				System.out.println(updatedBalance);
				PreparedStatement ps1 = con.prepareStatement("update accountinfo set balance=? where accountno=?");
				ps1.setDouble(1, updatedBalance);
				ps1.setLong(2, accno);
				ps1.executeUpdate();
				System.out.println("Monthly Interest updated for account number : "+accno);
			}
			request.setAttribute("success", "Monthly Interest added to all active accounts");
			RequestDispatcher rd = request.getRequestDispatcher("JobSuccess.jsp");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

	private double calculateInterest(double balance) {
		double interest = balance*getMonthlyInterest();
		double updatedBalace = balance + interest;
		return updatedBalace;
	}

	private double getInterestRate() {
		double interest = 5;
		return interest;
	}
	
	private double getMonthlyInterest(){
		double monthlyInterest = getInterestRate()/12;
		BigDecimal bigDecimal = new BigDecimal(monthlyInterest);
        monthlyInterest = Double.parseDouble(bigDecimal.setScale(2, BigDecimal.ROUND_HALF_UP).toString());
		return monthlyInterest;
	}
}
