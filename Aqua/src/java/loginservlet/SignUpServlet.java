/*
 * author: Ingrid Farkas
 * project: Aqua Bookstore
 * SignUpServlet.java : when the user clicks on the Sign Up page on the "Submit" button this servlet is triggered
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
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        try{	    
            // read the text from the username, passw, first_name, last_name, admin ( the login_form.jsp ) 
            String userName = request.getParameter("username"); 
            String password = request.getParameter("passw");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String admin = request.getParameter("admin");
            
            String name = first_name + " " + last_name;
            HttpSession hSession = request.getSession(); // retrieve the session to which I am going to add variables
            
            // method userExists returns TRUE if the user with the entered username and password already exists in the DB, otherwise returns FALSE
            boolean userExists = UserDAO.userExists(userName, password); 
            if (userExists){ 
                // setting the hSession ( to pass them to the page error_succ.jsp ) and loading the page error_succ.jsp
                String sTitle = "Sign Up"; // used for passing the title to the JSP
                String sMessage = "ERR_USER_EXISTS"; // used for passing the message to the JSP	 
                hSession.setAttribute("source_name", "Sign Up"); // on which page I am now
                hSession.setAttribute("message", sMessage); // setting the attribute message to the value of the sMessage
                hSession.setAttribute("title", sTitle); // setting the attribute title to the value of the sTitle
                hSession.setAttribute("sign_up", "false" ); // set the session variable sign_up ( the user finished signing up )
                response.sendRedirect("error_succ.jsp"); // show the page with the message the new user signed up successfully 
            } else { // the username and password doesn't exist
                // method signup returns TRUE if the new user was successfully added to the table login, otherwise it returns FALSE
                boolean result = UserDAO.signUp(userName, password, name, admin);

                if (result){ // the new user was added to the database successfully 
                    // setting the hSession ( to pass them to the page error_succ.jsp ) and loading the page error_succ.jsp
                    String sTitle = "Sign Up"; // used for passing the title to the JSP
                    String sMessage = "SUCC_SIGN_UP"; // used for passing the message to the JSP	 
                    hSession.setAttribute("source_name", "Sign Up"); // on which page I am now
                    hSession.setAttribute("message", sMessage); // setting the attribute message to the value of the sMessage
                    hSession.setAttribute("title", sTitle); // setting the attribute title to the value of the sTitle
                    hSession.setAttribute("sign_up", "false" ); // set the session variable sign_up ( the user finished signing up )
                    response.sendRedirect("error_succ.jsp"); // show the page with the message the new user signed up successfully 
                } else { // the new user was not added to the database successfully 
                    // setting the hSession ( to pass them to the page error_succ.jsp ) and loading the page error_succ.jsp
                    String sTitle = "Sign Up"; // used for passing the title to the JSP
                    String sMessage = "ERR_SIGN_UP"; // used for passing the message to the JSP	 
                    hSession.setAttribute("source_name", "Sign Up"); // on which page I am now
                    hSession.setAttribute("message", sMessage); // setting the attribute message to the value of the sMessage
                    hSession.setAttribute("title", sTitle); // setting the attribute title to the value of the sTitle
                    hSession.setAttribute("sign_up", "false" ); // set the session variable sign_up (the user wasn't signed up )
                    response.sendRedirect("error_succ.jsp"); // show the page with the message the new user signed up successfully 
                }
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
