
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Admin Page</title>
        <link rel="stylesheet" type="text/css" href="button.css">
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script>
        function a(t){
              document.getElementById('f').innerHTML=t;
            }
        
        function verify(){
            var request;
                var roll = document.getElementById('f').innerHTML;
                var elec = document.getElementById('e').innerHTML;
                var url = "authenticate3.jsp?x=" + elec+"&y="+roll;
         
                
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('info').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
            
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
        
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_auth.jsp"%>
        
         <div style="margin: 20px">

         <table border="3" color="red" cellpadding="3">
            <tr><th>username  </th>
                <th>rollno  </th>
                <th>branch</th>
                <th>email</th>
                <th>is_eligible</th>
                <th>is_voted</th>
            </tr>
        
        
        <%
            try{
             String h=request.getParameter("v"); //getting the election name
            %>
            <div id="e"><%
            out.println(h); 
            %>
            </div>
             
            
    <%
             Statement k=con1.createStatement();
             String query="select * from "+h;
             ResultSet m=k.executeQuery(query);
             %>
                 
             <%    
             while(m.next())
             {
                String f=m.getString("rollno");
                %>
               <tr> <td><%=m.getString("username") %> </td>
                <td> <%=m.getString("rollno") %> </td>
                <td> <%=m.getString("branch") %> </td>
                <td> <%=m.getString("email") %> </td>
                <td> <%=m.getString("is_eligible") %> </td> 
                <td> <%=m.getString("is_voted") %> </td>  
                <td><button id="<%=m.getString("rollno")%>" onclick="a(this.id)">select</button></td>
               </tr> 
               <% 
                 
             }  %>
             
             </table> 
             <br>
             <br>
             roll no :
             <div id="f">no selection yet</div><br><br>
             
             <form name="auth">
              <input type="button" value="proceed to authenticate" onclick="verify()">
             </form>  
             
     <div style="padding-left: 30px;font-size: 15px;"> Status  : <span id="info" style="padding-left: 20px">none</span>  </div>

        <%
       }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        %>
  
            </div>
            </main>
        
         <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
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
