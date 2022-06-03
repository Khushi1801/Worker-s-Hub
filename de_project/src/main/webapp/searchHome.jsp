<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
int var=0;
String city=(String)session.getAttribute("city");
try{
  String search=request.getParameter("search");
  Connection con=connectionprovider.getCon();
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery("select * from serviceprovider where (name like '%"+search+"%' or profession like '%"+search+"%' or mode like '%"+search+"%') and city='"+city+"'");
  while(rs.next())
  {
    var=1;
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
<%
if(var==0){
%>      	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
<% } %>	
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>