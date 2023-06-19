<%-- 
    Document   : updatePage
    Created on : May 19, 2023, 8:30:29 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <form action="DispatchServlet">
<!--            Username <input type="text" name="txtUsername" value=""/><br/>-->
            Current Password <input type="text" name="txtCurrentPassword"
                                    value="" size="15"/><br/>
            New Password <input type="text" name="txtNewPassword" value="" size="15"/><br/>
            Confirm new password <input type="text" name="txtConfirm" value="" size="15"/> <br/>
            
            <input type="submit" name="btnAction" value="Update"/>
        </form>
    </body>
</html>
