<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>

<%
String email=(String)session.getAttribute("email");
String id=request.getParameter("id");
String sp_email="";
long millis=System.currentTimeMillis();  
java.sql.Date date=new java.sql.Date(millis); 

int var=0;
try{
    Connection con=connectionprovider.getCon();

    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from packages where id='"+id+"'");
    while(rs.next()){
        sp_email=rs.getString(2);
    }

    PreparedStatement ps=con.prepareStatement("insert into orders(`cust_email`,`sp_email`,`package_id`,`order_date`,`status`,`rating_status`) values(?,?,?,?,?,?)");
    ps.setString(1,email);
    ps.setString(2,sp_email);
    ps.setString(3,id);
    ps.setDate(4,date);
    ps.setString(5,"null");
    ps.setString(6,"null");
    ps.executeUpdate();
    response.sendRedirect("home.jsp?msg=added");
}
catch(Exception e){
    System.out.print(e.getMessage());
    response.sendRedirect("home.jsp?msg=invalid");
}
%>