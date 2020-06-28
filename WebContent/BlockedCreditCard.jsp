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
<br><br><br>
<div align="center">
<%
String ccnum=request.getParameter("ccnum");
Long cardno=Long.parseLong(ccnum);
try {
	Connection con1=GetCon.getCon();
	PreparedStatement ps1=con1.prepareStatement("select * from creditcard where cardno=?");
    ps1.setLong(1,cardno);
	ResultSet rs = ps1.executeQuery();
	if(rs.next()){
		PreparedStatement ps2=con1.prepareStatement("update creditcard set status=? where cardno=?");
        ps2.setString(1, "Blocked");
		ps2.setLong(2,cardno);
		ps2.executeUpdate();
		out.print("<div align='center'>");
		out.print("<h3>As requested, Card Number '"+cardno+"' has been Blocked.For further information, contact our nearest branch.</h3>");
		out.print("</div>");
	}else{
		request.setAttribute("error", "Invalid card number. Please Enter Valid details!");
		RequestDispatcher rd = request.getRequestDispatcher("BlockCard.jsp");
		rd.forward(request, response);
	}
 }catch(Exception e) {
	e.printStackTrace();
}
%>
</div></div>
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>