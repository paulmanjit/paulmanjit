<%--
    Document   : PendingRequests
    Created on : 26 May, 2022, 1:35:53 AM
    Author     : IPG3
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
        <title>Approve or Deny Request!</title>
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
                                PreparedStatement ps=con.prepareStatement("select * from submitrequest order by fname asc");
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

                                    <tr data-toggle="modal" style="background-color: #ffa4a4" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%>  </td>
                                        <td class="status"><%=status%></td>

                                        <td class="d-flex flex-row bd-highlight mb-3">
                                            <form action="ApprovedRequests.jsp" method="post">
                                                <input type="hidden" value="<%=first1 + " "+ last1%>" name="name" />
                                                <input type="hidden" value="<%=email1%>" name="email" />
                                                <input type="hidden" value="<%=reason%>" name="rsn" />
                                                <input type="hidden" value="<%=amount%>" name="amt" />
                                                <input type="hidden" value="<%=status%>" name="stat" />
                                                <input type="submit" value="Approve" class="btn btn-warning" />

                                            </form>

                                                <form action="DeniedRequests.jsp" method="post">
                                                <input type="hidden" value="<%=first1 + " "+ last1%>" name="name2" />
                                                <input type="hidden" value="<%=email1%>" name="email2" />
                                                <input type="hidden" value="<%=reason%>" name="rsn2" />
                                                <input type="hidden" value="<%=amount%>" name="amt2" />
                                                <input type="hidden" value="<%=status%>" name="stat2" />

                                                <input type="submit" value="Deny" class="btn btn-info" style="margin-left: 15px" />
                                            </form>
                                        </td>

                                    </tr>

                                    <%
                                      }
                                    else if(status.equals("Approved"))
                                    {
                                        statusPrint = "Yes";
                                        %>

                                <!--        <tr data-toggle="modal" style="background-color: #ffa4a4" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%></td>
                                        <td class="status"><%=status%></td>

                                         -->
                                            <form action="Approvedrequests.jsp" method="post" >
                                                <input type="hidden" value="<%=first1 + " "+ last1%>" name="name" />
                                                <input type="hidden" value="<%=email1%>" name="email" />
                                                <input type="hidden" value="<%=reason%>" name="rsn" />
                                                <input type="hidden" value="<%=amount%>" name="amt" />
                                                <input type="hidden" value="<%=status%>" name="stat" />
                                                <input type="hidden" value="Approved" class="btn btn-success" />

                                            </form>


                                    <%
                                    }
                                else
                                    {
                                       %>
                                        <!--
                                        <tr data-toggle="modal" style="background-color: #ffa4a4" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%></td>
                                        <td class="status"><%=status%></td>
                                        -->
                                         <td>
                                            <form action="DeniedRequests.jsp" method="post">
                                                <input type="hidden" value="<%=first1 + " "+ last1%>" name="name2" />
                                                <input type="hidden" value="<%=email1%>" name="email2" />
                                                <input type="hidden" value="<%=reason%>" name="rsn2" />
                                                <input type="hidden" value="<%=amount%>" name="amt2" />
                                                <input type="hidden" value="<%=status%>" name="stat2" />
                                                <input type="hidden" value="Denied" class="btn btn-danger" />

                                            </form>
                                        </td>





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

