<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
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
        <script>
            var request;
            function searchInfo() {
                var value = document.search.myList.value;
                var user = document.search.username.value;
                var name = document.search.name.value;
                var rollno = document.search.rollno.value;
                var course= document.search.course.value;
                var branch = document.search.branch.value;

                var url = "search.jsp?x=" + value+"&y="+user+"&z="+name+"&w="+rollno+"&q="+course+"&r="+branch;
         
                
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
            
            function searchInfo2() {
                var val = document.search2.check.value;
                var url = "display.jsp?x=" + val;
         
                
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
               
                   
                    <center><h1>SEARCH AND DISPLAY INFORMATION</h1></center><hr>
                  
              <div style="height:80%">        
      <!-- first div -->        
      <div style="float:left;width: 50%;">    
          <form name="search">
                   
            <label class="mylabel" style="color:blue">Search user by &nbsp;</label>
              
            <select name = "myList" style="width: 180px; height: 25px">
               <option value = "1" >Username</option>
               <option value = "2">Name</option>
               <option value = "3">Rollno</option>
               <option value = "4">Course</option>
               <option value = "5">Branch</option>
               <option value = "6">All</option>
            </select>
              
              <br><br>

       
             <label class="mylabel"><U>ENTER :</u></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <br><br>
            <label class="mylabel" >Username :</label> <input type="text" name="username" value="" style="height:30px;width:190px"> <br><br>
            <label class="mylabel">Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label> <input type="text" name="name" value="" style="height:30px;width:190px"> <br><br>
            <label class="mylabel">Rollno &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label> <input type="text" name="rollno" value="" style="height:30px;width:190px"> <br><br>
            <label class="mylabel">Course &nbsp;&nbsp;&nbsp;&nbsp;:</label> <input type="text" name="course" value="" style="height:30px;width:190px"> <br><br>
            <label class="mylabel">Branch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label> <input type="text" name="branch" value="" style="height:30px;width:190px"> <br><br>
            <br>
            
            <input style="margin-left: 100px"  type="button" value="Search" onclick="searchInfo()">
          </form>    
          </div>
        <!-- end of first div -->     
      
        
       <!-- second div -->     
         <div style="float:left;width: 40%;">
           <form name="search2">  
            <input type="radio" name="check" value="Admin_info"  style="height:20px;width:50px;" ><label class="mylabel">Display Admin Information</label><br>
             <br> 
            <input type="radio" name="check" value="Election_info" style="height:20px;width:50px;"><label class="mylabel">Display Election Information</label><br>
             <br>
            <input type="button" onclick="searchInfo2()" value="Display">
          </form>
        </div>  
       <!-- end of second div -->
        
    </div>
      
              <div style="padding: 10px">  <span id="info" style="padding-left: 10px"></span>  </div>
 
                    
                   
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
