<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("fname");
String username=request.getParameter("username");
String email=request.getParameter("email");
String number=request.getParameter("number");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
String gender=request.getParameter("gender");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/authentication", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into nominee (fname,username,email,number,password,cpassword,gender)values('"+fname+"','"+username+"','"+email+"','"+number+"','"+password+"','"+cpassword+"','"+gender+"')");
out.println("Thank you for register ! Please <a href='nomineelogin.jsp'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>




