<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
  for(var i=0; i<3; i++)
   {
        if(!isNaN(form.elements[i].value))
		{
		   alert("This Field must be Char's")
		   form.elements[i].value=""	
		   form.elements[i].focus()
		   return false
		}
   } 
    if(document.F1.password.value!=document.F1.repassword.value)
    {
	   alert("Check Confirm PWD"); 
	   document.F1.repassword.value=""
	   document.F1.repassword.focus()	
	   return false
	}
	
	
	if(!isNaN(document.F1.phone.value))
   {
	   if(document.F1.phone.value >9999999999 )
	   {
		 alert("ye kabhi nhi aayegi")
		 document.F1.phone.value=""
		 document.F1.phone.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.phone.value=""
	   return false
   }
	
	
	

   if(!isNaN(document.F1.amount.value))
   {
	   if(document.F1.amount.value < 500)
	   {
		 alert("Minimum Balance should be 500 /-")
		 document.F1.amount.value=""
		 document.F1.amount.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.amount.value=""
	   return false
   }
   
   

   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields")
		   document.F1.username.focus()
		   return false
		}
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
<table style="width:897px; background:#FFFFFF; margin:0 auto; height: 450px">
<tr >
    <td width="1200" valign="top">
    <div id="welcome" style="border-right:#666666 1px;"><h1>OPEN ACCOUNT FORM</h1><br>
      <table  align="center" bgcolor="white">
		<tr>
			<% if(request.getAttribute("errormessage")!=null) {
				out.println("<font color='red'>"+request.getAttribute("errormessage")+"</font>");
			}
			%>
		</tr>
		<tr>
			<td>
				<form name=F1 onSubmit="return validate(this)" action="AdminCreateAccount" method="post">
				  <table cellspacing="5" cellpadding="3">	
					<tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
					<tr><td>FIRST NAME:</td><td> <input type="text" name="fname"/></td></tr>
					<tr><td>LAST NAME:</td><td> <input type="text" name="lname"/></td></tr>
					<tr><td>ADDRESS:</td><td> <textarea rows="4" cols="25" name="adderess"></textarea></td></tr>
					<tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
					<tr><td>RE-PASSWORD:</td><td> <input type="password" name="repassword"/></td></tr>
					<tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
					<tr><td>PHONE:</td><td> <input type="text" name="phone"/></td></tr>
					<tr><td></td><td><input type="submit" value="Submit"/>
					<INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
				  </table>
               	</form>
			</td>
		</tr>
	  </table>
   </div>      
</tr>
</table>
    
<div id="footer_top">
  <div id="footer_copyright" >
  	Copyright � Apna Bank
  </div>
</div>
</body>
</html>