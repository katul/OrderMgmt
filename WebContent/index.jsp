<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>G.M.SOUND</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="top_links">
	<h1><span class="style1">G.M.SOUND</span></h1>
	<p class="style1">Order Management System</p>
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
</div>

<div id="navigation">
    <ul>
	    <li><a href="index.jsp">HOME</a></li> 
	    <li><a href="balance1.jsp">BALANCE</a></li>
	    <li><a href="statement1.jsp">STATEMENT</a></li>
	    <li><a href="transfer1.jsp">TRANSFER</a></li>
	    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
	    <li><a href="applycreditcard.jsp">CREDIT CARD</a></li>
	    <li><a href="contact1.jsp">CONTACT US</a></li>
	    <li><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>

<div style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px ">
<div align="center">
			<% if(request.getAttribute("successmessage")!=null) {
				out.println("<font color='green'>"+request.getAttribute("successmessage")+"</font>");
			}
			%>
</div><br><br><br><br>
<% 
try {
			long accont = 0;
			String username = null;
			String fname = null;
			String lname = null;
			String address = null;
			String password = null;
			double amount = 0.0;
			long phone = 0;
		    Connection con1=GetCon.getCon();
			PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
            ResultSet rs1=ps1.executeQuery();
            Long  accountno = null;
            while(rs1.next()){
				accountno=rs1.getLong(1);
				request.setAttribute("accountno",accountno);
				}
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
			ResultSet rs=ps.executeQuery();
			out.print("<div align='center'><table cellspacing='5' cellpadding='3' bgcolor='white' border='1'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>FIRST NAME</th><th>LAST NAME</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
				session.setAttribute("accountno",accountno);
				accont = rs.getLong(1);
				username = rs.getString(2);
				fname = rs.getString(3);
				lname = rs.getString(4);
				address = rs.getString(5);
				password = rs.getString(6);
				phone = rs.getLong(8);
				
				out.print("<tr>");
				out.print("<td>" + rs.getLong(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("<td>" + rs.getString(5) + "</td>");
				out.print("<td>" + rs.getLong(8) + "</td>");
				out.print("</tr>");
			}
			out.print("</table>");%>
			<br><br><br><br>
			<%
			out.print("<form action='EditFormData.jsp' method='post' align='center'>");
				out.print("<input type='hidden' name='username' value="+username+">");
				out.print("<input type='hidden' name='fname' value="+fname+">");
				out.print("<input type='hidden' name='lname' value="+lname+">");
				out.print("<input type='hidden' name='address' value="+address+">");
				out.print("<input type='hidden' name='password' value="+password+">");
				out.print("<input type='hidden' name='phone' value="+phone+">");
				out.print("<input type='submit' value='Edit Profile'>");
			out.print("</form></div>");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
%>
  <table  align="center" bgcolor="white" height="100px"></table></div>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
	  Copyright © G.M.SOUNDApna Bank
  </div>
 </div>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>