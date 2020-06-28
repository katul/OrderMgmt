<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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


<%
    	String user = (String)session.getAttribute("username");
        String num=request.getParameter("accountno");
		Long accountno=Long.parseLong(num);
		
		String num1=request.getParameter("taccountno");
		Long taccountno=Long.parseLong(num1);
		
		String amoun=request.getParameter("amount");
		double amount=Double.parseDouble(amoun);
		
		try {
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from accountinfo where accountno=? and username=?");
            ps.setLong(1,accountno);
            ps.setString(2,user);
			ResultSet rs=ps.executeQuery();
			double dataamount=0;
			Connection con2=GetCon.getCon();
			PreparedStatement ps2=con2.prepareStatement("Select * from accountinfo where accountno=?");
            ps2.setLong(1,taccountno);
			ResultSet rs2=ps2.executeQuery();
			double dataamount1=0;
			if(rs.next() && rs2.next()){
					dataamount=rs.getDouble(3)-amount;
					Connection con1=GetCon.getCon();
					PreparedStatement ps1=con1.prepareStatement("update accountinfo set balance=? where Accountno='"+accountno+"'");
					ps1.setDouble(1,dataamount);
					ps1.executeUpdate();
					request.setAttribute("target account A ",dataamount);
					dataamount1=rs2.getDouble(3)+amount; 
					Connection con3=GetCon.getCon();
					PreparedStatement ps3=con3.prepareStatement("update accountinfo set balance=? where accountno='"+taccountno+"'");
					ps3.setDouble(1,dataamount1);
					ps3.executeUpdate();
					request.setAttribute("target account B",dataamount1);
					DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					String today = sdf.format(date);
					java.sql.Date dd = new java.sql.Date(sdf.parse(today).getTime());
					System.out.println(dd);
					PreparedStatement ps4=con1.prepareStatement("insert into transactionhistory values(?,?,?,?)");
					ps4.setLong(1, accountno);
					ps4.setDate(2, dd);
					ps4.setString(3, "Debit");
					ps4.setDouble(4,amount);
					ps4.executeUpdate();
					PreparedStatement ps5=con1.prepareStatement("insert into transactionhistory values(?,?,?,?)");
					ps5.setLong(1, taccountno);
					ps5.setDate(2, dd);
					ps5.setString(3, "Credit");
					ps5.setDouble(4,amount);
					ps5.executeUpdate();
			}else{
				out.println("Invalid Details!!! Please enter correct account number.");
				RequestDispatcher rd = request.getRequestDispatcher("transfer1.jsp");
				rd.include(request, response);
			}
			%><jsp:forward page="tbalance.jsp"></jsp:forward>
			<% 
		 }catch (SQLException e) {
			e.printStackTrace();
		}
%>
</div>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
