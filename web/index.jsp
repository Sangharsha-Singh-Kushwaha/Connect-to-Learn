<%@page import="com.ctl.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name=”viewport” content=”width=device-width, initial-scale=1.0">
        <title>Welcome</title>
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

        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background " >
            <div class="jumbotron text-white  primary-background ">
                <div class="container text-center ">
                    <h1>Welcome to CTL</h1>
                    <p>We welcome of every one who want learn and share their knowledge to other. Connect to Learn provides best platform to share and gain your knowledge.</p>
                    <a href="Sign Up.jsp" class="btn btn-outline-light  btn-lg "><span class="fa fa-user-plus"></span>Start ! its Free</a>
                    <a href="Login.jsp" class="btn btn-outline-light  btn-lg text-body "><span class="fa fa-user-circle fa-spin"> </span>Login</a>
                </div>

            </div>

        </div>

        <!--card-->
        <div class="container mb-3" id="post_container">




        </div>

    </div>



    <!--javascript-->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>


    <script>

        function getPosts(catId, temp) {
            $("#loader").show();
            $("#post_container").hide();
            $(".c-link").removeClass("active");
            $.ajax({
                url: "Load_Post.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#loader").hide();
                    $("#post_container").show();
                    $("#post_container").html(data);
                    $(temp).addClass("active");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Error!", "Something went wrong try again..", "error");
                }
            })
        }
        $(document).ready(function (e) {
            let allpostRef = $(".c-link")[0]
            getPosts(0, allpostRef);

        })
    </script>
</body>
</html>
