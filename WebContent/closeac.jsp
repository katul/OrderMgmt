<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.gms.demo.GetCon"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="top_links">
	<h1>APNA - BANK<span class="style1"></span></h1>
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
    	<div><br>
		    <ul>
            </ul>
			
       </div>
	</td>
    <td width="1200" valign="top">
<table>
<%
        String num=request.getParameter("accountno");
		Long accountno=Long.parseLong(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		String user = (String) session.getAttribute("username");
		if(username.equalsIgnoreCase(user)){
		try {
			Connection con1=GetCon.getCon();
			PreparedStatement ps1=con1.prepareStatement("select * from NEWACCOUNT where accountno=? and username=? and password=?");
            ps1.setLong(1,accountno);
            ps1.setString(2,username);
            ps1.setString(3,password);
			ResultSet rs = ps1.executeQuery();
			if(rs.next()){
				Connection con=GetCon.getCon();
				PreparedStatement ps=con.prepareStatement("delete from NEWACCOUNT where accountno=?");
	            ps.setLong(1,accountno);
				ps.executeUpdate();
				out.print("&nbsp;&nbsp;&nbsp;your account no '"+accountno+"' has closed.");
			}else{
				request.setAttribute("error", "Invalid Details. Please Enter Valid details!");
				RequestDispatcher rd = request.getRequestDispatcher("closeac1.jsp");
				rd.forward(request, response);
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		}else{
			request.setAttribute("error", "User Details not matching");
			RequestDispatcher rd = request.getRequestDispatcher("closeac1.jsp");
			rd.forward(request, response);
		}
		
    	
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.*" %>


   
