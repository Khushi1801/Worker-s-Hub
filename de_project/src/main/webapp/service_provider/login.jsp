
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="loginAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter email here.." required>
      <input type="password" name="password" placeholder="Enter password here.." required>
      <input type="submit" value="login">
    </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
<%
String msg=request.getParameter("msg");
if("notexist".equals(msg)){
%>
<h1>Incorrect Username or Password</h1>
<% } %>
<%
if("invalid".equals(msg)){
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% } %>
       <h2 style="text-align:center">Workers Hub</h2>
    <p>The Online platorm to get all your services done in few steps!!!!</p>
  </div>
</div>

</body>
</html>