<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gms.demo.GetCon"%>
<%@page import="java.sql.Connection"%>
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
</head>

<body>

<div id="top_links">
	<h1>APNA - BANK<span class="style1"></span></h1>
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
</div>

<div id="navigation">
    <ul>
    	<li><a href="adminview.jsp">Home</a></li>
	    <li><a href="report.jsp">Reports</a></li>
	    <li><a href="UserLogin.jsp">Open Account</a></li>
	    <li><a href="CloseAdmin.jsp">Close A/C</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px">
<br><br><br><br><br>
	<%
	String num=request.getParameter("accountno");
	Long accountno=Long.parseLong(num);
	String user = (String) session.getAttribute("username");
	try {
		Connection con1=GetCon.getCon();
		PreparedStatement ps1=con1.prepareStatement("select * from NEWACCOUNT where accountno=?");
        ps1.setLong(1,accountno);
		ResultSet rs = ps1.executeQuery();
		if(rs.next()){
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("update NEWACCOUNT set status=? where accountno=?");
            ps.setString(1, "Inactive");
			ps.setLong(2,accountno);
			ps.executeUpdate();
			PreparedStatement ps2=con.prepareStatement("update creditcard set status=? where accountno=?");
            ps2.setString(1, "Inactive");
			ps2.setLong(2,accountno);
			ps2.executeUpdate();
			out.print("<div align='center'>");
			out.print("<h3>As requested, Account Number '"+accountno+"' has been closed.For further information, contact our nearest branch.</h3>");
			out.print("</div>");
		}else{
			request.setAttribute("error", "Invalid Account Details. Please Enter Valid details!");
			RequestDispatcher rd = request.getRequestDispatcher("CloseAdmin.jsp");
			rd.forward(request, response);
		}
	 }catch(Exception e) {
		e.printStackTrace();
	}
		%>
</div>
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © Apna Bank
  </div>
</div>
</body>
</html>