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
 <h2><a class="back" href="home.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2><br>
 <h2 style="color:white;text-align:center;">Basic Details</h2>
<table>
        <tbody>
<%
String sp_email=request.getParameter("id");
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from serviceprovider where email='"+sp_email+"'");
  while(rs.next())
  {
%>
          <tr>
            <td><b>Name</b></td>
            <td><%= rs.getString(1) %></td>
          </tr>
          <tr>
            <td><b>Email</b></td>
            <td><%= rs.getString(2) %></td>
          </tr>
          <tr>
            <td><b>Birth Date</b></td>
            <td><%= rs.getString(4) %></td>
          </tr>
          <tr>
            <td><b>Phone No.</b></td>
            <td><%= rs.getString(5) %></td>
          </tr>
          <tr>
            <td><b>City</b></td>
            <td><%= rs.getString(6) %></td>
          </tr>
          <tr>
            <td><b>Profession</b></td>
            <td><%= rs.getString(7) %></td>
          </tr>
          <tr>
            <td><b>Working Mode</b></td>
            <td><%= rs.getString(8) %></td>
          </tr>
          <tr>
            <td><b>Rating</b></td>
            <td><%= rs.getString(9) %></td>
          </tr>
          <tr>
            <td><b>No of Rating</b></td>
            <td><%= rs.getString(10) %></td>
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
<h2 style="color:white;text-align:center;">Packages</h2>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Discription</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from packages where sp_email='"+sp_email+"' and active='yes'");
  while(rs.next())
  {
%>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(5) %> </i></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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