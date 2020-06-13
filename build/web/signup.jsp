<%-- 
    Document   : signup
    Created on : May 23, 2020, 11:35:13 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


    </head>
    <body style="background:url(Image/bg_1.jpg); background-attachment: fixed; background-size:cover;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top:5px" class="center-align">Register Here!!</h3>
                            <h4 id="msg" class="center-align"></h4>


                            <div class="form center-align">
                                <form action="registerServlet" method="Post" id="myform">
                                    <input type="text" name="name" placeholder="Enter User name" required>
                                    <input type="email" name="email" placeholder="Enter Email" required>
                                    <input type="password" name="password" placeholder="Enter Password" required>

                                    <button type="submit" class="btn blue lighten-2">Submit</button>

                                </form>
                            </div>
                            <div class="loader center-align" style="margin-top:15px; display:none">

                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Please wait...</h5>        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {


                $("#myform").on('submit', function (event) {

                    event.preventDefault();

                    var f = $(this).serialize();
                    console.log(f);
                    $(".loader").show();
                    $(".form").hide();
                    $.ajax({
                        url: "registerServlet",
                        data: f,
                        type: "POST",
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("Success.....");
                            $(".loader").hide();
                            $(".form").show();
                            if (data.trim() === 'done')
                            {
                                $('#msg').html("Successful Register");
                                $('#msg').addClass("green-text");
                            } else
                            {
                                $('#msg').html("Something went wrong...");
                                $('#msg').addClass("red-text");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Error...");
                            $('#msg').addClass("red-text");
                        }


                    })
                })

            })



        </script>
    </body>
</html>
