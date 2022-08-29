<%--
    Document   : Edit_profile
    Created on : Jun 20, 2019, 12:21:09 PM
    Author     : rishu
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<% //scriptlet tag
    String fname = (String) session.getAttribute("session_fname");
    String lname = (String) session.getAttribute("session_lname");
    String email2 = (String) session.getAttribute("session_email1");
    String session_zip = (String) session.getAttribute("session_zip");
    String session_phoneno = (String) session.getAttribute("session_phoneno");
    String session_address = (String) session.getAttribute("session_address");
    String session_dob = (String) session.getAttribute("session_dob");
    String session_city = (String) session.getAttribute("session_city");
    String session_state = (String) session.getAttribute("session_state");
    String session_school = (String) session.getAttribute("session_school");
    String session_college = (String) session.getAttribute("session_college");
    String session_experience = (String) session.getAttribute("session_experience");
    String session_companies = (String) session.getAttribute("session_companies");
    String session_achievements = (String) session.getAttribute("session_achievements");
    String session_expertise = (String) session.getAttribute("session_expertise");
    String session_dp = (String) session.getAttribute("session_dp");
    String session_date = (String) session.getAttribute("session_date");
    String session_time = (String) session.getAttribute("session_time");

    int msgnot = 0;
    try {
        Connection con = dbconnection.DbConnection.getConnect();
        PreparedStatement ps = con.prepareStatement("select * from message where to_email='" + email2 + "' and status='unread'");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            msgnot = msgnot + 1;
        }
    } catch (Exception e) {
        out.print(e);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile.</title>
        <link rel="stylesheet" type="text/css" href="css/profile_css.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="z-index: 1;">
            <a class="navbar-brand" href="Home.jsp">
                <img src="images/minilogo.png" alt="logo" >
            </a>
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
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
                        <a class="nav-link" href="Message_page.jsp" >Message <% if (msgnot != 0) {%> <span class="badge badge-light"><%=msgnot%></span><% }%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="request_tutor.jsp" >Request a Tutor</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" >Become a Tutor</a>
                    </li>
                </ul>
            </div>

            <!-- Main Page Sign Up Button -->
            <form action="Logout" method="post">
                <input type="Submit" class="btn btn-outline-danger btn-sm" value="Log Out" data-toggle="modal" href="Logout" data-target="#myModals" style="font-weight: bold;" />
            </form>
            <br>
        </nav>

        <div class="jumbotron text-center" id="bg_img">

            <form action="UploadProfilePic" method="post" enctype="multipart/form-data">
                <h1>Edit Your Profile here.</h1>
                <img src="profile_pics/<%= session_dp%>" class="rounded-circle" alt="Cinque Terre" style="height: 150px; width: 150px;"> <br/>
                <input type="file" name="browse1"/>
                <input type="submit" value="Upload Image" />
            </form>
        </div>

        <form action="UpdateProfile" method="post" >
            <div class="row">
                <div class="col-md-6"  style="padding-left: 40px;">
                    <div class="jumbotron text-center">
                        <h4 style="font-weight: bold; ">Personal Details.</h4><br>
                        <div class="row">
                            <div class="col-md-6">
                                <label style="float: left;">First Name: </label><input type="text" name="fname1" value="<%= fname%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Last Name: </label><input type="text" name="lname1" value="<%= lname%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Phone No: </label><input type="text" name="phoneno1" value="<%= session_phoneno%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Address: </label><input type="text" name="address" value="<%= session_address%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Date Of Birth: </label><input type="date" name="dob" value="<%= session_dob%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">City: </label><input type="text" name="city" value="<%= session_city%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">State: </label><input type="text" name="state" value="<%= session_state%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Zip Code: </label><input type="text" name="zip" value="<%= session_zip%>" style="float: left; width: 250px;"/>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6"  style="padding-left: 15px; padding-right:  40px;">
                    <div class="jumbotron text-center">
                        <h4 style="font-weight: bold;">Educational Details.</h4><br>
                        <div class="row">
                            <div class="col-md-6">
                                <label style="float: left;">School: </label><input type="text" name="school" value="<%= session_school%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">College: </label><input type="text" name="college" value="<%= session_college%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Experience: </label><input type="text" name="experience" value="<%= session_experience%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Companies: </label><input type="text" name="companies" value="<%= session_companies%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Achievements </label><input type="text" name="achievements" value="<%= session_achievements%>" style="float: left; width: 250px;"/>
                            </div>
                            <div class="col-md-6">
                                <label style="float: left;">Expertise: </label><input type="text" name="expertise" value="<%= session_expertise%>" style="float: left; width: 250px;"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <input type="submit" value="Update Profile" class=" btn btn-outline-warning" style="margin-left: 600px;" /><br>
        </form>
    </body>
</html>

