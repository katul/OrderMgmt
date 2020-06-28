<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<br><br><br><br>
<div align="center"><form action="CustomerData1.jsp" method="post">
<input type="submit" value="Customer Account Data">
</form><br><br><br>
<form action="CCCustomerData.jsp" method="post">
<input type="submit" value="Credit Card Customer Data">
</form><br><br><br>
<form action="ActiveCustomer.jsp" method="post">
<input type="submit" value="List of Active Customers">
</form><br><br><br>
<form action="WCCCustomer.jsp" method="post">
<input type="submit" value="List of Customers Without Credit Card">
</form><br><br><br>
<form action="BlockCard.jsp" method="post">
<input type="submit" value="Block Credit Card">
</form>
</div></div> 
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>