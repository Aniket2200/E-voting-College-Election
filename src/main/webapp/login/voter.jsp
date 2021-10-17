<!DOCTYPE html>
<html >
    <head>
    
    	 <!-- icon -->
    <link rel="icon" href="../image/logo1.png">
        <meta charset="UTF-8">
        <title>IICMR VOTER</title>
        
        <!-- linking css files for login page -->
        <link rel="stylesheet" href="css/reset.min.css">
        <link rel="stylesheet prefetch" href='css/style2.css'>
        <link rel="stylesheet prefetch" href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
        <link rel="stylesheet" href="css/style.css">
        
        <!-- validation testing script of the information submitted by user -->
        <script type="text/javascript" src="js/checkValidation.js"></script>
    </head>

    <body>

        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        
        <!-- making connection to the sql database of the admin -->
        <%@ include file="../user/getcon_ladmin.jsp"%>
        
        <!-- mail delivery java API's files -->
        <%@ page import="java.util.*,javax.mail.*"%>
        <%@ page import="javax.mail.internet.*" %>
        <%@ page import="javax.activation.*" %>
        
        
</script>

        <!-- Register and login code -->
        <!-- Form Mixin-->
        <!-- Input Mixin-->
        <!-- Button Mixin-->
        <!-- Pen Title-->
        <div class="pen-title">
            <h1 style="color:white;font-weight: 600;font-size: 70px" ></h1>
        </div>
        <!-- Form Module-->
        <div class="module form-module">
            <div class="toggle"><i class="fa fa-times fa-pencil"></i>
                <div class="tooltip">Register</div>
            </div>
            <div class="form">
                <h2>Login to your account</h2>
                <form name="login">
                    <input type="text" placeholder="Username" name="Username"/>
                    <input type="password" placeholder="Password" name="Password"/>
                    <button name="log">Login</button>
                </form>
            </div>
            <div class="form">
                <h2>Create an account</h2>
                <form name="register">
                    <input type="text" placeholder="Name"  name="name"/>
                    <input type="text" placeholder="Course" name="course"/>
                    <input type="text" placeholder="Branch" name="branch"/>
                    <input type="text" placeholder="Roll no" name="rollno"/>
                    <input type="radio" name="gender" value="Male">Male
                    <input type="radio" name="gender" value="Female">Female
                    <br>
                    <br>
                    <input type="email" placeholder="Email Address"  name="email"/>
                    <input type="tel"   placeholder="Phone Number" name="tel"/>
                    <input type="text"  placeholder="Username" name="username"/>
                    <input type="password" placeholder="Password" name="npass"/>
                    <input type="password" placeholder="Confirm Password" name="cpass"/>
                     
                    <button name="reg" onclick="return check('')">Register</button>
                </form>
            </div>
            <div class="cta"><a href="forgotpass.jsp">Forgot your password?</a></div>
        </div>



        <%
            if (request.getParameter("reg") != null) 
            {     // if user clicks on the register button and submiited his details
                String g = "";
                String h = "";

                try {

                    String a = request.getParameter("name");        
                    String b = request.getParameter("course");      
                    String c = request.getParameter("branch");
                    String d = request.getParameter("rollno");
                    String e = request.getParameter("email");
                    String f = request.getParameter("tel");
                    g = request.getParameter("username");
                    h = request.getParameter("npass");                  // new password
                    String i = request.getParameter("cpass");           // confirm password
                    String j = request.getParameter("gender");

                    Statement st = con.createStatement();               // create query to see if the user is already registered or not
                    String query = "select * from student";             // student is the table where information about the registered users are stored
                    ResultSet m = st.executeQuery(query);
                    int flag = 0;
                    while (m.next()) {                                  // compare one by one all the rows of student table
                        if (m.getString("email").equals(e)) 
                        {
                            flag = 1;
       	%> 
        					<script>
          						  alert("already registered email id");
        					</script>
       <%
                			break;
            			}
            			if (m.getString("rollno").equals(d)) 
            			{
                			flag = 1;
        %>
        					<script>
            					alert("rollno already registered");
        					</script>
        <%
                			break;
           				 }
            			if (m.getString("username").equals(g)) 
            			{
                			flag = 1;
        %>
        					<script>
            					alert("username already registered");
        					</script>
        <%
                    		break;
        
           				}
        %>
                    
                
 		<% 
              PreparedStatement k = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
                    k.setString(1, a);
                    k.setString(2, d);
                    k.setString(3, b);
                    k.setString(4, c);
                    k.setString(5, e);
                    k.setString(6, f);
                    k.setString(7, g);
                    k.setString(8, h);
                    k.setString(9, i);
                    k.setString(10, j);
                   
                          // is_activated field to see whether user enters the security key or not
                    k.executeUpdate();
                    session.setAttribute("who", g);       // session variable for storing username 
                    session.setAttribute("who_mail", e);  // session variable for storing mail id of the user
                    session.setAttribute("who_name", a);
            	
                  %>  <script>alert("Your Account Registered Successfully...");</script><%
          %>
         <%                                       
                   }
               } catch (Exception e) {
                %><%
               }

           }
        %>   <%
            if (request.getParameter("log") != null) 
            {    // if user logins into site
                String a = request.getParameter("Username");
                String b = request.getParameter("Password");
                
                String me = "select * from student where username='" + a + "' and password='" + b + "'";
                Statement k = con.createStatement();
                ResultSet m = k.executeQuery(me);
                if (m.next()) 
                {
                    session.setAttribute("who", a);
                    session.setAttribute("who_mail", m.getString("email"));
                    session.setAttribute("who_name", m.getString("name"));
                   
                    if(a.equals(a) && b.equals(b))
					{ 
						
				 		response.sendRedirect("../user/index.jsp"); 
				
					}
                    else
                    { %>
                    	<script>
                    		alert("Please Enter Correct Username and Password");
                    	</script>
                    }
                    <%
                }
               } 
             }        
        %>  
        <script src='js/jquery.min.js'></script>
        <script src="js/index.js"></script>
    </body>
</html>
        
         
          		
                
            		
         
            	
            	
            
                   