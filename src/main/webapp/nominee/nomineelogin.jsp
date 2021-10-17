<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="image/logo1.png">
<title>IICMR NOMINEE</title>
<link rel="stylesheet" type="text/css" href="nomineelogin.css">
<script type="text/javascript">


function goBack() {
	 window.location.href=("../index.html");}

function validate()
{
	var username=document.login.username1;
	var password=document.login.password1;
	
	if(username.value == null || username.value == "")
		{
			window.alert("please enter username");
			username.style.background= '#f08080';
			username.focus();
			return false;
		}
	if(password.value == null || password.value == "")
	{
		window.alert("please enter password");
		password.style.background= '#f08080';
		password.focus();
		return false;
	}	
	}
</script>

</head>
<body>


<button onclick="goBack()">Home</button>
	<div class="container">
	<div class="header">
	<h1>Nominee Login</h1>
	
	
</div>

<form name="login" onsubmit="return validate();" method="post">
	<ul>

	<li>Username: <input class="Username" type="text" name="username1"></li>
	<li>Password: <input class="Password"type="Password" name="password1"></li>
		
	</ul>
	<input type="submit" class="submit" value="Login" name="btn_login"/>
	
	</br></br>
	
	Create Account<a href="nominee.jsp">Register Here</a>
</form>
</div>

 

</body>
</html>



<%-- <% 
if(session.getAttribute("login")!=null)
{
	response.sendRedirect("index.jsp");
}
	
%> --%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/authentication","root","");
	if(request.getParameter("btn_login")!=null)
	{
		String dbusername,dbpassword,dbfname,dbemail,dbid,dbnumber,dbgender;
		String username,password,fname1,email1,id1,number1,gender1;
		
		username=request.getParameter("username1");
		password=request.getParameter("password1");
		
		fname1=request.getParameter("fname");
		email1=request.getParameter("email");
		
		id1=request.getParameter("id");
		
		
		number1=request.getParameter("number");
		gender1=request.getParameter("gender");
		
		
		
		
		
		PreparedStatement pstmt=null;
		
		pstmt=con.prepareStatement("select * from nominee where username=? AND password=? ");
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		
		 
		
		
		
	
		
		
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next())
				
		{
		
			dbusername=rs.getString("username");
			dbpassword=rs.getString("password");
			
			dbfname=rs.getString("fname");
			dbemail=rs.getString("email");
			
			dbid=rs.getString("id");
			
			dbnumber=rs.getString("number");			
			dbgender=rs.getString("gender");
			
		
			
			if(username.equals(dbusername) && password.equals(dbpassword))
			{ 
				session.setAttribute("login", dbusername);
				
				
				 response.sendRedirect("index.jsp"); 
				
			}
			session.setAttribute("login1", dbfname);
			session.setAttribute("login2", dbemail);
			session.setAttribute("id1",dbid);
			
			session.setAttribute("login3", dbnumber);
			session.setAttribute("login4",dbgender);
		}
		else
		{
			
			request.setAttribute("errorMsg","invalid username and password");
			/* response.sendRedirect("error.jsp"); */
			
		}
		
		con.close();
	}
}
catch(Exception e)
{
	out.println(e);
}
%>




    