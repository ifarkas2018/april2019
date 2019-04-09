<%-- 
    Document   : delete_title
    Created on : 21-Mar-2019, 14:51:52
    Author     : user
--%>

<!-- delete_title.jsp - when the user clicks on the Delete button ( the navigation bar ) this web page is shown -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Book</title>
        <!-- link to the external style sheet -->
        <link href="css/templatecss.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <% 
            HttpSession hSession = request.getSession(); // the session to which I am going to add attributes
            hSession.setAttribute("source_name", "Delete Book"); // on which page I am now
        %>
        <!-- including the file header.jsp -->
        <!-- header.jsp contains - company logo, company name and the navigation bar -->
        <%@ include file="header.jsp" %>
        <!-- including the file upd_del_title.jsp -->
        <%@ include file="upd_del_title.jsp" %>  <!-- upd_del_title.jsp -->
        <!-- including the file footer.jsp -->
        <!-- footer.jsp contains the footer of the web page --> 
        <%@ include file="footer.jsp" %> 
    </body>
</html>
