<%--
    Document   : DeniedRequests
    Created on : 27 May, 2022, 2:35:01 PM
    Author     : Dell
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String fname = (String) session.getAttribute("session_fname");
    String lname = (String) session.getAttribute("session_lname");
    String email2 = (String) session.getAttribute("session_email");

    int msgnot=0;
    try
    {
        Connection con=dbconnection.DbConnection.getConnect();
        PreparedStatement ps=con.prepareStatement("select * from submitrequest where email='"+email2+"' and status='Applied'");
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
    // Denied
    String first1=request.getParameter("name2");

    String email1=request.getParameter("email2");
    String reason1=request.getParameter("rsn2");
    String status1=request.getParameter("stat2");

    try {
        Connection con = dbconnection.DbConnection.getConnect();
        PreparedStatement ps = con.prepareStatement("update submitrequest set status='Denied' where email='" + email1 + "' and reason='"+reason1+"'");
        int i=ps.executeUpdate();
        if(i>0)
        {
            System.out.println("message read");
        }
        else
        {
            System.out.println("message not read");
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
        <title>Denied Requests</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/searchbar.css" />
        <link rel="stylesheet" type="text/css" href="css/home_css.css" />
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
                    <table class="table table-hover" style="width: 100%">
                    <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Reason</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String rsn=null, stat=null,fName=null,lName,em=null,amt=null,statusPrint;
                            try
                            {
                                Connection con=dbconnection.DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement("select * from submitrequest order by fname asc");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    fName=rs.getString("fname");
                                    lName=rs.getString("lname");
                                    em = rs.getString("email");
                                    rsn = rs.getString("reason");
                                    amt = rs.getString("amount");
                                    stat=rs.getString("status");
                                    if(stat.equals("Denied"))
                                    {

                                    %>

                                    <tr data-toggle="modal" style="background-color: #cc0033" >
                                        <td style="color: whitesmoke"> <%=fName + " "+ lName%> </td>
                                        <td style="color: whitesmoke"> <%=em%> </td>
                                        <td style="color: whitesmoke"> <%=rsn%></td>
                                        <td style="color: whitesmoke"><%=amt%>  </td>
                                        <td style="color: whitesmoke" class="status"><%=stat%></td>

                                        <td>
                                            &nbsp;
                                        </td>

                                                 </tr>


                                        <%
                                    }
                                }
                            }
                            catch(Exception e)
                            {
                                out.println(e);
                            }
                        %>
                          </tbody>
                </table>
    </body>
</html>

