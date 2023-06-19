<%-- 
    Document   : StaffDetail
    Created on : May 22, 2023, 9:41:07 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Detail</title>
    </head>
    <body>
        <h1>Update Staff detail page</h1>
        <c:set var="error" value="${sessionScope.STAFF_DETAIL_ERROR}" />
        <c:if test="${not empty error}">
            <c:out value="${error}"/>
        </c:if>

        <c:set var="result" value="${requestScope.STAFF_DETAIL_NEED_UPDATE}"/>
        <c:if test="${not empty result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Photo</th>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Address</th>                          
                        <th>Role</th>                          
                        <th>Username</th>                          
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}">
                    <form action="DispatchServlet">
                        <tr>     
                            <td>
                                <img src="${dto.photo}" width="80" height="70" >                     
                            </td>
                            <td>
                                ${dto.employee_id}     
                                <input type="hidden" name="txtEmployeeId" value="${dto.employee_id}"/>
                            </td>
                            <td>                                 
                                <input type="text" name="txtEmployeeName" value="${dto.employee_name} "/>
                            </td>
                            <td>                         
                                <input type="text" name="txtEmployeeDOB" value="${dto.employee_dob}"/>
                            </td>
                            <td>                               
                                <c:if test="${dto.gender}">
                                    Male
                                </c:if>
                                <c:if test="${!dto.gender}">
                                    Female
                                </c:if>
                            </td>
                            <td>                                
                                <input type="text" name="txtEmployeePhone" value="${dto.employee_phone}"/>
                            </td>
                            <td>                             
                                <input type="text" name="txtEmployeeEmail" value=" ${dto.employee_email}"/>
                            </td>
                            <td>                        
                                ${dto.departmentName}
                            </td>
                            <td>                               
                                <input type="text" name="txtEmployeeAddress" value="${dto.employee_address}"/>
                            </td>
                            <td>
                                ${dto.role}                              
                            </td>
                            <td>
                                ${dto.username}                              
                            </td>                
                        </tr>
                        <input type="submit" name="btnAction" value="Save">
                    </form>
                        
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
