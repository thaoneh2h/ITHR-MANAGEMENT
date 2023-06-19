<%-- 
    Document   : UserInfo
    Created on : Jun 6, 2023, 8:25:29 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Information</title>
    </head>
    <body>
        <h1>Personal Information</h1>
        
        <c:set var="user" value="${sessionScope.USER_INFO}"/>
        <c:forEach var="dto" items="${user}">
            <form action="DispatchServlet">
            
            Full Name  <input type="text" value="${dto.employee_name}" readonly/> <br/> 
            Gender  
            <c:if test="${dto.gender}">
                <input type="radio" checked disabled/> Male         
                <input type="radio" disabled/> Female
            </c:if>        
            <c:if test="${!dto.gender}">
                <input type="radio" disabled/> Male         
                <input type="radio" checked disabled/> Female
            </c:if>  <br/>

            Birthday <input type="date" value="${dto.employee_dob}" readonly/> <br/>
            
            Phone number <input type="text" name="txtPhone" value="${dto.employee_phone}" /> <br/>  
            Employee ID <input type="text" name="txtID" value="${dto.employee_id}" readonly/> <br/>
            Email  <input type="text" name="txtEmail" value="${dto.employee_email}" /> <br/>
            Address  <input type="text" name="txtAddress" value="${dto.employee_address}" /> <br/>
            Username  <input type="text" value="${dto.username}" readonly/> <br/>
            Sign Date  <input type="date" value="${dto.datejoin}" readonly/> <br/>
            Department name  <input type="text" value="${dto.departmentName}" readonly/> <br/>
            <input type="submit" name="btnAction" value="Save"/>
            </form>
        </c:forEach>
            
    </body>
</html>
