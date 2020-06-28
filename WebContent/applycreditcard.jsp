<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<body>
<div style="width:897px; background:#FFFFFF; margin:0 auto; height:450px;">
Now you can avail the features of our virtual credit card in association with our bank.

This virtual credit card acts like a physical credit card which you can use for online shopping and many more.

Keep looking for new offers on our credit card and enjoy shopping at discounted rates.

To Apply now : Click below Button <br><br><br>
	<div align="center"><form action="CreditCardServlet">
		<input type="submit" name="apply" value="Apply Now"><br><br><br>
	</form></div>
	
	<br><br><br>
	To view your existing Credit Card - Click Below:<br><br><br>
	<div align="center"><form action="ViewCreditCardServlet">
		<input type="submit" name="apply" value="View Credit Card"><br><br><br>
	</form></div>
</div></body>
</html>