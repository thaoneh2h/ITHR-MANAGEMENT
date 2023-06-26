<%-- 
    Document   : SearchNameContract
    Created on : Jun 25, 2023, 7:28:36 PM
    Author     : 23030
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract</title>
    </head>
    <body>
        <h1>Contract List</h1>
        
        <form action="DispatchServlet">
            Search Value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" /> <br>
            <input type="submit" name = "btnAction" value="Search Contract Name" />
        </form> <br>
        <c:set var="searchValue" value="${param.txtSearchValue}" />
        <c:if test="${not empty searchValue}">



            <c:set var="result" value="${requestScope.SEARCH_RESULT_CONTRACT}" />
            
            <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Employee's Contract ID</th>
                            <th>Employee's ID</th>
                            <th>Employee Name</th>
<!--                        <th>Salary ID</th>
                            <th>Welfare ID</th>-->
                            <th>Sign Date</th>
                            <th>Expire Date</th>
                            <th>Inspire Date</th>
<!--                        <th>Medical Insurance</th>
                            <th>Accidental Insurance</th>
                            <th>Social Insurance</th>-->
<!--                        <th>Tax</th>
                            <th>Penalty</th>
                            <th>Bonus</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="loop">
                            <tr>
                                <td>
                                    ${loop.count}   
                                </td>
                                <td>
                                    <c:url var="ContractDetail" value="DispatchServlet">
                                    <c:param name="btnAction" value="ContractDetail" />
                                    <c:param name="employee_contractID" value="${dto.employee_contractID}"/>
                                    </c:url>
                                    <a href="${ContractDetail}"> ${dto.employee_contractID}</a>
                                </td>
                                <td>
                                    ${dto.employeeID}
                                </td>
                                <td>
                                    ${dto.employee_name}
                                </td>
                                <td>
                                    ${dto.signDate}
                                </td>
                                <td>
                                    ${dto.expDate}
                                </td>   
                                <td>
                                    ${dto.inspireDate}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>
        </c:if>
    </body>
</html>
