<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <!----------------------------------------------------------------------------------------------->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="/Layout/TailwindHead.jsp" %>
    </head>

    <!----------------------------------------------------------------------------------------------->

    <body>
        <% 
            Object user=session.getAttribute("user"); 
            if (user==null) {
                response.sendRedirect("/HRManagement"); 
            } 
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <%@include file="/Layout/TailwindFooter.jsp" %>

        <div class="w-1/2 h-2/3 mx-auto overflow-hidden absolute top-1/2 left-2/3 -translate-x-1/2 -translate-y-1/2">
            <!-- <div class="flex"> -->
                <img src="./assets/task.gif" alt="gif information" class="w-2/3" />
            <!-- </div> -->
        </div>

    </body>

</html>