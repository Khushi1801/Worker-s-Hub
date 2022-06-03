
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String email=(String)session.getAttribute("email"); %>
            <center><h2>Workers Hub</h2></center>
            <h2><a href=""><% out.print(email); %></a></h2>
            <a href="addNewProduct.jsp">Add New Package </a>
            <a href="allProductEditProduct.jsp">All Package & Edit Package </a>
            <a href="messagesReceived.jsp">Messages Received </a>
            <a href="ordersReceived.jsp">Orders Received </a>
            <a href="cancelOrders.jsp">Cancel Orders </a>
            <a href="deliveredOrders.jsp">Completed Orders </a>
            <a href="../logout.jsp">Logout </a>
          </div>
           <br>
           <!--table-->
