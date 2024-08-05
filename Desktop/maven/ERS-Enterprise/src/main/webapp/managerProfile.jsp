<%--
    Document   : ManagerProfile
    Created on : 25 May, 2022, 4:16:20 PM
    Author     : IPG3
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String fname = (String) session.getAttribute("session_fname");
    String lname = (String) session.getAttribute("session_lname");
    String email2 = (String) session.getAttribute("session_email");
    String pass = (String) session.getAttribute("session_pass");
    String module = (String) session.getAttribute("session_module");

     String srchemail = request.getParameter("email2");

    int msgnot=0;
    try
    {
        Connection con=dbconnection.DbConnection.getConnect();
        PreparedStatement ps=con.prepareStatement("select * from submitrequest where status='Applied'");
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            msgnot=msgnot+1;
        }
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/searchbar.css" />
        <link rel="stylesheet" type="text/css" href="css/home_css.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/home_css.css"/>
        <link rel="stylesheet" type="text/css" href="css/profile_css.css"/>
    </head>
    <body style="background-image: url('https://in.koppr.com/wp-content/uploads/2019/10/Expense-Reimbursement-101.jpg')">
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
                        <a class="nav-link" href="PendingRequests.jsp" >Pending Requests(<%= msgnot%>) </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ApprovedRequests.jsp" >Approved Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ResolvedRequests.jsp" >Resolved Requests</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="DeniedRequests.jsp" >Denied Requests</a>
                    </li>
                </ul>
            </div>

            <!-- Main Page Sign Up Button -->
            <form action="Logout" method="post">
                <input type="Submit" class="btn btn-outline-danger btn-sm" value="Log Out" data-toggle="modal" href="Logout" data-target="#myModals" style="font-weight: bold;" />
            </form>
            <br>
        </nav>

                        <h1 style="color: white; font-weight: bolder; padding-left: 30px">You are <%= module %></h1>
    </body>
</html>
