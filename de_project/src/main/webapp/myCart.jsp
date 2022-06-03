<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
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
<div style="color: white; text-align: center; font-size: 30px;">Pending Orders <i class='fas fa-cart-arrow-down'></i></div>

<table id="customers">
          <tr>
            <th scope="col">Package ID</th>
            <th scope="col">Package Name</th>
            <th scope="col">Provider Name</th>
            <th scope="col">Provider Email</th>
            <th scope="col">Order Date</th>
            <th scope="col"><i class="fa fa-inr"></i>Total Amount</th>
            <th scope="col">Message</th>
          </tr>
<%
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("SELECT * FROM orders JOIN packages ON orders.package_id = packages.id and orders.status='null' JOIN serviceprovider ON orders.sp_email = serviceprovider.email order by orders.order_date ASC");
  while(rs.next()){
%>
       
          <tr>
            <td><%= rs.getString(4) %> </td>
            <td><%= rs.getString(10) %></td>
            <td><%= rs.getString(14) %></td>
            <td><%= rs.getString(3) %></td>
            <td><%= rs.getString(5) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(12) %> </td>
            <td><a href="message.jsp?id=<%= rs.getString(3) %>"> Message </a></td>
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