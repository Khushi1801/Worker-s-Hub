<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2><br>
 <h2 style="color:white;text-align:center;">Message</h2>

<%
String sp_email=request.getParameter("id");
%> 
<form action="messageUsAction.jsp" method="post">
<input class="input-style" name="sp_email" type="text" value="<% out.print(sp_email); %>" readonly>
<hr>
<input class="input-style" name="subject" type="text" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter your message here......." required> </textarea>
<hr>
<button class="button" type="submit">Send </button>
</form>     

      <br>
      <br>
      <br>
 </body>
 </html>