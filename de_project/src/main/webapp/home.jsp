<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert">Package added successfully!</h3>
<% } %>
<%
if("exist".equals(msg)){
%>
<h3 class="alert">Item already exist in you cart! Quantity  increased!</h3>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<% } %>
<br>
<br>
<h2 style="color:white;text-align:center;">Offline service Providers</h2>
<table>
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">City</th>
            <th scope="col">Profession</th>
            <th scope="col">Packages</th>
          </tr>
        </thead>
        <tbody>
<%
String city=(String)session.getAttribute("city");
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from serviceprovider where mode='offline'and city='"+city+"'");
  while(rs.next())
  {
%>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><a href="packages.jsp?id=<%= rs.getString(2) %>">Packages</a></td>
          </tr>

<%
  }
}
catch(Exception e){
  System.out.print(e.getMessage());
}
%>          

        </tbody>
      </table>
      <br>
      <hr>
      <br>
<h2 style="color:white;text-align:center;">Online service Providers</h2>
<table>
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">City</th>
            <th scope="col">Profession</th>
            <th scope="col">Packages</th>
          </tr>
        </thead>
        <tbody>
<%
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from serviceprovider where mode='online' and city='"+city+"'");
  while(rs.next())
  {
%>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(6) %></td>
            <td><%= rs.getString(7) %></td>
            <td><a href="packages.jsp?id=<%= rs.getString(2) %>">Packages</a></td>
          </tr>

<%
  }
}
catch(Exception e){
  System.out.print(e.getMessage());
}
%>          

        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
</html>