import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterSrevlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int i = 0,ii;
        try (PrintWriter out = response.getWriter()) {

            HttpSession session=request.getSession();

            String fname=request.getParameter("fname1");
            String lname=request.getParameter("lname1");
            String email=request.getParameter("email1");
            String pass=request.getParameter("pass1");
            String module = request.getParameter("module");
            try
            {
                Connection con=dbconnection.DbConnection.getConnect();
                PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, pass);
                ps.setString(5, module);
                i=ps.executeUpdate();
            }
            catch(Exception e)
            {
                out.println(e);
            }

            if(i>0)
            {
                if(module.equalsIgnoreCase("Employee"))
                {
                    session.setAttribute("session_email", email);
                    session.setAttribute("session_fname", fname);
                    session.setAttribute("session_lname", lname);
                    session.setAttribute("session_pass", pass);
                    session.setAttribute("session_module", module);
                    response.sendRedirect("EmployeeProfile.jsp");
                }
                else if(module.equalsIgnoreCase("Manager"))
                {
                    session.setAttribute("session_email", email);
                    session.setAttribute("session_fname", fname);
                    session.setAttribute("session_lname", lname);
                    session.setAttribute("session_pass", pass);
                    session.setAttribute("session_module", module);
                    response.sendRedirect("ManagerProfile.jsp");
                }
            }
            else
            {
                response.sendRedirect("Home.jsp");//welcome
                out.println("no");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
}




