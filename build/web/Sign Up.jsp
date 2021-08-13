

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name=”viewport” content=”width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
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

        <main class=" primary-background banner-background " id="signUp">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-user-circle fa-3x"> </span>
                                <br>
                                <p>Sign Up here</p>

                            </div>
                            <div class="card-body">
                                <form action="RegisterServlet" method="POST" id="reg-form">

                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label  for="gender">Gender</label>
                                        <br>
                                        <input type="radio" id="gender" name="gender" value="Male">Male
                                        <input type="radio" id="gender" name="gender" value="Female">Female
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" name="about" id="about" rows="5" placeholder="Enter somrthing about yourself"></textarea>

                                    </div>
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Terms and conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display:none;">
                                        <span class="fa fa-refresh fa-3x fa-spin"></span>
                                        <p>Please wait...</p>
                                    </div>
                                    <div class="container text-center">
                                    <button id="sumbit-btn" type="submit" class="btn text-white primary-background">Sign Up</button>
                                    </div>
                                </form>
                            </div>


                        </div>

                    </div>

                </div>

            </div>
        </main>



        <!--javascript-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("Loaded.....");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#sumbit-btn").hide();
                    $("#loader").show();

                    //sending data to register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#sumbit-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done') {
                                swal("Registration done successfully. Please click ok to login.")
                                        .then((value) => {
                                            window.location ="Login.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong... try again");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>
    </body>
</html>
