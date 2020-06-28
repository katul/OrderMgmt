<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gms.demo.GetCon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="top_links">
	<h1>APNA - BANK<span class="style1"></span></h1>
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
</div>
<div id="navigation">
    <ul>
    	<li><a href="adminview.jsp">Home</a></li>
	    <li><a href="report.jsp">Reports</a></li>
	    <li><a href="openaccount.jsp">Open Account</a></li>
	    <li><a href="CloseAdmin.jsp">Close A/C</a></li>
	    <li><a href="Batch.jsp">Batch Jobs</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px">
<%
	Connection con=GetCon.getCon();
	String stmt = "SELECT * FROM NEWACCOUNT WHERE accountno NOT IN (SELECT accountno FROM creditcard)";
	PreparedStatement ps = con.prepareStatement(stmt);
	ResultSet rs=ps.executeQuery();
	out.print("<br><br><br>");
	out.print("<form action='PullRecords' method='post'>");
	out.print("<table align='left'  cellspacing='5' cellpadding='3' bgcolor='grey' border='1'>");
	out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>FIRST NAME</th><th>LAST NAME</th><th>ADDRESS</th><th>BALANCE</th><th>PHONE</th><th>DATE CREATED</th><th>STATUS</th>");
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>" + rs.getLong(1) + "</td>");
		out.print("<td>" + rs.getString(2) + "</td>");
		out.print("<td>" + rs.getString(3) + "</td>");
		out.print("<td>" + rs.getString(4) + "</td>");
		out.print("<td>" + rs.getString(5) + "</td>");
		out.print("<td>" + rs.getDouble(7) + "</td>");
		out.print("<td>" + rs.getLong(8) + "</td>");
		out.print("<td>" + rs.getDate(9) + "</td>");
		out.print("<td>" + rs.getString(10) + "</td>");
		out.print("</tr>");
	}
	out.print("</table>");
	out.print("<input type='hidden' name='stmt' value='"+stmt+"'>");
	out.print("<input type='hidden' name='checkVal' value='5'>");
	out.print("<input type='submit' value='Generate PDF'>");
	out.print("</form>");
%>
</div>
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>