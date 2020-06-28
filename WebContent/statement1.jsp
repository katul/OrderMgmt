


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields")
		   document.F1.accountno.focus()
		   return false
		}
   }

   if(isNaN(document.F1.accountno.value))
   {
       alert("Accountno must  be  number & can't be null")
	   document.F1.accountno.value=""
	   document.F1.accountno.focus()
	   return false
   }
   
   return true   
}
</SCRIPT>
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
<% out.println("</font>"); %>
<div style="width:897px; background:#FFFFFF; margin:0 auto;">
<table>
<tr >
    
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px;"><h1>Balance Statement</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
			<% if(request.getAttribute("error")!=null) {
				out.println("<font color='red'>"+request.getAttribute("error")+"</font>");
			}
			%>
		</tr>
		<tr>
			<td>
				<form name="F1" onSubmit="return validate(this)" action="statement.jsp" method="post">
				   <table cellspacing="5" cellpadding="3">	
				  <tr><td>ACCOUNT NO:</td><td> <input type="text" name="accountno"/></td></tr>
					<tr><td></td><td><input type="submit" value="Submit"/>
                   <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
             	</table>
				</form>
			</td>
		</tr>
	</table>
    	   </div>      
    </td>
</tr></table></div>
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
