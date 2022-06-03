<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="serviceProviderHeader.jsp" %>
<%@include file="../footer.jsp" %>
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
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Customer Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
            <th scope="col">Date</th>
          </tr>
        </thead>
        <tbody>
<%
String sp_email=(String)session.getAttribute("email");
try{
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from message where sp_email='"+sp_email+"' order by date DESC");
  while(rs.next()){
%>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><%= rs.getString(6) %></td>
          </tr>
<%
  }
}
catch(Exception e){
  System.out.println(e.getMessage());
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>