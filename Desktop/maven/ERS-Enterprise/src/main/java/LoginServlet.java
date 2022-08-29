import

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class LoginServlet extends HttpServlet {//login
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session=request.getSession();

         PrintWriter out = response.getWriter();

            String email1=request.getParameter("email1");
            String pass1=request.getParameter("pass1");

            String fname = null, lname = null;
            String email2=null, pass2=null,module = null;
            try
            {
                Connection con=DbConnection.getConnect();
                PreparedStatement ps=con.prepareStatement("select * from register where email='"+email1+"'");
                ResultSet rs=ps.executeQuery();
                while(rs.next());
                {
                    email2=rs.getString("email");
                    pass2=rs.getString("password");

                    fname=rs.getString("firstName");
                    lname=rs.getString("lastName");
                    module = rs.getString("module");
                }

                if(email1.equals(email2) && pass1.equals(pass2) && module.equalsIgnoreCase("Employee"))
                {
                    session.setAttribute("session_email", email2);
                    session.setAttribute("session_fname", fname);
                    session.setAttribute("session_lname", lname);
                    session.setAttribute("session_pass", pass2);
                    session.setAttribute("session_module", module);

                    response.sendRedirect("EmployeeProfile.jsp");//Employee
                }
                else if(module.equalsIgnoreCase("Manager"))
                {
                    session.setAttribute("session_email", email2);
                    session.setAttribute("session_fname", fname);
                    session.setAttribute("session_lname", lname);
                    session.setAttribute("session_pass", pass2);
                    session.setAttribute("session_module", module);
                    response.sendRedirect("ManagerProfile.jsp");//Manager
                }

                else
                {
                    response.sendRedirect("Home.jsp");
                    //out.println("no");
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">


}




