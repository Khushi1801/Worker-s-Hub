<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String status="delivered";
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("update orders set status='"+status+"' where order_id='"+id+"'");
    response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
    System.out.print(e);
    response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>