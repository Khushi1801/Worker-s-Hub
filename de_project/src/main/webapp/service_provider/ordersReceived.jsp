<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="serviceProviderHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<%
response.setIntHeader("Refresh", 15);
%>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
String msg=request.getParameter("msg");
if("canacel".equals(msg)){
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<% } %>
<%
if("delivered".equals(msg)){
%>
<h3 class="alert">Order Delivered Successfully!</h3>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>

<table id="customers">
          <tr>
            <th scope="col">Package ID</th>
            <th scope="col">Package Name</th>
            <th scope="col">Customer Name</th>
            <th scope="col">Customer Email</th>
            <th scope="col">Order Date</th>
            <th scope="col"><i class="fa fa-inr"></i>Total Amount</th>
            <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
            <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
<%
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("SELECT * FROM orders JOIN packages ON orders.package_id = packages.id and orders.status='null' JOIN users ON orders.cust_email = users.email");
  while(rs.next()){
%>
       
          <tr>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(14) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(5) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(12) %> </td>
            <td><a href="cancelOrdersAction.jsp?id=<%= rs.getString(1) %>">Cancel <i class='fas fa-window-close'></i></a></td>
            <td><a href="deliveredOrdersAction.jsp?id=<%= rs.getString(1) %>">Delivered <i class='fas fa-dolly'></i></i></a></td>
          </tr>
<%
  }
}
catch(Exception e){
  System.out.println(e);
}  
%>      
        </table>
      <br>
      <br>
      <br>

</body>
</html>