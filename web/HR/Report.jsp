<%-- 
    Document   : Report
    Created on : Jun 10, 2023, 10:08:00 AM
    Author     : ADMIN
--%>

<%@page import="model.DTO.ReportDTO"%>
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
                    <div class="flex justify-between gap-3">
                         <form id="searchForm" action="/HRManagement/ReportServlet" method="post">
                            <div class="relative max-w-sm">
                                <input name="date" onchange="submitForm()" type="month"  id="datepickerId" 
                                       data-date="${param.date}" value="${param.date}" 
                                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 " placeholder="Select date"/>
                            </div>
                        </form>
                        <form action="/HRManagement/MainController" class="flex gap-3 col-span-1 w-1/3 h-fit items-center">
                            <input type="text" name="txtSearch" value="${param.txtSearch}"  
                                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                                   placeholder="Enter employee's name"/>
                            <input type="hidden" name="date" value="${param.date}"/>
                            <input type="submit" name="btnAction" value="Search" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5  dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" />
                        </form>
                    </div> 
                    <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                        <thead class="">
                            <tr class="text-[#464646] text-lg font-semibold">
                                <th class="px-3 py-2 text-start">No.</th>
                                <th class="px-3 py-2 text-start">Employee</th>
                                <th class="px-3 py-2 text-start">Title</th>
                                <th class="px-3 py-2 text-start">Department</th>
                                <th class="px-3 py-2 text-start">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!--Month ReportList-->
                            <c:set var="error" value="${requestScope.message}" />
                            <c:if test="${not empty error}">
                                <c:out value="${error}"/>
                            </c:if>

                            <c:set var="result" value="${requestScope.REPORT_LIST}" />
                            <c:if test="${not empty result}">
                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3">
                                            ${counter.count}.
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employeeName}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.title}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.department}
                                        </td>   
                                        <td class="px-3 py-3">
                                            <a href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtMonth=${param.date}" class="text-white bg-[#0d6efd] rounded-md px-2 py-1 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium">
                                                View
                                            </a> 
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            <!--Month ReportList by name-->
                            <c:set var="result" value="${requestScope.REPORT_LIST_BY_NAME}" />
                            <c:if test="${not empty result}">
                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3">
                                            ${counter.count}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.employeeName}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.title}
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.department}
                                        </td>   
                                        <td class="px-3 py-3">
                                            <a href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtMonth=${param.date}" class="text-white bg-[#0d6efd] rounded-md px-2 py-1 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium">
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

        <script>
            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>
    </body>
</html>
