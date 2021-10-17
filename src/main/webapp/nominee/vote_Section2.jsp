

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voters Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="../admin/button.css" />
        
        
        <style>

			.mylabel{color: white;}
			
			.required {color: red;}
		</style>
        
        
        <script>
            var request;
            function enterInfo() {
                var e = document.getElementById("election");
                var ele = e.options[e.selectedIndex].text;
                ele = ele.replace(/\s/g,'');  
                var name= document.add.name.value;
                var dez = document.add.designation.value;
                var des = document.add.description.value;
                var contact = document.add.contact.value;
                var motto = document.add.motto.value;

                var url = "new_candidate.jsp?x=" +ele +"&y="+name+"&z="+dez+"&w="+des+"&h="+contact+"&q="+motto;
                
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
    <%
        if (session.getAttribute("login") == null) {
            response.sendRedirect("index.jsp");
        } else {%>
    <body>

        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="getcon_ladmin.jsp"%>
        <%@ include file="getcon_auth.jsp"%>

        <div id="main"  style="padding-bottom: 30px;">
            <div id="header" style="margin-left: 0px;margin-right: 0px">
                <div id="banner">
                    <div id="welcome">
                        <h1 style="float: left">Your vote Your choice</h1>
                    </div><!--close welcome-->
                    <div id="welcome_slogan">
                        <h1>Welcome <%=session.getAttribute("login1")%></h1>
                    </div><!--close welcome_slogan-->
                </div><!--close banner-->
            </div><!--close header-->

            <div id="menubar">
                <ul id="menu">
                    <li><a id="a" href="index.jsp">Home</a></li>
                    <li class="current"><a id="c" href="voters_corner.jsp">Apply For</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="about_section.jsp">About Us</a></li>
                    <li><a href="log.jsp">Log out</a></li>
                </ul>
            </div><!--close menubar-->	

            <div id="site_content">		

                <div class="sidebar_container">       
                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h2>New Website</h2>

                            <p>Welcome to our website. Please have a look around, any feedback is much appreciated.</p>
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->     		
                    <div class="sidebar">
                        <div class="sidebar_item">


                            <h2>Latest Update</h2>
                            <h3>January 2021</h3>
                            <p>A very happy new year to all .May this year brings lots of happiness and craziness.</p>         
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->
                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h3>Fee deposit</h3>
                            <p>Deposit the fee for the even semester from Jan 2 - Jan 9 in your respective departments.</p>        
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->  

                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h2>Contact</h2>
                            <p>Phone: +91 91564-57442</p>
                            <p>Email:aniketpatilap1002@gmail.com</p>
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->
                </div><!--close sidebar_container-->	
                <div id="content" style="border-left: 1px solid grey; height:700px">

                    <!-- <div style="text-align: center;padding:20px;border-radius: 25px;width: 400px;height: 130px; margin: 200px auto;border:2px solid white">
 -->
 
 <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
         

      <%  
           try{  
                         String a1="select ename from elections ";
                         Statement k1=con.createStatement();
                         ResultSet m1=k1.executeQuery(a1);  
                         
      %>                   
        <form name="add">
            <table style="padding:20px;padding-bottom: 10px;">

            <tr>    
                <td style="width:100px">  <label class="mylabel">Election<span class="required">*</span></label> </td>
                <td style="width:600px">
                    <select id="election" style="width:200px">
                        
            <%
                   while(m1.next()){    %>    
                   <option value="<%=m1.getString("ename")%>"><%=m1.getString("ename")%></option>
                   <%
                    }
                 }
                 catch(Exception e)
                 {
                 e.printStackTrace();
                 }
            %>        
                    </select>
                </td>  
            </tr>
            <tr>
                <td style="width:100px"><label class="mylabel">Name<span class="required">*</span></label></td>
                <td><input type="text" name="name" value="<%=session.getAttribute("login1")%>" style="height:30px;width:365px"></td>
            </tr>
            <tr>
                <td><label class="mylabel">Designation<span class="required">*</span></label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add designation" name="designation"></textarea></td>
            </tr>
            <tr>
                <td><label class="mylabel">Description<span class="required">*</span></label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add description" name="description"></textarea></td>
            </tr>
            <tr>
                <td><label class="mylabel">Contact<span class="required">*</span></label></td>
                <!-- <td><textarea cols="50"   placeholder="Add contact" name="contact"></textarea></td> -->
                <td><input type="text" name="contact" placeholder="Add contact"style="height:30px;width:365px"></td>
            </tr>
            <tr>
                <td><label class="mylabel">Motto<span class="required">*</span></label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add motto" name="motto"></textarea></td>
            </tr>
             <tr>
                  <td colspan=2 style="padding-left:300px;padding-top: 10px"><input type="button" value="ENTER" onclick="enterInfo()"></td>
                </tr>
            </table>
        </form>
        
        
    <div class="mylabel" style="padding-left: 100px;font-size: 20px;"> Status  : <span id="info" style="padding-left: 20px">none</span>  </div>
                       
                    </div>
                </div>
            </div><!--close site_content--> 
        </div><!--close main-->
        
        
        
        
        
         

    </body>
    <%}%>
</html>
