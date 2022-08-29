<%--
    Document   : ViewInfo
    Created on : 27 May, 2022, 7:53:43 PM
    Author     : Dell
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

    String srchfname=null, srchlname=null;
    String fname1 = null, lname1 = null, passw = null, em = null, mod = null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee View Information</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/searchbar.css" />
        <link rel="stylesheet" type="text/css" href="css/home_css.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/home_css.css"/>
        <link rel="stylesheet" type="text/css" href="css/profile_css.css"/>
    </head>
    <body>
        <%
            try {
        Connection con = dbconnection.DbConnection.getConnect();
        PreparedStatement ps = con.prepareStatement("select * from register where email='" + email2 + "'");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            //msgnot = msgnot + 1;
             fname1 = rs.getString("firstName");
            lname1 = rs.getString("lastName");
             em = rs.getString("email");
             passw = rs.getString("password");
             mod = rs.getString("Module");
        }
    } catch (Exception ex) {
        out.print(ex);
    }
            %>
        <body style="background-image: url('https://in.koppr.com/wp-content/uploads/2019/10/Expense-Reimbursement-101.jpg'); ">

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="z-index: 1;">
            <a class="navbar-brand" href="Home.jsp">
                <img src="images/minilogo.png" alt="logo" >
            </a>
            <div class="navbar-header">
                <a class="navbar-brand" href="EmployeeProfile.jsp">
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
                        <a class="nav-link" href="submitRequest.jsp" >Submit Request </a>
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

                 <div class="form" style="margin-left: 25% ; width: 50% ; padding: 2% ; border-radius: 5%">
                <form action="EmployeeProfile.jsp" method="post" style="background-image: linear-gradient(#0f0c29, #302b63, #24243e); color: whitesmoke ; padding: 5% ; padding-left: 10% ; text-align: justify; border-radius: 20px;   box-shadow: 0 1px 19px black;">
                        <br/> <br/>
                        <h3>SUBMIT REIMBURSEMENT REQUEST</h3> <br/>
                        <table>
                            <tr>
                                <td>  Name : <br/> <br/> </td>
                                <td> <input type="text" value="<%= fname1 %>" name="fname" class="textfield_design"/> <br/> <br/> </td>
                            </tr>
                            <tr>
                                <td>  Sur Name : <br/> <br/> </td>
                                <td> <input type="text" value="<%= lname1 %>" name="lname" class="textfield_design" />  <br/> <br/> </td>
                            </tr>
                            <tr>
                                <td>  Email : <br/> <br/> </td>
                                <td><input type="text" value="<%= em %>" name="email" class="textfield_design" /> <br/> <br/> </td>
                            </tr>

                            <tr>
                                <td>  Password : <br/> <br/> </td>
                                <td> <input type="text" name="pass" value="<%= passw%>"  class="textfield_design"/> <br/> <br/> </td>
                            </tr>

                            <td> <input type="submit" value="Submit Request"  style="margin-left: 110%; background-color: red; color: whitesmoke; border-radius: 12px"/> </td>
                            </tr>
                        </table>

                    </form>

                </div>




    </body>
</html>

