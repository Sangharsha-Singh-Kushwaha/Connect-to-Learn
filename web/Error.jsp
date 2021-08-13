<%-- 
    Document   : Error
    Created on : 19-Jul-2021, 7:11:34 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
         <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 84%, 64% 98%, 23% 80%, 0 96%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--Navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <div class="container text-center">
            <img src="img/computera.png" class="img-fluid" id="error">
            <h3>Sorry ! something went wrong...</h3>
            <%= exception%>
            
            
        </div>
            <div class="container text-center">
              <a href="index.jsp" class="btn primary-background  text-white mt-3">Home</a>  
            </div>
    </body>
</html>
