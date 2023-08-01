<%-- Document : Report Created on : Jun 10, 2023, 10:08:00 AM Author : ADMIN --%> <%@page
    import="model.DTO.ReportDTO"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>IT HRMS</title>
            <%@include file="../Layout/TailwindHead.jsp" %>
        </head>
        <body>
            <%@include file="../Layout/Sidebar.jsp" %>

            <section class="w-full p-20 sm:ml-32 flex justify-center">
                <div class="w-full flex justify-center">
                    <div
                        class="m-10 p-10 w-2/3 rounded-lg bg-[#82cfef10]"
                        style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px"
                        >
                        <p class="text-center text-3xl font-bold mb-10">List Reports</p>
                        <div class="flex justify-between gap-3">
                            <form id="searchForm" action="/HRManagement/AllReportServlet" method="post">
                                <div class="relative max-w-sm">
                                    <input
                                        name="date"
                                        onchange="submitForm()"
                                        type="month"
                                        id="datepickerId"
                                        data-date="${param.date}"
                                        value="${param.date}"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                                        placeholder="Select date"
                                        />
                                </div>
                            </form>
                            <form action="/HRManagement/HRMainController" class="mt-3">
                                <input
                                    type="text"
                                    name="txtSearch"
                                    value="${param.txtSearch}"
                                    placeholder="Enter employee's name"
                                    class="rounded-md border-slate-400"
                                    />
                                <input type="hidden" name="date" value="${param.date}" />
                                <input
                                    type="submit"
                                    name="btnAction"
                                    value="Search"
                                    class="rounded-md bg-[#0d6efd] px-3 py-[7px] box-border text-white cursor-pointer font-bold border-2 border-[#0d6efd] hover:text-[#0d6efd] hover:bg-[#0d6efd20] transition-all"
                                    />
                            </form>
                        </div>
                        <table
                            class="w-full"
                            style="border-collapse: separate !important; border-spacing: 0 10px"
                            >
                            <thead class="">
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No.</th>
                                    <th class="px-3 py-2 text-start">Title</th>
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee</th>           
                                    <th class="px-3 py-2 text-start">Department</th>
                                    <th class="px-3 py-2 text-start">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Month ReportList-->
                                <c:set var="error" value="${requestScope.message}" />
                                <c:if test="${not empty error}">
                                    <c:out value="${error}" />
                                </c:if>

                                <c:set var="result" value="${requestScope.REPORT_LIST}" />
                                <c:if test="${not empty result}">
                                    <c:forEach var="dto" items="${result}" varStatus="counter">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3">${counter.count}.</td>
                                            <td class="px-3 py-3">${dto.title}</td>
                                            <td class="px-3 py-3">${dto.employeeID}</td>
                                            <td class="px-3 py-3">${dto.employeeName}</td>
                                            <td class="px-3 py-3">${dto.department}</td>
                                            <td class="px-3 py-3">
                                                <a
                                                    href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtMonth=${param.date}"
                                                    class="rounded-md bg-[#0d6efd] px-3 py-1 box-border text-white cursor-pointer font-semibold border-2 border-[#0d6efd] hover:text-[#0d6efd] hover:bg-[#0d6efd20] transition-all"
                                                    >
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
                                            <td class="px-3 py-3">${counter.count}.</td>
                                            <td class="px-3 py-3">${dto.title}</td>
                                            <td class="px-3 py-3">${dto.employeeID}</td>
                                            <td class="px-3 py-3">${dto.employeeName}</td>
                                            <td class="px-3 py-3">${dto.department}</td>
                                            <td class="px-3 py-3">
                                                <a
                                                    href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtMonth=${param.date}"
                                                    class="rounded-md bg-[#0d6efd] px-3 py-1 box-border text-white cursor-pointer font-semibold border-2 border-[#0d6efd] hover:text-[#0d6efd] hover:bg-[#0d6efd20] transition-all"
                                                    >
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
                    document.getElementById('searchForm').submit();
                }
            </script>
        </body>
    </html>
