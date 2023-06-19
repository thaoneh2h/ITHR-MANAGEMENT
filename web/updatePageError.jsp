<%-- 
    Document   : updatePageError
    Created on : May 19, 2023, 8:40:21 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page Error</title>
    </head>
    <body>

        <form action="DispatchServlet">              
            <c:set var="Username" value="${sessionScope.USER.username}"/>
            <input type="hidden" name="txtUsername" value="${Username}"/>
            Current Password <input type="text" name="txtCurrentPassword" 
                                    value="" size="15"/> <br/>
            <c:set var="error" value="${requestScope.CREATE_ERROR}"/>
            <c:if test="${not empty error}">
                <font color="red">
                ${error.passwordError}
                </font>
            </c:if> <br/>
            
            

            New Password <input type="text" name="txtNewPassword" value="" size="15"/><br/>
            <c:if test="${not empty error}">
                <font color="red">
                ${error.firstCharPasswordError}
                </font>
            </c:if><br/>
            <c:if test="${not empty error}">
                <font color="red">
                ${error.passIsExisted}
                </font>
            </c:if>        <br/>           
            <c:if test="${not empty error}">
                <font color="red">
                ${error.passwordLenError}
                </font>
            </c:if>        <br/> 
            <c:if test="${not empty error}">
                <font color="red">
                ${error.specialCharError}
                </font>
            </c:if>        <br/>  
            <c:if test="${not empty error}">
                <font color="red">
                ${error.newPasswordEmpty}
                </font>
            </c:if>        <br/>
            
            Confirm new password <input type="text" name="txtConfirm" value="" size="15"/><br/>
            <c:if test="${not empty error}">
                <font color="red">
                ${error.isNotMatch}
                </font>
            </c:if><br/>

            <input type="submit" name="btnAction" value="Update"/>
        </form>

    </body>
</html>
