

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="css/home_css.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="img/favicon.png" rel="icon">
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

        <!-- Bootstrap CSS File -->
        <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body class style="">


        <%

            String fname = "", lname = "", email2 = "",module="";
module = (String) session.getAttribute("session_module");
            if (email2 != null || fname != null || lname != null) {
                fname = (String) session.getAttribute("session_fname");
                lname = (String) session.getAttribute("session_lname");
                email2 = (String) session.getAttribute("session_email");
                module = (String) session.getAttribute("session_module");
            }

            int msgnot = 0;
            /*
    try {
        Connection con = dbconnection.DbConnection.getConnect();
        PreparedStatement ps = con.prepareStatement("select * from message where to_email='" + email2 + "' and status='unread'");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            msgnot = msgnot + 1;
        }
    } catch (Exception e) {
        out.print(e);
    }*/
            if (email2 != null) {

        %>


        <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="z-index: 1;">
            <a class="navbar-brand" href="Home.jsp">
                <img src="images/minilogo.png" alt="logo" >
            </a>
            <div class="navbar-header">
                <a class="navbar-brand" href="ManagerProfile.jsp">
                    hi, <%= fname + " " + lname%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.jsp" >Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Message_page.jsp" >Submit Request </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewAllRequests.jsp" >View All Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="EmpResolvedRequests.jsp" >View Resolved Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Settings.jsp" >Settings</a>
                    </li>
                </ul>
            </div>

            <!-- Main Page Sign Up Button -->
            <form action="Logout" method="post">
                <input type="Submit" class="btn btn-outline-danger btn-sm" value="Log Out" data-toggle="modal" href="Logout" data-target="#myModals" style="font-weight: bold;" />
            </form>
            <br>
        </nav>

        <%
        } else {
        %>



        <!-- Main Navigation Bar -->
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="z-index: 1;">
            <a class="navbar-brand" href="Home.jsp">
                <h1>Expense Reimbursement System</h1>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
            </div>
            <ul>
                <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal" style=" font-weight: bold;">
                    Login
                </button>
                <button type="button" class="btn btn-outline-success btn-sm" data-toggle="modal" data-target="#myModals" style="font-weight: bold;">
                    Sign Up
                </button>
            </ul>

            <!-- Main Page Sign Up Button -->




        </nav>




        <%
            }
        %>

        <!--Signup Modal-->

        <div class="modal fade" id="myModals" style="width: 460px; margin-left: 500px;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h5 class="modal-title"  style="font-weight: bold;">Create a Free Account to Continue</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button><br><br><br>
                    </div>
                    <div class="modal-body">
                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModals" style="background-color: #3b5998; width: 400px; margin-left: 10px; margin-top: 10px; height: 35px; font-weight: bold;">
                            Sign Up with Facebook
                        </button><br><br>
                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModals" style=" width: 400px; margin-left: 10px;  height: 35px; font-weight: bold; margin-top: 15px;" >
                            Sign Up with Google
                        </button>
                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"  data-dismiss="modal" data-target="#myModalss" style=" width: 400px; margin-left: 10px;  height: 35px; font-weight: bold; margin-top: 15px;" >
                            Sign Up with Email
                        </button>
                    </div>

                    <div class="modal-footer">


                    </div>

                </div>
            </div>
        </div>






        <!-- Register Modal-->

        <form action="Register" method="post">
            <div class="modal fade" id="myModalss" style="width: 460px; margin-left: 500px;">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="col-12 modal-title text-center" style="font-weight: bold;">Sign Up
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </h4>

                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <label style="font-weight: bold;">Email Address :</label>
                            <input type="text" name="email1" placeholder="Enter Email" autofocus="" class="text_field" style="width: 410px; height: 35px;"/><br><br>


                            <label style="font-weight: bold;">Create Password :</label>
                            <input type="password" name="pass1" placeholder="Enter Password" autofocus="" class="text_field" style="width: 410px; height: 35px;"/><br><br>

                            <div class="row">
                                <div class="col-md-6">
                                    <label style="font-weight: bold;">First Name :</label>
                                    <input type="text" name="fname1" placeholder="First Name" class="text_field" style="width: 187px; height: 35px;" />
                                </div>

                                <div class="col-md-6">
                                    <label style="font-weight: bold;">Last Name :</label>
                                    <input type="text" name="lname1" placeholder="Last Name" class="text_field" style="width: 187px; height: 35px;" />
                                </div>

                                <div class="col-md-6">
                                    <label style="font-weight: bold;">Who are You ?:</label>
                                    <input type="text" name="module" placeholder="Manager/Employee ? " class="text_field" style="width: 187px; height: 35px;" />
                                </div>
                                <h6 style="font-size: 13px; padding: 15px;">Only your first name and last name initial will be visible to Admin.</h6>
                            </div>




                            <input type="submit" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModalss" style="width: 410px; background-color: #ed6d20; color: white; font-weight: bold; height: 35px;" value="Sign Up" />
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">



                        </div>

                    </div>
                </div>
            </div>
        </form>













        <!-- Login Modal -->



        <div class="modal fade" id="myModal" style="width: 460px; margin-left: 500px;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="col-12 modal-title text-center" style="font-weight: bold;">Log In
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </h4>


                    </div>

                    <!-- Modal body -->
                    <br>
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="background-color: #3b5998; width: 403px; margin-left: 20px; margin-top: 10px; height: 35px; font-weight: bold;">
                        Login with Facebook
                    </button><br><br>
                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" style=" width: 403px; margin-left: 20px;  height: 35px; font-weight: bold; margin-top: 15px;" >
                        Login with Google
                    </button>




                    <div class="modal-body">
                        <form action="Login" method="post">
                            <label style="font-weight: bold;">Email :</label>
                            <input type="text" placeholder="Enter Email" name="email1" class="text_field" autofocus="" style="width: 410px; height: 35px;"/><br><br>


                            <label style="font-weight: bold;">Password :</label>
                            <input type="password" placeholder="Enter Password" name="pass1" class="text_field" autofocus=""  style="width: 410px; height: 35px;"/><br><br>

                            <input type="submit" value="Login" class="btn btn-sm" data-toggle="modal" data-target="#myModal" style="width: 410px; background-color: #ed6d20; color: white; font-weight: bold; height: 35px;">
                            <br><br>
                        </form>

                        <a href="password">Forgot Your Password?</a><br>
                        Don't have an Account? <a data-toggle="modal" data-dismiss="modal" href="#myModals"> Sign Up for free.</a>


                    </div>


                    <!-- Modal footer -->
                    <div class="modal-footer">
                    </div>

                </div>
            </div>
        </div>



        <!-- Video+Text Area -->


        <div class="section">
            <div class="row" id="zzzz" >
                <div class="video-container">
                    <div class="color-overlay"></div>
                    <video autoplay loop muted poster="images/kkk.png" style="height: 100%;width: 100%">
                        <source src="videos/video_1.mp4" type="video/mp4" style="margin-left: 10%"/>
                    </video>
                </div>
            </div>


    </body>
</html>

