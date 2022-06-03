<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*,java.io.*"%>
<%
int id=0;
String email=(String)session.getAttribute("email");
String name=request.getParameter("name");
String discription=request.getParameter("discription");
String price=request.getParameter("price");
String active=request.getParameter("active");
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select max(id) from packages");
    while(rs.next()){
        id=rs.getInt(1);
        id=id+1;
    }
    PreparedStatement ps=con.prepareStatement("insert into packages values(?,?,?,?,?,?)");
    ps.setInt(1,id);
    ps.setString(2,email);
    ps.setString(3,name);
    ps.setString(4,discription);
    ps.setString(5,price);
    ps.setString(6,active);
    ps.executeUpdate();
    response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e){
    System.out.print(e.getMessage());
    response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>