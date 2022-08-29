import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class SubmitRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int i = 0,ii;
        try (PrintWriter out = response.getWriter()) {

            HttpSession session=request.getSession();

            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String email=request.getParameter("email");
            String amount=request.getParameter("amount");
            String reason = request.getParameter("reason");
            System.out.println(fname +lname+email+amount+reason);

            try
            {
                Connection con=dbconnection.DbConnection.getConnect();
                PreparedStatement ps=con.prepareStatement("insert into submitrequest values(?,?,?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, amount);
                ps.setString(5, reason);
                ps.setString(6, "Applied");
                i=ps.executeUpdate();

            }
            catch(Exception e)
            {
                out.println(e);
            }

            if(i>0)
            {
                response.sendRedirect("EmployeeProfile.jsp");//emplyee
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
