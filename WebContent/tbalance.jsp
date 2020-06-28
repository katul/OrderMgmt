<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

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
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px;">
    	<div ><br>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
%>
<table border="2" align="center" width="60%" height="60%" bgcolor="white">
		<tr>
		</tr>
		<tr>
			<td align="center" valign="middle" bgcolor="green"><h4>Fund Transfer Successful</h4></td>
		</tr>
		<tr>
			<td align="center" valign="middle" bgcolor="red"><h4>Accounts Info</h4></td>
		</tr>
		
		<tr>
			<td>
			<%
			{
				out.print("Your new account balance is : ");
				out.print(request.getAttribute("target account A"));
			}
			
			 %>
			</td>
		</tr>
    </table>
</table>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
  Copyright © Apna Bank</div>
</div>
<script type="text/javascript">
document.onload = ctck();
</script>
</body>
</html>