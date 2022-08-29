
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resolved Requests Employee</title>
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

                <table class="table table-hover" style="margin-top: 1%" >
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
                                PreparedStatement ps=con.prepareStatement("select * from submitrequest where email='"+email2+"'");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    first1=rs.getString("fname");
                                    last1=rs.getString("lname");
                                    email1 = rs.getString("email");
                                    reason = rs.getString("reason");
                                    amount = rs.getString("amount");
                                    status=rs.getString("status");
                                    if(status.equals("Approved"))
                                    {

                                    %>

                                    <tr data-toggle="modal" style="background-color:  #33E3FF"" >
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
                                    else if(status.equals("Denied"))
                                    {
                                        statusPrint = "Yes";
                                        %>

                                        <tr data-toggle="modal" style="background-color: #cc0033" >
                                        <td> <%=first1 + " "+ last1%> </td>
                                        <td> <%=email1%> </td>
                                        <td> <%=reason%></td>
                                        <td><%=amount%></td>
                                        <td class="status"><%=status%></td>
                                        <td>

                                        </td>




                                        <%
                                    }
else if(!status.equals("Approved") && !status.equals("Denied"))
{
          %>


                                        <tr data-toggle="modal" style="background-color: #800000" >
                                            <td style="color: whitesmoke"> --- </td>
                                        <td style="color: whitesmoke"> ---</td>
                                        <td style="color: whitesmoke"> ---</td>
                                        <td style="color: whitesmoke">---</td>
                                        <td style="color: whitesmoke" class="status">---</td>
                                        <td>

                                        </td>
                                         <h1 style="text-align: center; font-weight: bolder"> You've No Resolved Requests Yet ! </h1>
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

