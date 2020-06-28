<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="top_links">
	<h1>APANA - BANK<span class="style1"></span></h1>
<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
</div>

<div id="navigation">
    <ul>
    	<li><a href="userview.jsp">HOME</a></li> 
	    <li><a href="balance1.jsp">BALANCE</a></li>
	    <li><a href="statement1.jsp">STATEMENT</a></li>
	    <li><a href="transfer1.jsp">TRANSFER</a></li>
	    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
	    <li><a href="applycreditcard.jsp">CREDIT CARD</a></li>
	    <li><a href="contact1.jsp">CONTACT US</a></li>
	    <li><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto;">
    <table  align="center" bgcolor="white" height="100px"></table><table  align="center" bgcolor="white" >
		<tr>
			<td>
			<%
		     	String num= (String) request.getParameter("accountno");
				int accountno = Integer.parseInt(num);
				System.out.println(accountno);
				String username = (String) session.getAttribute("username");
				try {
					Connection con=GetCon.getCon();
					PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=? and username=?");
					ps.setInt(1,accountno);
					ps.setString(2, username);
					ResultSet rs=ps.executeQuery();
					if(rs.next()){
						Connection con1=GetCon.getCon();
						PreparedStatement ps1=con1.prepareStatement("Select * from transactionhistory where accountno=?");
						ps1.setInt(1,accountno);
						Long accountno1 = null;
						ResultSet rs1=ps1.executeQuery();
						out.print("<form action='PdfGenerate' method='post'>");
						out.print("<table align='left'  cellspacing='5' cellpadding='3' bgcolor='white' border='2'>");
						out.print("<tr><th>ACCOUNT NO</th><th>TRANSACTION DATE</th><th>TRANSACTION TYPE</th><th>TRANSACTION AMOUNT</th></tr>");
						while(rs1.next()){
						    accountno1=rs1.getLong("accountno");
							session.setAttribute("accountno",accountno1);
							out.print("<tr>");
							out.print("<td>" + accountno1 + "</td>");
							out.print("<td>" + rs1.getDate("transactiondt") + "</td>");
							out.print("<td>" + rs1.getString("transactiontype") + "</td>");
							out.print("<td>" + rs1.getDouble("transactionamt") + "</td>");
							out.print("</tr>");
						}
						out.print("</table>");
						request.setAttribute("accountno", accountno1);
						out.print("<input type='submit' value='Generate PDF'>");
						out.print("</form>");
					}
					else{
						request.setAttribute("error", "Invalid Account number. Please Enter Valid details!");
						RequestDispatcher rd = request.getRequestDispatcher("statement1.jsp");
						rd.forward(request, response);
					}
				 }catch (SQLException e) {
					e.printStackTrace();
				}
				%>
</table><table  align="center" bgcolor="white" height="100px"></table>
</div>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
  Copyright © Apna Bank
</div>
</div>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.*" %>