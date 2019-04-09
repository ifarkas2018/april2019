/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * LoginServlet.java : when the user clicks on the Submit button ( login_form.jsp ) this servlet is called
 */
package loginservlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        try{	    
            // read the text from the username ( the login_form.jsp ) 
            String userName = request.getParameter("username");
            // read the text from the passw ( the login_form.jsp ) 
            String password = request.getParameter("passw");
            
            // method login returns "admin" if the user is administrator, for the regular employee returns "emp", otherwise it returns "customer"
            String userType = UserDAO.login(userName, password);
            HttpSession hSession = request.getSession(); // retrieve the session to which I am going to add variables
            if (userType.equals("emp")){ // logged in as employee
                hSession.setAttribute("user_type", "emp"); // the user logged in as employee ( can do everything except adding new users )
                hSession.setAttribute("logged_in", "true" ); // set the session variable logged_in ( whether the user is logged in )
                response.sendRedirect("index.jsp"); // show the Home page for that user - the user logged in    
            } else if (userType.equals("admin")){ // logged in as admin
                hSession.setAttribute("user_type", "admin"); // the user logged in as adm ( can do everything )
                hSession.setAttribute("logged_in", "true" ); // set the session variable logged_in ( whether the user is logged in )
                response.sendRedirect("index.jsp"); // show the Home page for that user - the user logged in    
            } else {
                // setting the hSession ( to pass them to the page error_succ.jsp ) and loading the page error_succ.jsp
                String sTitle = "Login"; // used for passing the title from one JSP script to the other
                String sMessage = "ERR_LOGIN"; // used for passing the message from one JSP script to the other	 
                hSession.setAttribute("source_name", "Login"); // on which page I am now
                hSession.setAttribute("message", sMessage); // setting the attribute message to the value of the sMessage
                hSession.setAttribute("title", sTitle); // setting the attribute title to the value of the sTitle
                hSession.setAttribute("logged_in", "false" ); // set the session variable logged_in ( whether the user is logged in )
                response.sendRedirect("error_succ.jsp"); // show the error page    
            }
        } catch (Throwable theException){
            System.out.println(theException); 
        }
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
