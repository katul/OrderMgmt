<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="top_links">
	<h1><span class="style1">G.M.Sound</span></h1>
	<p class="style1">Order Management System</p>
</div>

<div id="navigation">
    <ul>
    	<li><a href="userview.jsp">HOME</a></li> 
	    <li style="padding-left:75.22%"><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px">
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
	<div class="row" style="margin-top:15%;">
		<a class="left" style="margin-left:25%;margin-right:15;" href="reservations.html">Reservations</a>
		<a class="right" style="margin-left:25%;margin-right:15;" href="ordermanagement.html">Order Management</a>
	</div>
	<div class="row" style="margin-top:10%;">
		<a class="left" style="margin-left:25%;margin-right:15;" href="billing.html">Billing</a>
		<a class="right" style="margin-left:30%;margin-right:15;" href="custmanagement.html">Customer Management</a>
	</div>
  </div>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
	  Copyright � Apna Bank
  </div>
 </div>

</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
