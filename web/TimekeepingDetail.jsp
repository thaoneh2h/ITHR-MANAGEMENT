<%-- 
    Document   : TimekeepingDetail
    Created on : Jun 11, 2023, 7:55:02 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script>
            function back() {
                window.location.href = "/HRManagement/DispatchServlet?btnAction=Timekeeping";
            }
        </script>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#F8E8EE]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <button onclick="back()" class="flex gap-2 items-center py-1 px-3 text-red-500 mt-5
                        hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                        </svg>
                        Back
                    </button>

                    <h1 class="text-center text-3xl font-bold mb-10">Timekeeping Detail</h1>
                    <c:set var="result" value="${requestScope.TIMEKEEPING_DETAIL}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Date</th>
                                    <th class="px-3 py-2 text-start">Time In</th>
                                    <th class="px-3 py-2 text-start">Time Out</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">
                                            ${dto.employee_id}
                                        </td>
                                    
                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.date}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timekiN}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timeOut}
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.status}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                
                        
                    <c:set var="result2" value="${requestScope.TIMEKEEPING_DETAIL_2}"/>
                    <c:if test="${not empty result2}">
                        
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr>
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Date</th>
                                    <th class="px-3 py-2 text-start">Time In</th>
                                    <th class="px-3 py-2 text-start">Time Out</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result2}" varStatus="loop">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">
                                            ${loop.count}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employee_id}
                                        </td>
                                    
                                        <td class="px-3 py-3">
                                            ${dto.employee_name}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.date}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timekiN}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.timeOut}
                                        </td>
                                        <td class="px-3 py-3 rounded-r-[0.25rem]">
                                            ${dto.status}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:if>

                    <c:if test="${empty result2 && empty result}">
                        <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty list</p>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                            </svg>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>
