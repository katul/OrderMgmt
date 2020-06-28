<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>G.M.SOUND</title>
<link href="style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Order Number Field cannot be blank.")
		   document.F1.orderno.focus()
		   return false
		}
   }

   if(isNaN(document.F1.orderno.value))
   {
       alert("Order Number must be numeric.")
	   document.F1.orderno.value=""
	   document.F1.orderno.focus()
	   return false
   }
   
   return true   
}
</SCRIPT>
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
	<table>
	<tr >
	    <td width="1200" valign="top">
	    	<div id="welcome" style="border-right:#666666 1px;"><h1>Enter Order Number</h1><br>
	    	    <table  align="center" bgcolor="white">
			<tr>
				<% if(request.getAttribute("error")!=null) {
					out.println("<font color='red'>"+request.getAttribute("error")+"</font>");
				}
				%>
			</tr>
			<tr>
				<td>
					<form name="F1" onSubmit="return validate(this)" action="orderdetail.jsp" method="post">
					   <table cellspacing="5" cellpadding="3">	
					  <tr><td>Order No:</td><td> <input type="text" name="orderno"/></td></tr>
						<tr><td></td><td><input type="submit" value="Submit"/>
	                   <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
	             	</table>
					</form>
				</td>
			</tr>
		</table>
	    	   </div>      
	    </td>
	</tr>
	</table>
	<div class="row" style="margin-top:10%;">
		<button onclick="window.location.href='ordermanagement.jsp'" type="button" style="margin-left:25%;margin-right:15;">Back</button>
	</div>
  </div>

</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
