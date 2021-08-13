<%@page import="com.ctl.entities.User"%>
<% 
User user=new User();

%>
<nav class=" navbar  navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand " href="index.jsp"><span class="fa fa-handshake-o"></span>CLT</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            
          <!--  <li class="nav-item">
                <a class="nav-link" href="#"> <span class="fa fa-address-card-o"></span>Contact Us</a>
            </li>
           --> 
            <li class="nav-item active">
                <a class="nav-link" href="Sign Up.jsp"> <span class="fa fa-user-plus "></span>Sign Up</a>
            </li>
             <li class="nav-item active">
                <a class="nav-link" href="Login.jsp"> <span class="fa fa-user-circle "></span>Login</a>
            </li>
            
            
             <li class="nav-item active">
                <a class="nav-link" href="Profile.jsp"> <span class="fa fa-user-circle" ></span>Profile</a>
            </li>
        </ul>
       
         
        
    </div>
</nav>
