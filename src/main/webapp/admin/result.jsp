<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" type="text/css" href="button.css">
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script>
        $(function() {
            $('a').click(function() {
                $('#tar').load($(this).attr('href'));
                return false;
            });
        });
    
        </script>
        
        
        <meta charset="ISO-8859-1">
<link rel="icon" href="image/logo1.png">
<title>IICMR COLLEGE ADMIN</title>

<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard Admin</title>
        <link href="styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>


		<link rel="stylesheet" type="text/css" href="button.css">
    </head>
    <%
        if (session.getAttribute("who_admin") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body class="sb-nav-fixed">
    
    
    
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="NewFile.jsp">ADMIN PANEL</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
              
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        
                        <a class="dropdown-item" href="log.jsp">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="NewFile.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                           

                            <div class="sb-sidenav-menu-heading">Addons</div>
                           <!--  <a class="nav-link" href="selectnominee.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Select Nominee List
                            </a> -->
                            <a class="nav-link" href="admin_new.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Add New Admin
                            </a>
                            
                            <a class="nav-link" href="election_new.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Add New Election
                            </a>                                                  
                            
                            <a class="nav-link" href="search_new.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Search
                            </a>
                            
                            <a class="nav-link" href="authenticate_new.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Authenticate
                            </a>
                            
                            <a class="nav-link" href="result.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Result
                            </a>
                           
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                    <%=session.getAttribute("who_admin")%> (ADMIN)
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            <main>
          
            
            
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String ename = request.getParameter("ename");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ladmin";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
 
<center>
<h4>ELECTION TABLE WITH DETAILS</h4>

<small style="color:Tomato;">Here Any ADMIN Can Start Display The Election Result...</small>

<table  border="3" color="red" cellpadding="3">
<tr>
<td>id</td> 
<td>Name</td>
<td>Date</td>
<td>Time</td>
<td>Details</td>
<td>Result</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from elections";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<center>
<tr>
<td><%=resultSet.getInt("id") %></td> 
<td><%=resultSet.getString("ename") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("time") %></td>
<td><%=resultSet.getString("details") %></td>
<td><%=resultSet.getString("res_declared") %></td>
<td><a href="update_result.jsp?id=<%=resultSet.getInt("id")%>">update</a></td>
</tr>
</center>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>
    
   </div>
                  
        </form>  
        <% }%>
        </main>
        </br>
         
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    
    

    </body>
</html>
