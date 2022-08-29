
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet {
        private Object DbConnection;

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        HttpSession session=request.getSession();

        String fname=request.getParameter("fname1");
        String lname=request.getParameter("lname1");
        String phoneno=request.getParameter("phoneno1");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String school=request.getParameter("school");
        String state=request.getParameter("state");
        String college=request.getParameter("college");
        String experience=request.getParameter("experience");
        String companies=request.getParameter("companies");
        String achievements=request.getParameter("achievements");
        String expertise=request.getParameter("expertise");

        String dob=request.getParameter("dob");





        String email=(String)session.getAttribute("session_email");

        try
        {
        Connection con=DbConnection.getConnect();
        PreparedStatement ps=con.prepareStatement("update register set fname='"+fname+"', lname='"+lname+"' where email='"+email+"'");
        int i=ps.executeUpdate();

        Connection con1=DbConnection.getConnect();
        PreparedStatement ps1=con1.prepareStatement("update all_info set phoneno='"+phoneno+"',address='"+address+"',dob='"+dob+"',city='"+city+"',state='"+state+"',school='"+school+"',college='"+college+"',experience='"+experience+"',companies='"+companies+"',achievements='"+achievements+"',expertise='"+expertise+"' where email='"+email+"'");
        int ii=ps1.executeUpdate();

        if(i>0 && ii>0)
        {
        //session.setAttribute("session_email", email2);
        session.setAttribute("session_fname", fname);
        session.setAttribute("session_lname", lname);
        //session.setAttribute("session_zip", zip1);
        session.setAttribute("session_phoneno", phoneno);
        session.setAttribute("session_address", address);
        session.setAttribute("session_dob", dob);
        session.setAttribute("session_city", city);
        session.setAttribute("session_state", state);
        session.setAttribute("session_school", school);
        session.setAttribute("session_college", college);
        session.setAttribute("session_experience", experience);
        session.setAttribute("session_companies", companies);
        session.setAttribute("session_achievements", achievements);
        session.setAttribute("session_expertise", expertise);


        response.sendRedirect("Profile.jsp");
        }
        else
        {
        response.sendRedirect("Edit_profile.jsp");
        }
        }
        catch(Exception e)
        {
        System.out.println(e);
        }

        }
        }

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
        }


protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        processRequest(request, response);
        }

public String getServletInfo() {
        return "Short description";
        }
        }

