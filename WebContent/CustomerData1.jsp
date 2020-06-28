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
<br><br><br>
<div align="center"> <b>Search by Customer</b>
<form action='CustomerView.jsp' method="post">
<table><tr><td>Customer Account No </td></tr><tr><td><input type="text" name="accountno" placeholder="Enter Customer Account Number"></td></tr>
<tr></tr><tr></tr><tr><td><input type="reset" value="Clear"></td><td><input type="submit" value="Search"></td></tr>
</table></form></div><br><br><br><br>
<div align="center">
<b><a href="AllCustData.jsp">Search All Customer Data</a></b>
</div>
</div>
</body>
</html>