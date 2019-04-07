<%-- 
    Document   : error_succ.jsp
    Created on : 19-Nov-2018, 02:31:59
    Author     : user
--%>

<!-- error_succ.jsp adds the error or success message to the web page -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            HttpSession hSession = request.getSession(); // hSession - used to store the information about that user
            String sSource = (String)hSession.getAttribute("source_name");
            // set the title of this web page depending on the task the user is doing 
            if (sSource.equalsIgnoreCase("Add Book")){
                out.print("<title>Add Book</title>"); 
            } else if (sSource.equalsIgnoreCase("Search")){
                out.print("<title>Search</title>"); 
            } else if (sSource.equalsIgnoreCase("Update Book")){
                out.print("<title>Update Book</title>"); 
            } else if (sSource.equalsIgnoreCase("Login")){
                out.print("<title>Login</title>");
            }
        %>    
        
        <!-- link to the external stylesheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
        <!-- internal CSS stylesheet -->
        <style>
            .red_text {
                color:red; /* red text color */
            }
        </style>
        <!-- including the file header.jsp into this file -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp"%>
    </head>
    
    <body>
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large screens and 5 columns on the medium sized screens -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container">
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <br/><br/><br/>
                                <%
                                    // title, source_name, message - the information passed from the other JSP ( addDB.jsp, searchDB.jsp or updateDB.jsp )
                                    // sSource - the text shown on the button and for setting the action in the form tag
                                    // title - the title passed from one web page to the other
                                    String sTitle = (String)hSession.getAttribute("title");
                                    // message - attribute passed from the other web page used to determine the message on the web page
                                    String sMessage = (String)hSession.getAttribute("message");
                                    
                                    // changing the color of error messages to red
                                    String errStart = "<span class=\"red_text\">";
                                    String errEnd = "</span>";
                                    
                                    out.print("<h1 class=\"red_text\">");
                                    out.print( sTitle ); 
                                    out.print("</h1>");
                                    out.print("<br/><br/>");
                                        
                                    if (sMessage.equalsIgnoreCase("ERR_DB")){
                                        out.print(  errStart + "An error occurred while accessing the database!" +  errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_LOGIN")){   
                                        out.print( errStart + "The username or password doesn't exist!" + errEnd );
                                    } else if (sMessage.equalsIgnoreCase("ERR_USER_EXISTS")){
                                        out.print( errStart + "The username entered already exists and the user wasn't added to the database!" + errEnd );
                                    } else if (sMessage.equalsIgnoreCase("ERR_SIGN_UP")){
                                        out.print( errStart + "An error occurred while adding the new user to the database and the user wasn't added!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_SEARCH")){
                                        out.print( errStart + "An error occurred during the search!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_NO_BOOKID")){
                                        out.print( errStart + "The book with that title, author and isbn doesn't exist!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_NO_AUTHID")){
                                        out.print( errStart + "The book from that author doesn't exist!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD")){
                                        out.print( errStart + "An error occurred while adding the book to the database and the book wasn't successfully added to the database!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_UPDATE")){
                                        out.print( errStart + "An error occurred while updating the book!" + errEnd ); 
                                    } else if (sMessage.equalsIgnoreCase("ERR_DELETE")){
                                        out.print( errStart + "An error occurred while deleting the book!" + errEnd );
                                    } else if (sMessage.equalsIgnoreCase("DEL_NO_BOOK")) {
                                        out.print( errStart + "The book doesn't exist and it couldn't deleted!" + errEnd );
                                    } else if (sMessage.equalsIgnoreCase("ERR_ADD_EXISTS")){
                                        out.print( errStart + "Error! The book with that ISBN already exists!" + errEnd );  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_ADD")){
                                        out.print("The book was successfully added to the database!");       
                                    } else if (sMessage.equalsIgnoreCase("SUCC_UPDATE")){
                                        out.print("The book was successfully updated in the database!");  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_DELETE")){
                                        out.print("The book was successfully deleted from the database!");  
                                    } else if (sMessage.equalsIgnoreCase("SUCC_SIGN_UP")){
                                        out.print("The new user was successfully added to the database!"); 
                                    } else if (sMessage.equalsIgnoreCase("SUCC_LOGOUT")) {
                                        out.print("You logged out successfully!");
                                    }
                                    
                                    // sSource used for setting the action attribute of the form tag ( the page that is loaded when the user clicks the button )
                                    if (sSource.equalsIgnoreCase("Add Book")){
                                %>
                                        <form action="add_page.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Search")){
                                %>
                                        <form action="search_page.jsp" method="post">  
                                <%
                                    } else if (sSource.equalsIgnoreCase("Update Book")){                            
                                %>
                                        <form action="update_prev.jsp" method="post"> 
                                <%
                                    } else if (sSource.equalsIgnoreCase("Delete Book")){ 
                                %>
                                        <form action="delete_title.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Login")){
                                %>
                                        <form action="login_page.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Log Out")){
                                %>
                                        <form action="index.jsp" method="post">
                                <%
                                    } else if (sSource.equalsIgnoreCase("Sign Up")){
                                %>
                                        <form action="SignUp" method="post">
                                <%
                                    }
                                %>
                                <% if (sSource.equals("Log Out")) {
                                       sSource = "Home"; // show on the button text Home
                                   }
                                %>
                                    <br/><br/>
                                    <!-- adding the To button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" class="btn btn-info btn-sm">To <%=sSource%> </button>
                                </form>
                                
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
        <!-- including the file footer.jsp into this file -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp"%> 
    </body>
</html>
