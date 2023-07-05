<%-- 
    Document   : UserContract
    Created on : Jul 3, 2023, 10:00:16 AM
    Author     : 23030
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Contract</title>
    </head>
    <body>
        <h1>My Contract</h1>
        <c:set var="result" value="${requestScope.USER_CONTRACT}"/>
        <c:if test="${not empty result}">
            <c:forEach var="dto" items="${result}">
                <img 
                    src="${dto.photo}" alt="mycontract" style="width: 100%; height: 100% "
                />
            </c:forEach>
        </c:if>
                
        <c:if test="${empty result}">
            EMPTY
        </c:if>
    </body>
</html>
