<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title> Registration Form Nominee </title>
    <link rel="stylesheet" href="nominee.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="logo1.png">
    
    <script type="text/javascript">
    
    function first(){
    	var p=document.sample.password.value;
    	var p1=document.sample.cpassword.value;
    	if(p==p1){
    	return true;
    	}
    	else{
    	alert("password are not equal!");
    	return false;
    	}
    	}
 
    </script>

   </head>
<body>

  <div class="container">

	 <div id="top">
 
    <div class="title"> <a href="index.html"><img src="logo1.png" alt="college logo" width="80px" height="70px"></a><center>Nominee Registration</center></div></div>
    <div class="content">
      <form name="sample" action="nominee1.jsp" method="post" onsubmit="return first();">
        <div class="user-details">
          
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" placeholder="Enter your name" name="fname" required>
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" placeholder="Enter your username" name="username" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your email" name="email" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your number" name="number" required>
          </div>
	
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" placeholder="Enter your password" name="password" required>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" placeholder="Confirm your password" name="cpassword" required>
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" value="male" id="dot-1">
          <input type="radio" name="gender" value="female" id="dot-2">
          <input type="radio" name="gender" value="other" id="dot-3">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender" name="gender" value="male">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender"name="gender" value="female">Female</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender"name="gender" value="other">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register" name="submit">
		<a id="bottomlink" href="nomineelogin.jsp">Already a user</a>
        </div>
  
      </form>
    </div>
  </div>

</body>
</html>
