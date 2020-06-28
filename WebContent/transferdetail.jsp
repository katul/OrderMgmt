<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.gms.demo.GetCon"%>
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
</div>

<div id="navigation">
    <ul>
    	<li><font color="green"><a href="index.jsp">Welcome <% out.println(session.getAttribute("username")); %></a></font></li>
	    <li><a href="balance1.jsp">BALANCE</a></li>
	    <li><a href="deposit1.jsp">STATEMENT</a></li>
	    <li><a href="transfer1.jsp">TRANSFER</a></li>
	    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
	    <li><a href="contact1.jsp">Contact Us</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto;">
<table>
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px;">
    	<div id="services"><br>
		    <ul>
			</ul>
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
<table><%
    	
        String num=request.getParameter("accountno");
		Long accountno=Long.parseLong(num);
		
		String num1=request.getParameter("taccountno");
		Long taccountno=Long.parseLong(num1);
		
		String amoun=request.getParameter("amount");
		double amount=Double.parseDouble(amoun);
		try {
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps.setLong(1,accountno);
			ResultSet rs=ps.executeQuery();
			double dataamount=0;
			
			if(rs.next()){
				dataamount=rs.getDouble(4)-amount; 
			}
			Connection con1=GetCon.getCon();
			PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where Accountno='"+accountno+"'");
			ps1.setDouble(1,dataamount);
			ps1.executeUpdate();
		
			request.setAttribute("target account A ",dataamount);
			Connection con2=GetCon.getCon();
			PreparedStatement ps2=con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");
            ps2.setLong(1,taccountno);
			ResultSet rs2=ps2.executeQuery();
			
			double dataamount1=0;
			if(rs2.next()){
				dataamount1=rs2.getDouble(4)+amount; 
			}
			Connection con3=GetCon.getCon();
			
			PreparedStatement ps3=con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+taccountno+"'");
			ps3.setDouble(1,dataamount1);
			ps3.executeUpdate();
			request.setAttribute("target account A",dataamount);
			request.setAttribute("account B",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%></table><%
%>
    	
    	
		 </table>
</div>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
