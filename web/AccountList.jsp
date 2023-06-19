<%-- 
    Document   : AccountList
    Created on : May 23, 2023, 7:26:33 AM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%@include file="/Layout/Sidebar.jsp" %>
            <section class="pt-5 pl-1 sm:ml-64">
                <div class="mt-14 rounded-lg overflow-hidden">
                    <div class="m-10 p-10 rounded-lg bg-[#82cfef10]"
                        style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                        <p class="text-center text-3xl font-bold mb-10">All List Of Accounts</p>
                        <br>
                        <c:set var="result" value="${requestScope.LIST_ACCOUNT}" />
                        <c:if test="${not empty result}">
                            <table class="w-full"
                                style="border-collapse: separate !important; border-spacing: 0 10px;">
                                <thead class="">
                                    <tr class="text-[#464646] text-lg font-semibold">
                                        <th class="px-3 py-2 text-start">No.</th>
                                        <th class="px-3 py-2 text-start">Employee ID</th>
                                        <th class="px-3 py-2 text-start">Employee Name</th>
                                        <th class="px-3 py-2 text-start">Department ID</th>
                                        <th class="px-3 py-2 text-start">Employee Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="dto" items="${result}" varStatus="loop">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                ${loop.count}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employee_id}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:url var="AccDetail" value="DispatchServlet">
                                                    <c:param name="btnAction" value="AccDetail" />
                                                    <c:param name="employee_name"
                                                        value="${dto.employee_name}" />
                                                </c:url>
                                                <a href="${AccDetail}"
                                                    class="border-black hover:border-b-2 text-black">
                                                    ${dto.employee_name}</a>
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.department_id}
                                            </td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                ${dto.employee_email}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </section>
            <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>
