<%-- 
    Document   : ReportDetail
    Created on : Jun 12, 2023, 4:52:00 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%-- 
    Document : AccDetail 
    Created on : May 26, 2023, 8:30:49 
    PM Author : 23030 
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <%@include file="../Layout/TailwindHead.jsp" %>
    </head>

    <body>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 pb-28 rounded-lg overflow-hidden">
                <button onclick="history.back()" class="flex gap-2 items-center py-1 px-3 text-red-500 ml-5 mt-5
                        hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                    </svg>
                    Back
                </button>

                <h1 class="text-center text-3xl font-bold mb-5">Report Detail</h1>

                <div class="w-3/4 mx-auto rounded-lg overflow-hidden"
                     style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                    <div style="background-image: url('https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvcmVzdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80');"
                         class="w-full h-52 bg-cover bg-center"></div>
                    <div class="p-5 px-20 grid gap-x-10 w-full">

                        <c:set var="result" value="${requestScope.REPORT_DETAIL_LIST}"/>
                        <c:forEach var="dto" items="${result}">
                            <table class="w-full"   style="border-collapse: separate !important; border-spacing: 0 10px;" border="1">
                                <thead>
                                    <tr>
                                        <th class="px-3 py-2 text-start">Title</th>
                                        <th class="px-3 py-2 text-start">Report for</th>
                                        <th class="px-3 py-2 text-start">Absent day</th>
                                        <th class="px-3 py-2 text-start">Excuse absent day</th>
                                        <th class="px-3 py-2 text-start">Overtime day</th>
                                        <th class="px-3 py-2 text-start">Late day</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.title}</td>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.employeeName}</td>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.absent_day}  </td>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.excused_absent_day}  </td>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.overtime_day} </td>
                                        <td class="px-3 py-3 rounded-l-[0.25rem]">${dto.late_day} </td>  
                                    </tr>               
                                </tbody>
                            </table>
                        </c:forEach>
                    </div>

                </div>
            </div>

        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>

