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
<div style="width:897px; background:#FFFFFF; margin:0 auto; min-height: 450px">
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
	<div class="ordertable">
		<table  align="center" bgcolor="white" height="100px"></table><table  align="center" bgcolor="white" >
		<tr>
			<td>
			<%
		     	String num=request.getParameter("orderno");
				//int accountno=Integer.parseInt(num);
				//String username = (String) session.getAttribute("username");
		try {
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from orders where orderno=?");
			ps.setString(1,num);
			ResultSet rs=ps.executeQuery();
			out.print("<table align='left'  cellspacing='5' cellpadding='5' bgcolor='white' border='1'>");
			out.print("<tr><th>Order Details</th></tr>");
			if(rs.next()){
			    //Long accountno1=rs.getLong(1);
				//session.setAttribute("accountno",accountno1);
				//</th><th></th><th></th><th></th><th>Return By Date</th><th</th><th></th><th></th><th> </th><th></th>
				out.print("<tr><td>Order NO</td>");
				out.print("<td>" + rs.getString(1) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Order Description</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Booking Date</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Event Date</td>");
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Return By Date</td>");
				out.print("<td>" + rs.getString(5) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Total Amount</td>");
				out.print("<td>" + rs.getDouble(6) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Advance Paid</td>");
				out.print("<td>" + rs.getDouble(7) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Customer Name</td>");
				out.print("<td>" + rs.getString(8) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Contact NO</td>");
				out.print("<td>" + rs.getLong(9) + "</td>");
				out.print("</tr>");
				out.print("<tr><td>Event Date</td>");
				out.print("<td>" + rs.getString(10) + "</td>");
				out.print("</tr>");
				out.print("</table>");
			}
			else{
				request.setAttribute("error", "Invalid Account number. Please Enter Valid details!");
				RequestDispatcher rd = request.getRequestDispatcher("balance1.jsp");
				rd.forward(request, response);
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
			%>
			</table><table  align="center" bgcolor="white" height="100px"></table>
	</div>
	<div class="row" style="margin-top:10%;">
		<button onclick="window.location.href='ordermanagement.jsp'" type="button" style="margin-left:25%;margin-right:15;">Back</button>
	</div>
  </div>

</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
