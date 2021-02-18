<!DOCTYPE html> 
<html> 

        <link rel="stylesheet" href="StudentFront.css">
       <nav>
        <img src="logoblue.jpg" height="120" width="140" align="right">
          
                <input type="checkbox" id="click">
                <label for="click" class="menu-btn">
                    <i class="fas fa-bars"></i>
                </label>
              <ul>
                  <li><a href="../index.html">HOME</a></li>
                  <li><a href="LoginStudentForm.html">STUDENT LOGIN</a></li>
                  <li><a href="StudentRegistrationPage.html">REGISTRATION</a></li>
                  <li><a href="#">FORGET PASWORD</a></li>
                  <li><a href="#">ALUMINI</a></li>
              </ul>
              <img src="Phule.jpg" height="120" width="130" align="left">
        </nav> 
        <style>
  body {
         background-color: #FFB330;
     }
     .maindiv
     {
          width: 1300px; 
          height: 650px;
          position: absolute;
          left:50%;
          top: 50%;
          transform: translate( -50% , -45%);
          box-shadow: 1px 2px 10px 5px white;
          
          background-image: url('unnamed.jpg');
          background-image: url('https://img.jagranjosh.com/imported/images/E/Articles/Graphic-Era-University-in-the-Top-100-Universities-of-the-Nation-Body-Images.jpg');
          background-image: url('https://lh3.googleusercontent.com/proxy/SjFU7E8kVTM0TME5BY5zkebEILm3yi9vDOWwuqVOFtamsFsVIxEDqSa5Rgcs-_vVwfif6EqSOG_w7hNvTBJgTVVz');
          background-size: 100% 100%;
          animation: slider 3s infinite linear;
     }

     @keyframes slider{

      0%{ background-image: url('unnamed.jpg');  }
      35%{ background-image: url('https://img.jagranjosh.com/imported/images/E/Articles/Graphic-Era-University-in-the-Top-100-Universities-of-the-Nation-Body-Images.jpg');  }
      70%{ background-image: url('https://www.geu.ac.in/content/dam/geu/Image-Galleries/HeaderFiles/aerial-view-geu.jpg'); }
      90%{ background-image: url('https://lh3.googleusercontent.com/proxy/SjFU7E8kVTM0TME5BY5zkebEILm3yi9vDOWwuqVOFtamsFsVIxEDqSa5Rgcs-_vVwfif6EqSOG_w7hNvTBJgTVVz'); }
     }
  </style>
<body> 
    <form action="#"> 
        <h2 align="center">Login Form</h2>
        <div class="imgcontainer"> 
            <img src= "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png" alt="Avatar" class="avatar"> 
        </div> 
        <div class="container">
            <label><b>Username*</label> 
            <input type="text" placeholder="Enter Email" name="uname" required> </b>
            <label><b>Password*</label> 
            <input type="password" placeholder="Enter Password" name="psw" required> </b>
            <button type="submit">Login</button>    
        </div> 
        <div class="container" style="background-color:#f1f1f1"> 
            <button type="button" class="cancelbtn">Cancel</button> 
            <span class="psw">Forgot <a href="#">password?</a></span> 
        </div> 
    </form> 
</body> 
</html> 