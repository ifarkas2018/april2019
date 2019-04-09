/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * LogOutServlet.java : when the user clicks on the Log Out link ( on the navbar ) this servlet is called
 */
package logoutservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/LogOutServlet"}) // if the URL is /LogOutServlet
public class LogOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogOutServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession hSession = request.getSession(); // retrieve the session to which I am going to add variables
        hSession.setAttribute("logged_in", "false" ); // set the session variable logged_in ( whether the user is logged in 
        hSession.setAttribute("emp_adm", "false"); // the user is not anymore using the website for employees and administrators
        // hSession.setAttribute("sign_up", "false"); // the administrator is not signing up a user
        hSession.setAttribute("user_type", "customer"); // the user type is now customer
        // setting the hSession ( to pass them to the page error_succ.jsp ) and loading the page error_succ.jsp
        String sTitle = "Log Out"; // used for passing the title to the JSP script
        String sMessage = "SUCC_LOGOUT"; // used for passing the message to the JSP script	 
        hSession.setAttribute("source_name", "Log Out"); // on which page I am now
        hSession.setAttribute("message", sMessage); // setting the attribute message to the value of the sMessage
        hSession.setAttribute("title", sTitle); // setting the attribute title to the value of the sTitle
        response.sendRedirect("error_succ.jsp"); // show the error page   
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
