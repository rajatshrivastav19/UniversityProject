<html>
    <head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="Admin.css">
    <link rel="stylesheet" href="STUDENT.css">
    <nav>
        <img src="https://th.bing.com/th/id/OIP.snwpVqOyzR33lof7yvu0_wHaHa?pid=Api&rs=1" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
          <ul>
              <li><a href="../index.html">HOME</a></li>
              <li><a href="#">ADMIN</a></li>
          </ul>
          <img src="https://th.bing.com/th/id/OIP.zA0l738afu1lYbnXVVOh4wHaER?pid=Api&rs=1" height="120" width="130" align="left">
  </nav>
  </head>
  <body>
<div class="login">
  <h1>Admin Login</h1>
    <form method="post" action="AdminController.jsp">
    <input type="hidden" name="page" value="adminpage">
    <p>Lonin Id*<input type="text" name="AdminID" placeholder="Email"></p>
    <p>Password*<input type="password" name="password" placeholder="Password"></p>  
    <p class="remember_me">
      <label>
        <input type="checkbox" name="remember_me" id="remember_me">
        Remember me on this computer
      </label>
    </p>
    <p class="submit"><input type="submit" name="commit" value="Login"></p>
  </form>
</div>
<div class="login-help">
  <p>Forgot your password? <a href="#">Click here to reset it</a>.</p>
</div>
</body>
</html>