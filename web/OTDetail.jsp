<%-- 
    Document   : OTDetail
    Created on : May 23, 2023, 10:43:50 PM
    Author     : 23030
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <% 
            Object user=session.getAttribute("user"); 
            if (user==null) {
                response.sendRedirect("/HRManagement"); 
            } 
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#F8E8EE]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <button onclick="history.back()" class="flex gap-2 items-center py-1 px-3 text-red-500 mt-5
                        hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                        </svg>
                        Back
                    </button>
                    <h1 class="text-center text-3xl font-bold mb-10">Overtime Details</h1>

                    <c:set var="result" value="${requestScope.OT_DETAIL}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full"
                            style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Working Status</th>
                                    <th class="px-3 py-2 text-start">Has OverTime</th>
                                    <th class="px-3 py-2 text-start">Overtime Start Date Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}" varStatus="loop">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">
                                            ${loop.count}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-2 py-3">
                                            ${dto.workingStatus}
                                        </td>
                                        <td class="px-3 py-3">
                                            <c:if test="${dto.hasOvertime}">
                                                <p
                                                    class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                    Active
                                                </p>
                                            </c:if>
                                            <c:if test="${!dto.hasOvertime}">
                                                <p
                                                    class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                    Inactive
                                                </p>
                                            </c:if>
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.overtimeStartDateTime}
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:set var="result2" value="${requestScope.OT_DETAIL_2}"/>
                    <c:if test="${not empty result2}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Working Status</th>
                                    <th class="px-3 py-2 text-start">Has OverTime</th>
                                    <th class="px-3 py-2 text-start">Overtime Start Date Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result2}" varStatus="loop">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">
                                            ${loop.count}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-2 py-3">
                                            ${dto.workingStatus}
                                        </td>
                                        <td class="px-3 py-3">
                                            <c:if test="${dto.hasOvertime}">
                                                <p
                                                    class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                    Active
                                                </p>
                                            </c:if>
                                            <c:if test="${!dto.hasOvertime}">
                                                <p
                                                    class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                    Inactive
                                                </p>
                                            </c:if>
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.overtimeStartDateTime}
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
