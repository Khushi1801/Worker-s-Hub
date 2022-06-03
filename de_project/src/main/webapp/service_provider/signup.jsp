<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
      <input type="text" name="uname" placeholder="Enter user name here.." required>
      <input type="email" name="email" placeholder="Enter email here.." required>
      <input type="tel" name="phno" placeholder="Enter phone number here.." pattern="{0-9}[10]" required>
      <input type="date" name="bdate" placeholder="Enter birthdate here.." required>
      <input type="password" name="password" placeholder="Enter password here.." required>
      <select name="city" required>
        <option value="ahmedabad">Ahmedabad</option>
        <option value="anand">Anand</option>
        <option value="surat">Surat</option>
        <option value="vadodara">Vadodara</option>
      </select>
      <select name="service" required>
        <option value="electrician">Electrician</option>
        <option value="plumber">Plumber</option>
        <option value="painter">Painter</option>
        <option value="dataentry">Data entry</option>
      </select>
      <select name="mode" required>
        <option value="offline">Offline</option>
        <option value="online">Online</option>
      </select>
      <input type="submit" value="signup">
    </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysignsp'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h1>Successfully Registerd</h1>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h1>Some thing Went Wrong! Try Again !</h1><% } %>

    <h2 style="text-align:center">Workers Hub</h2>
    <p>The Online platorm to get all your services done in few steps!!!!</p>
    <img style="display: block;margin-left: auto;margin-right: auto;width:300px" src='../images/hub.jpeg' /> 
  </div>
</div>

</body>
</html>