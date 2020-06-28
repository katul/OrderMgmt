<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function validate(form)
{
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   document.login.name.focus();
		   return false;
		}
   }
   </script>
</head>
<body>
<div id="top_links">
	<h1><span class="style1">G.M.Sound</span></h1>
	<p class="style1">Order Management System</p>
</div>


<center>
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px;"><h1>Accountholder Login</h1><br>
    	   <table  align="center" bgcolor="white">
			<tr>
				<% if(request.getAttribute("error")!=null) {
					out.println("<font color='red'>"+request.getAttribute("error")+"</font>");
				}
				%>
			</tr>
			<tr>
				<td>
					<form name="login" action="UserLogin" method="post" onSubmit="return validate(this)">
					<table cellspacing="5" cellpadding="3">
						<tr><td>USERNAME:</td><td><input type="text" name="name" placeholder="Enter Username"><br></td></tr>
						<tr><td>PASSWORD:</td><td><input type="password" name="password" placeholder="Enter Password"><br></td></tr>
						<tr><td></td><td><input type='reset' value='Reset'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='Login' onclick="validate(this)"></td></tr>
					</table></form>
				</td>
			</tr>
			<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
		</table></div>	
    </td><td><img src="images/login.jpg"></td>
</tr></table>
</center>
<div id="footer_top">
  
  <div id="footer_copyright" >
	Copyright © Apna Bank
  </div>
</div>
</body>
</html>