<%--
    Document   : ViewAllRequests
    Created on : 27 May, 2022, 5:07:41 PM
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
        PreparedStatement ps=con.prepareStatement("select * from submitrequest where email='"+email2+"'");
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
        <title>View All Requests</title>
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

                     <table class="table table-hover" >
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
                        String reason=null, status=null,first1,last1,email1,amount,statusPrint;
                            try
                            {
                                Connection con=dbconnection.DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement("select * from submitrequest where email='"+email2+"'" );
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    first1=rs.getString("fname");
                                    last1=rs.getString("lname");
                                    email1 = rs.getString("email");
                                    reason = rs.getString("reason");
                                    amount = rs.getString("amount");
                                    status=rs.getString("status");
                                    if(status.equals("Applied"))
                                    {

                                    %>

                                    <tr data-toggle="modal" style="background-color: #ffcc00" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%>  </td>
                                        <td class="status"><%=status%></td>

                                        <td>


                                        </td>

                                    </tr>

                                    <%
                                      }
                                    else if(status.equals("Approved"))
                                    {
                                        statusPrint = "Yes";
                                        %>

                                        <tr data-toggle="modal" style="background-color:  #33E3FF" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%></td>
                                        <td class="status"><%=status%></td>
                                        <td>

                                        </td>

                    <%
                                    }


                                else
                                    {
                                       %>

                                        <tr data-toggle="modal" style="background-color: #cc0033" >
                                            <td style="color: whitesmoke"> <%=first1 + " "+ last1%> </td>
                                        <td style="color: whitesmoke"> <%=email1%> </td>
                                        <td style="color: whitesmoke"> <%=reason%></td>
                                        <td style="color: whitesmoke"><%=amount%></td>
                                        <td style="color: whitesmoke" class="status"><%=status%></td>

                                         <td>

                                        </td>
                                    </tr>

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

