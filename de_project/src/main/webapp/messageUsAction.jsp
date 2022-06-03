<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String email=(String)session.getAttribute("email");
String sp_email=request.getParameter("sp_email");
String subject=request.getParameter("subject");
String body=request.getParameter("body");
long millis=System.currentTimeMillis();  
java.sql.Date date=new java.sql.Date(millis); 
try{
    Connection con=connectionprovider.getCon();
    PreparedStatement ps=con.prepareStatement("insert into message(cust_email,sp_email,subject,body,date) values(?,?,?,?,?)");
    ps.setString(1,email);
    ps.setString(2,sp_email);
    ps.setString(3,subject);
    ps.setString(4,body);
    ps.setDate(5,date);
    ps.executeUpdate();
    response.sendRedirect("myCart.jsp");
}
catch(Exception e){
    System.out.println(e.getMessage());
    response.sendRedirect("myCart.jsp");

}
%>