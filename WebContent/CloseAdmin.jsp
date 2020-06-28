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
		   alert("Fill out account Fields")
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
	    <li><a href="openaccount.jsp">Open Account</a></li>
	    <li><a href="CloseAdmin.jsp">Close A/C</a></li>
	    <li><a href="Batch.jsp">Batch Jobs</a></li>
	    <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>
<div style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px">
<table>
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px;">
    	<div ><br>
		    <ul>
            </ul>
			
       </div>
	</td>
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px;">
    	<h1>ACCOUNT CLOSURE FORM</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
		</tr>
		<tr>
			<td>
			<div><%if(request.getAttribute("error")!=null){
				out.println("<font color='red'>"+request.getAttribute("error")+"</font>");
			}
			 %></div>
				<form name=F1 onSubmit="return validate(this)" action="closeadmin1.jsp" method="post" >
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
</tr></table>
    </div>
<div id="footer_top">
  <div id="footer_navigation">
  </div>
  <div id="footer_copyright" >
  Copyright © Apna Bank</div>
</div>
</body>
</html>
