<%@page import="project.connectionprovider"%>
<%@page import="java.sql.*"%>
<%@include file="serviceProviderHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Item</title>
</head>
<body>

<% String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Package Added Successfully!</h3>
<% } %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>


<% 
int id=1;
try{
    Connection con=connectionprovider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select max(id) from packages");
    while(rs.next()){
        id=rs.getInt(1);
        id=id+1;
    }
}
catch(Exception e){
    System.out.print(e.getMessage());
}
%>

<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Package ID: <%out.println(id); %> </h3>

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Package name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Discription</h3>
 <input class="input-style" type="text" name="discription" placeholder="Enter Package discription" required>
<hr>
</div>

<div class="left-div">
<h3>Enter price</h3>
 <input class="input-style" type="number" name="price" placeholder="Enter Package price" required> 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
    <option value="yes">Yes</option>
    <option value="no">No</option>
</select>
<hr>
</div>

<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>