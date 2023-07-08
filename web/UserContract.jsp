<%-- 
    Document   : UserContract
    Created on : Jul 3, 2023, 10:00:16 AM
    Author     : 23030
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="/Layout/TailwindHead.jsp" %>
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
            <div class="mt-14 rounded-lg overflow-hidden relative">
                <div class="m-5 rounded-lg bg-[#82cfef10] w-fit overflow-hidden ml-64"
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                >
                    <c:set var="result" value="${requestScope.USER_CONTRACT}"/>
                    <c:if test="${not empty result}">
                        <c:forEach var="dto" items="${result}">
                            <div class="overflow-y-scroll" style="width: 800px; height: calc(100vh - 140px);">
                                <image src="${dto.photo}" alt="contract" class="w-full h-auto" />
                            </div>                            
                        </c:forEach>
                        <img src="./assets/cv-deco.gif" alt="cv decoration" class="absolute bottom-5 right-0" />
                    </c:if>
                    <c:if test="${empty result}">
                        <div class="text-red-400 mx-auto justify-center items-center flex flex-col pt-10">
                            <p class="text-lg">Empty</p>
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
