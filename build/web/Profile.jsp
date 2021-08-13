<%@page import="com.ctl.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ctl.entities.Category"%>
<%@page import="com.ctl.helper.ConnectionProvider"%>
<%@page import="com.ctl.dao.PostDao"%>
<%@page import="com.ctl.entities.Message"%>
<%@page import="com.ctl.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="Error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name=”viewport” content=”width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 84%, 64% 98%, 23% 80%, 0 96%, 0 0);
            }
            
             
        </style>
    </head> 
    <body id="main_body">


        <nav class=" navbar  navbar-expand-lg navbar-dark primary-background">
            
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-handshake-o"></span>CLT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <!--
                    <li class="nav-item">
                        <a class="nav-link " href="#"> <span class="fa fa-address-card-o"></span>Contact Us</span></a>
                    </li>
                -->
                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#post_Modal"> <span class="fa fa-asterisk"></span>Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span><%= user.getName()%></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link " href="Logout"> <span class="fa fa-sign-out "></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <%
            Message m = (Message) session.getAttribute("msg");

            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%> text-center" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }

        %>


        <!-- main body of page-->
        <main>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-md-3 ">
                        <div class=" list-group mt-3 ">
                            <a href="#" class="c-link list-group-item list-group-item-action active " onclick="getPosts(0,this) ">
                                All Posts
                            </a>

                            <%                                PostDao postdao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = postdao.getAllCategories();
                                for (Category c1 : list1) {


                            %>   
                            <a href="#" class="c-link list-group-item list-group-item-action" onclick="getPosts(<%= c1.getCid() %>,this)"><%= c1.getName()%> </a>
                            <%
                                }


                            %>



                        </div>

                    </div>
                        <div class="col-xs-12 col-md-9 ">
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin mt-3"> </i>
                            <h4 class="mt-2">Loading...Please wait</h4>
                           
                            
                        </div>
                         <div class="container-fluid mb-3" id="post_container">
                                
                            </div>

                    </div>
                </div>
            </div>


        </div>

    </main>

    <!--Profile modal-->

    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background  text-white">
                    <h5 class="modal-title " id="exampleModalLabel">CTL</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img src="profile/<%= user.getProfile()%>" class="fluid" style="border-radius: 50%; max-width: 100px;">

                    <h5 class="modal-title mt-3 mb-3" id="exampleModalLabel"><%= user.getName()%></h5>
                    <!--details-->
                    <div id="profile-details">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">About : </th>
                                    <td><%= user.getAbout()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Registered on : </th>
                                    <td><%= user.getDateTime()%></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--profile edit-->
                    <div id="profile-edit" style="display: none;">
                        <h5 class="mt-3">Edits Here</h5>
                        <form action="EditServlet" method="Post" enctype="multipart/form-data">
                            <table class="table">

                                <tr> 
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td>

                                </tr>

                                <tr> 
                                    <th scope="row">Name :</th>
                                    <td><input type="text" name="user_name" value="<%= user.getName()%>" class="form-control"> </td>

                                </tr>
                                <tr> 
                                    <th scope="row">Email :</th>
                                    <td><input type="email" name="user_email" value="<%= user.getEmail()%>" class="form-control"> </td>

                                </tr>
                                <tr> 
                                    <th scope="row">Password :</th>
                                    <td><input type="password" name="user_password" value="<%= user.getPassword()%>" class="form-control"> </td>

                                </tr>
                                <tr> 
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%> </td>

                                </tr>
                                <tr> 
                                    <th scope="row">About :</th>
                                    <td><textarea row="5" name="user_about"  class="form-control"> <%= user.getAbout()%> </textarea> 

                                    </td>

                                </tr>
                                <tr> 
                                    <th scope="row">Profile :</th>
                                    <td> 
                                        <input type="file" name="user_image" class="form-control">
                                    </td>

                                </tr>
                            </table>
                            <div class="container text-center" >
                                <button type="submit" class="btn primary-background text-white">Save</button> 
                            </div>



                        </form>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn primary-background text-white" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn primary-background text-white">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--End Profile modal-->

    <!--star Post modal-->
    <!-- Modal -->
    <div class="modal fade" id="post_Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Post here</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="add-post-form" action="AddPostServlet" method="post">



                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Post Title" class="form-control">
                        </div>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" placeholder="Post Content" style="height: 200px;"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" placeholder="Code/Link/More about post" style="height: 200px;"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Select post image</label>
                            <input type="file" name="pic">
                        </div>

                        <div class="form-group">


                            <select class="form-control mb-3" name="cid">

                                <option selected disabled>Select post category</option>
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>

                            </select>
                        </div>

                        <div class="container text-center"> 

                            <button type="submit" class="btn primary-background text-white">Post</button>

                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>
    <!--End Post modal-->
    <!--javascript-->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

        $(document).ready(function () {

            let editStatus = false;
            $('#edit-profile-button').click(function () {

                if (editStatus === false) {

                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    $("#edit-profile-button").text("Back");
                    editStatus = true;
                } else {
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    $("#edit-profile-button").text("Edit");
                    editStatus = false;
                }
            });
        });

    </script>
    <!-- add post js -->
    <script>
        $(document).ready(function (e) {
            $("#add-post-form").on("submit", function (event) {
                event.preventDefault();
                console.log("submitted");
                let form = new FormData(this);
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success message
                        console.log(data);
                        if (data.trim() === 'done') {
                            swal({
                                title: "Good job!",
                                text: "Post added successfully",
                                icon: "success",
                                button: "Ok"


                            });

                        } else {
                            swal("Error!", "Something went wrong try again..", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                         swal("Error!", "Something went wrong try again..", "error");
                    },
                    processData: false,
                    contentType: false


                })

            })
        })
    </script>
    
    <!--loading post request -->
    <script>
        
        function getPosts(catId,temp){
            $("#loader").show();
            $("#post_container").hide();
            $(".c-link").removeClass("active");
            $.ajax({
                url: "Load_Post.jsp",
                data:{cid:catId},
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
        $(document).ready(function (e){
            let allpostRef=$(".c-link")[0]
            getPosts(0, allpostRef);
            
        })
    </script>
</body>
</html>
