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
    	<li><a href="adminview.jsp">Home</a></li>
	    <li><a href="report.jsp">Reports</a></li>
	    <li><a href="openaccount.jsp">Open Account</a></li>
	    <li><a href="CloseAdmin.jsp">Close A/C</a></li>
	    <li><a href="Batch.jsp">Batch Jobs</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto;">
	<br><br><br>Your file is ready to download....
	<br><br><br><br><br><br><br><br><br><br>
	
<%
	String filename = null;
	int checkVal = Integer.parseInt(request.getAttribute("checkVal").toString());
	if(checkVal == 1){
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		filename = path+"AllCust_Records.pdf";
	}else if(checkVal == 2){
		long acc = (long)request.getAttribute("accno");
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		filename = path+"Cust_Records_"+acc+".pdf";
	}else if(checkVal == 4){
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		filename = path+"CreditCard_Report.pdf";
	}else if(checkVal == 3){
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		filename = path+"ActiveCust_Records.pdf";
	}else if(checkVal == 4){
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		filename = path+"CCCust_Records.pdf";
	}
	
%>
	<div align="center"><a href="file:///<%=filename %>" target="_blank"><button>Download</button></a></div>
<br><br><br><br><br></div>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
  Copyright © Apna Bank
</div>
</div>
</body>
</html>