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
	    <li><a href="userview.jsp">HOME</a></li> 
	    <li><a href="balance1.jsp">BALANCE</a></li>
	    <li><a href="deposit1.jsp">STATEMENT</a></li>
	    <li><a href="transfer1.jsp">TRANSFER</a></li>
	    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
	    <li><a href="applycreditcard.jsp">CREDIT CARD</a></li>
	    <li><a href="contact1.jsp">CONTACT US</a></li>
	    <li><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>

<div style="width:897px; background:#FFFFFF; margin:0 auto;">
	
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
    
    <td width="1200" valign="top">
    <div id="welcome" style="border-right:#666666 1px;"><h1>Edit Profile</h1><br>
      <table  align="center" bgcolor="white" >
      <tr><td>
				<form name=F1 onSubmit="return validate(this)" action="SaveData" method="post">
				  <% 
				  	
				  	String username = request.getParameter("username");
				  	String fname = request.getParameter("fname");
				  	String lname = request.getParameter("lname");
				  	String address = request.getParameter("address");
				  	String password = request.getParameter("password");
				  	String phone = request.getParameter("phone");
				  	out.print("<tr><td>USER NAME:</td><td>"+username+"</td></tr>");
				  	out.print("<input type='hidden' name='username' value="+username+">");
				  	out.print("<tr><td>FIRST NAME:</td><td><input type='text' name='fname' value="+fname+"></td></tr>");
					out.print("<tr><td>LAST NAME:</td><td><input type='text' name='lname' value="+lname+"></td></tr>");
					out.print("<tr><td>ADDRESS:</td><td><input type='text' name='address' value="+address+"></td></tr>");
					out.print("<tr><td>PASSWORD:</td><td><input type='text' name='password' value="+password+"></td></tr>");
					out.print("<tr><td>PHONE NUMBER:</td><td><input type='text' name='phone' value="+phone+"></td></tr>");
					out.print("<tr><td></td><td><input type='submit' value='Save'></td></tr>");
					%>
               	</form></td></tr>
	  </table></div>
</table>
</div>  
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>