<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>  <link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head >

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
<div align="center" style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px ">
<br><br><br><br><h3><font color="green"><%=request.getAttribute("success") %> </font></h3>
</div>
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>