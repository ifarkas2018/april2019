<%-- 
    Document   : update_page
    Created on : 12-March-2019, 16:15:01
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="connection.ConnectionManager"%>

<!-- update_page.jsp - when the user clicks on the Next button on the page update_title.jsp -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book</title>
        <!-- link to the external style sheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            String rs_query=""; 
            String prev_title="";
            String prev_auth="";
            String prev_isbn="";
            ResultSet rs; // object where the query's results are stored
            HttpSession hSession = request.getSession(); // the session to which I am going to add attributes
            
            try {
                // connection with the database 
                //Class.forName("com.mysql.jdbc.Driver");
                // @@@@@@@@@@@@@@@@@@Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
                //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3305/bookstore?useSSL=false", "root", "bird&2018");  
                Connection con = ConnectionManager.getConnection(); //connecting to database 
                
                Statement stmt = con.createStatement();

                prev_title = request.getParameter("prev_title"); // the text entered as the title
                prev_auth = request.getParameter("prev_author"); // the text entered as the author
                prev_isbn = request.getParameter("prev_isbn"); // the text entered as the isbn
                
                // add to the session prev_title, prev_auth, prev_isbn
                hSession.setAttribute("prev_title", prev_title); // on which page I am now
                hSession.setAttribute("prev_auth", prev_auth); // setting the attribute prev_auth to the value prev_auth
                hSession.setAttribute("prev_isbn", prev_isbn); // setting the attribute prev_isbn to the value prev_isbn
                
                String bookid = ""; // book id

                // finding the book_id for title prev_title, author prev_auth, isbn prev_isbn
                // creating the query string : 
                // SELECT b.book_id,
                // FROM book b, author a
                // WHERE b.au_id = a.au_id AND b.isbn = 'prev_isbn' AND b.title = 'prev_title' AND a.au_name = 'prev_auth';
                rs_query = "SELECT b.book_id FROM book b, author a WHERE b.au_id = a.au_id";
                
                // add the author to the query string
                if (!((prev_auth.equalsIgnoreCase("")))) {
                    rs_query += " AND a.au_name = "; 
                    rs_query += "'" + prev_auth + "'";
                }
                
                // add the title to the query string
                if (!((prev_title.equalsIgnoreCase("")))) {
                    rs_query +=" AND b.title = ";
                    rs_query += "'" + prev_title + "'";
                }
                
                // add the isbn to the query string
                if (!((prev_isbn.equalsIgnoreCase("")))) {
                    rs_query += " AND b.isbn ='" + prev_isbn + "'";
                }
                
                rs_query += ";";
                rs = stmt.executeQuery(rs_query);
                
                // if the result of the query has at least one row
                if (rs.next()){
                    // find the book_id for the entered title, author and/or ISBN
                    bookid = rs.getString("book_id");
                    hSession.setAttribute("bookid", bookid ); // store the book id in the session var. bookid
                } else {
                    bookid = "";
                    // Show the page with the message that the book can't be found in the database
                    hSession.setAttribute("source_name", "Update Book"); // the web page name
                    String sTitle = "Book Update"; // used for passing the title from one JSP script to the other
                    String sMessage = "ERR_NO_BOOKID"; // used for passing the message from one JSP script to the other
                    hSession.setAttribute("message", sMessage);
                    hSession.setAttribute("title", sTitle);
                    response.sendRedirect("error_succ.jsp"); // redirects the response to error_succ.jsp    
                }
            } catch (Exception e){
            String sTitle = "Error!"; // used for passing the title from one JSP script to the other
            String sMessage = "ERR_DB"; // used for passing the message from one JSP script to the other
            hSession.setAttribute("source_name", "Book Update"); // on which page I am now
            hSession.setAttribute("message", sMessage); // setting the attribute message to the value sMessage
            hSession.setAttribute("title", sTitle); // setting the attribute message to the value sTitle
            response.sendRedirect("error_succ.jsp"); // redirects the response to error_succ.jsp 
        }
        %>
        <!-- including the file header.jsp -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>
        <!-- including the file update_title.jsp -->
        <%@ include file="update_form.jsp"%> 
        <!-- including the file footer.jsp -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp"%>
    </body>
</html>
