<%-- 
    Document   : upd_del_title
    Created on : 14-Mar-2019, 04:27:45
    Author     : Ingrid Farkas
    called from update_prev.jsp
--%>

<!-- upd_del_title.jsp - shows the form for entering the title, author, ISBN of the book whose inform. is updated ( or deleted ) -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- internal style sheet -->
        <style>
            .text_color {
                color:red; /* red text color */
            }
            
        </style>
        
        <%
            String source = (String)hSession.getAttribute("source_name"); // on which page I am now
        %>
    </head>
    
    <title> <%= source %> </title>
    <body>
        
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
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
                
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container"> <!-- adding the container to the Bootstrap grid -->
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br/>
                                <% 
                                    out.print("<h3>" + source + "</h3>"); // source is Update Book ( for the Update ), or Delete Book ( for the Delete )                                  
                                %>
                               
                                <br/> 
                                <% if (source.equals("Update Book")) {
                                %>
                                    Please enter the information about the book
                                <% } else if (source.equals("Delete Book")) {
                                %>
                                    Please enter the information about the book
                                <%
                                   }
                                %>
                                
                                <br />
                                <br />
                                <% if (source.equals("Update Book")) {
                                %>
                                    <!-- after clicking on the button update_page.jsp is shown -->
                                    <form id="upd_del_book" action="update_page.jsp" method="post">
                                <%
                                   } else if (source.equals("Delete Book")) {
                                %>
                                       <!-- after clicking on the button DelServlet is shown -->
                                       <form id="upd_del_book" action="DelServlet" method="post">
                                <%
                                   }
                                %>
                                
                                    <!-- creating the input element for the title -->
                                    <div class="form-group">
                                        <label for="labtitle">Title:</label> <!-- title label -->
                                        <!-- filling in the title: required -->
                                        <input type="text" class="form-control form-control-sm" name="prev_title" id="title" required> 
                                        <label class="text_color">* Required Field</label>
                                    </div>
                                        
                                    <!-- creating the input element for the author -->
                                    <div class="form-group">
                                        <label for="labauthor">Author's Name:</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="prev_author" id="author">  
                                    </div>
                
                                    <!-- creating the input element for the ISBN -->
                                    <div class="form-group">
                                        <label for="labisbn">ISBN:</label> <!-- ISBN label -->
                                        <!-- input field for the ISBN: maximum 13 characters -->
                                        <input type="text" class="form-control form-control-sm" maxlength="13" name="prev_isbn" id="isbn"> 
                                    </div>
                                                                               
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                    
                                    <%
                                    if (source.equals("Delete Book")) {
                                    %>
                                        <!-- adding the Delete button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                        <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Delete</button>
                                    <% } else {
                                    %>
                                       <!-- adding the Next button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                       <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Next</button>
                                    <% }
                                    %>
                                    
                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>

                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div> 
                                </form>  
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div>    
    </body>
</html>