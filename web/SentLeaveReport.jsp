<%-- 
    Document   : SentLeaveReport
    Created on : Jun 4, 2023, 4:47:22 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : WelfareList
    Created on : May 27, 2023, 7:36:02 PM
    Author     : PREDATOR
--%>
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
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <p class="text-center text-3xl font-bold mb-10">List Of Application</p>
                    <br>
                    <c:set var="sentResult" value="${requestScope.SENT_LIST}"/>
                    <c:set var="result" value="${requestScope.SENT_LIST}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr  class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No.</th>
                                    <th class="px-3 py-2 text-start">Title</th>
                                    <th class="px-3 py-2 text-start">Description</th>
                                    <th class="px-3 py-2 text-start">Create at</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}" varStatus="loop">
                                    <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                        <td class="px-3 py-3">
                                            ${loop.count}.
                                        </td>
                                        <td class="px-3 py-3">
                                            ${dto.dayleave_title}
                                        </td>   
                                        <td class="px-3 py-3">
                                            ${dto.dayleave_description}
                                        </td>    
                                        <td class="px-3 py-3">
                                            ${dto.date_created}
                                        </td>         
                                        <td class="px-2 py-3 rounded-r-[0.25rem]">
                                            <c:if test="${dto.status}">Approved</c:if>
                                            <c:if test="${!dto.status}">Rejected</c:if>
                                            <c:if test="${empty dto.status}">
                                                Pending
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty result}">
                          <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty list</p>
                            <svg  fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
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


