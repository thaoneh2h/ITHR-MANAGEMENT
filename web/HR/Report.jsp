<%-- 
    Document   : Report
    Created on : Jun 10, 2023, 10:08:00 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Page</title>
        <%@include file="../Layout/TailwindHead.jsp" %>
    </head>
    <body>
        <%@include file="../Layout/Sidebar.jsp" %>
        <section class="w-full p-20 sm:ml-32 flex justify-center">
            <div class="w-full flex justify-center ">
                <div class="m-10 p-10 w-2/3 rounded-lg bg-[#82cfef10]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <p class="text-center text-3xl font-bold mb-10">List Reports</p>
                    <br>
                    <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                        <thead class="">
                            <tr class="text-[#464646] text-lg font-semibold">
                                <th class="px-3 py-2 text-start">Employee</th>
                                <th class="px-3 py-2 text-start">Title</th>
                                <th class="px-3 py-2 text-start">Description</th>
                                <th class="px-3 py-2 text-start">Create at</th>
                                <th class="px-3 py-2 text-start">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Approve list  -->
                        <c:set var="result" value="${requestScope.REPORT_LIST}" />
                        <c:if test="${not empty result}">
                            <c:forEach var="dto" items="${result}" varStatus="loop">
                                <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                    <td class="px-3 py-3">
                                        ${dto.employeeName}
                                    </td>
                                    <td class="px-3 py-3">
                                        ${dto.title}
                                    </td>
                                    <td class="px-3 py-3">
                                        ${dto.description}
                                    </td>   
                                    <td class="px-3 py-3">
                                        ${dto.dateCreate}
                                    </td>  
                                    <td class="px-3 py-3">
                                        <a href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtDateCreate=${dto.dateCreate}">
                                            View
                                        </a> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        </tbody>
                    </table>

                </div>       
            </div>
        </section>

        <%@include file="/Layout/TailwindFooter.jsp" %>

    </body>
</html>
