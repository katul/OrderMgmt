<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  <link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Apna Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
</script>
</head >
<body>
<div id="top_links">
	<h1><span class="style1">G.M.Sound</span></h1>
	<p class="style1">Order Management System</p>
</div>

<div style="width:897px; background:#FFFFFF; margin:0 auto;">
	<%
		//HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
	%>
	<div style="width:897px; background:#FFFFFF; margin:0 auto;">
	<br><br><br><br><br><br><br><br>
		<div align="center"><font color="blue"> <h2>You are successfully logged out.</h2></div> <br><br><br><br><div align="center"><a href="index.html"> Click here to login.</a></div></font>
	</div><br><br><br><br><br><br><br><br>
</div>

</body>
</html>