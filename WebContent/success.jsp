<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>G.M.SOUND</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="top_links">
	<h1>G.M.SOUNDK<span class="style1"></span></h1>
	<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
</div>

<div id="navigation">
    <ul>
    	<li><a href="adminview.jsp">Home</a></li>
	    <li><a href="report.jsp">Reports</a></li>
	    <li><a href="openaccount.jsp">Open Account</a></li>
	    <li><a href="CloseAdmin.jsp">Close A/C</a></li>
	    <li><a href="Batch.jsp">Batch Jobs</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div align="center" style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px;">
<br><br><br><br><h3><font color="green"><%=request.getAttribute("successmessage") %> and user name : <%= request.getAttribute("username") %></font></h3>
</div>
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright © G.M.SOUND
  </div>
</div>
</body>
</html>