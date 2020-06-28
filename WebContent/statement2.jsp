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
	Your file is ready to download....
	<br><br><br><br><br><br><br><br><br><br>
	<%
		long acc = (long)request.getAttribute("accountno");
		String path = "C:\\Users\\LENOVO\\Desktop\\projects\\onlinebanking\\WebContent\\pdfs\\";
		String filename = path+"Statement_"+acc+".pdf";
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