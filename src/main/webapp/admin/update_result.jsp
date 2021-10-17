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

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ladmin","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String ename,date,result;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		ename=request.getParameter("txt_name");  //txt_name
		date=request.getParameter("txt_owner"); //txt_owner
		result=request.getParameter("result");
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update elections set res_declared=? where id=?"); //sql update query 
		pstmt.setString(1,result);		
		pstmt.setInt(2,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>JSP:Insert, Update, Delete using MySQL</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>	
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				
				var result = document.myform.result;			
				if (result.value == "")
				{
					window.alert("please enter result value to YES/NO ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
<body>

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>Result Update</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ladmin","root",""); // create connection  
	
			if(request.getParameter("id")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("id"));
		
				String name,date,result;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from elections where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					name=rs.getString(2);
					date=rs.getString(3);
					result=rs.getString(7);
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_name" value="<%=name%>" disabled></td>
			</tr>
			
			<tr>
				<td>Date</td>
				<td><input type="text" name="txt_owner" value="<%=date%>" disabled></td>
			</tr>
			<tr>
				<td>Result</td>
				<td><input type="text" name="result" value="<%=result%>" >  YES/NO*</td> 
			</tr>	
			
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<center>
				<h1><a href="result.jsp">Back</a></h1>
		</center>
		
	</form>

	</div>
	
		<center>
				
		</center>

</body>

</html>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
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