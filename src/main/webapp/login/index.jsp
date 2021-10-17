<%@page import="java.security.SecureRandom"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="../image/logo1.png">
	<title>Admin Login</title>
	<link rel="stylesheet" type="text/css" href="adminlogin.css">
	
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
        <%
                // captcha code  builder (6 random letters from the string defined)
                final String s1 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&!()%$#@^*";
                SecureRandom rnd1 = new SecureRandom();

                StringBuilder cap = new StringBuilder(6);
                for (int x1 = 0; x1 < 6;x1++) {
                    cap.append(s1.charAt(rnd1.nextInt(s1.length())));
                }
        %>  
<button onclick="goBack()">Go Back</button>

<script>
function goBack() {
  window.location.href=("../index.html");
}
</script>
	<div class="container">
	<div class="header">
	<h1>Admin Login</h1>
</div>



<form name="login" onsubmit="return validateForm();" method="post">
	<ul>

	<li>Username: <input class="Username" type="text" name="Username"></li>
	<li>Password: <input class="Password"type="Password" name="Password"></li>

		
	</ul>


	<button name="log" class="submit">Login</button>
</form>
</div>
<%
            if (request.getParameter("reg") != null) {     // if user clicks on the register button and submiited his details
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
                        if (m.getString("email").equals(e)) {
                            flag = 1;
        %> 
        <script>
            alert("already registered email id");
        </script>
        <%
                break;
            }
            if (m.getString("rollno").equals(d)) {
                flag = 1;
        %>
        <script>
            alert("rollno already registered");
        </script>
        <%
                break;
            }
            if (m.getString("username").equals(g)) {
                flag = 1;
        %>
        <script>
            alert("username already registered");
        </script>
        <%
                    break;
                }

            }
                    
             // checking whether the username is taken by admin or not
             // login table is for admin information       
                    Statement st1 = con.createStatement();
                    String query1 = "select * from login";
                    ResultSet m1 = st1.executeQuery(query1); 
                    while(m1.next())
                    {
                        
                       if (m1.getString("username").equals(g)) {
                         flag = 1;
                       %>
                       <script>
                              alert("username already registered");
                      </script> 
                    <%  break;
                      }
                    }    
                        
            if (flag == 0) {
                
                // sending mail to the user
                final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                SecureRandom rnd = new SecureRandom();
                StringBuilder security_string = new StringBuilder(8);
                for (int x = 0; x < 8; x++) {
                    security_string.append(AB.charAt(rnd.nextInt(AB.length())));    // security string which the user needs to enter for login into site
                }

                // Get recipient's email-ID, message & subject-line from index.html page
                final String to = request.getParameter("email");
                final String subject = "Confirmation mail";

                // Sender's email ID and password needs to be mentioned
                final String from = "------";        
                final String pass = "------";   
                // Defining the gmail host

                String host = "smtp.gmail.com";

                // Creating Properties object
                Properties props = new Properties();

                // Defining properties
                props.put("mail.smtp.host", host);
                props.put("mail.transport.protocol", "smtp");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.user", from);
                props.put("mail.password", pass);
                props.put("mail.port", "465");

                // Authorized the Session object.
                Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

                    @Override

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, pass);
                    }

                });
                try {
                    MimeMessage message = new MimeMessage(mailSession);

                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.addRecipient(Message.RecipientType.TO,
                            new InternetAddress(to));

                    // Set Subject: header field
                    message.setSubject(subject);

                    // Now set the actual message
                    StringBuilder s = new StringBuilder();
                    s.append("<div>")
                            .append("  Dear User<br/><br/>")
                            .append("  Thank you for registration. Your mail is under verification<br/>")
                            .append("  Please copy the unique key provided below and paste it in the prompt box after login the site.<br/>")
                            .append("  Key : " + security_string.toString() + "")
                            .append("  <br/><br/>")
                            .append("  Thanks,<br/>")
                            .append("  E-Voting admin")
                            .append("</div>");

                    message.setContent(s.toString(), "text/html; charset=utf-8");
                    // Send message
                    Transport.send(message);

                    //insering the data of the user in student database
                    PreparedStatement k = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)");
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
                    k.setString(11, security_string.toString());
                    k.setString(12, "NO");         // is_activated field to see whether user enters the security key or not
                    k.executeUpdate();
                    session.setAttribute("who", g);       // session variable for storing username 
                    session.setAttribute("who_mail", e);  // session variable for storing mail id of the user
                    session.setAttribute("who_name", a);  // session variablefor storing name of the user
                    response.sendRedirect("verify_key.jsp");
                } catch (MessagingException mex) {

             %><script>alert("Something went wrong..try again");</script><%                                       }
                   }
               } catch (Exception e) {
                %><script>alert("something went wrong...try again");</script><%
               }

           }
        %>   

        <%
            if (request.getParameter("log") != null) {    // if user logins into site
                String a = request.getParameter("Username");
                String b = request.getParameter("Password");
                
                String me = "select * from student where username='" + a + "' and password='" + b + "'";
                Statement k = con.createStatement();
                ResultSet m = k.executeQuery(me);
                if (m.next()) {
                    session.setAttribute("who", a);
                    session.setAttribute("who_mail", m.getString("email"));
                    session.setAttribute("who_name", m.getString("name"));
                    if (m.getString("is_activated").equals("NO")) {   //if user has not complete the security procedure
                        response.sendRedirect("verify_key.jsp");
                    } else {
                        response.sendRedirect("../user/index.jsp");
                    }
                } else {
                    String adm = "select * from login where username='" + a + "' and password='" + b + "'";
                    Statement k_admin = con.createStatement();
                    ResultSet admin = k_admin.executeQuery(adm);
                    if (admin.next()) {
                        session.setAttribute("who_admin", a);
                        response.sendRedirect("../admin/NewFile.jsp");
                    } else {
        %>
        <script>
            <% session.setAttribute("who_admin", null);
               session.setAttribute("who", null);%>
               alert("wrong username or password");
        </script>
        <%
               }
             }
           }
        %> 




</body>
</html>