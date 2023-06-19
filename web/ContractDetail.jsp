<%-- 
    Document   : ContractDetail
    Created on : Jun 7, 2023, 4:10:48 PM
    Author     : 23030
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract</title>
    </head>
    <body>
        
        <c:set var="error" value="${sessionScope.CONTRACT_DETAIL_ERROR}" />
        <c:if test="${not empty error}">
            <c:out value="${error}"/>
        </c:if>
        
        <c:set var="result" value="${requestScope.CONTRACT_DETAIL}"/>
        <c:if test="${not empty result}">
            <c:forEach var="dto" items="${result}">
                <img 
                    src="${dto.photo}" alt="contract" style="width: 100%; height: 100% "
                />
            </c:forEach>
        </c:if>
        
    </body>
</html>
