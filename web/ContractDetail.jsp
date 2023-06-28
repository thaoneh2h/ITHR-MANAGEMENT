<%-- 
    Document   : ContractDetail
    Created on : Jun 7, 2023, 4:10:48 PM
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
        <script>
            function back() {
                window.location.href = "/HRManagement/DispatchServlet?btnAction=ShowContractList";
            }
        </script>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden relative">
                <button onclick="back()" class="flex gap-2 items-center py-1 px-3 text-red-500 absolute top-7 left-10
                    hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                    </svg>
                    Back
                </button>
                <div class="m-5 rounded-lg bg-[#82cfef10] w-fit overflow-hidden ml-96"
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                >             
                    <c:set var="error" value="${sessionScope.CONTRACT_DETAIL_ERROR}" />
                    <c:if test="${not empty error}">
                        <c:out value="${error}"/>
                    </c:if>
                    
                    <c:set var="result" value="${requestScope.CONTRACT_DETAIL}"/>
                    <c:if test="${not empty result}">
                        <c:forEach var="dto" items="${result}">
                            <img 
                                src="${dto.photo}" alt="contract" style="width: auto; height: calc(100vh - 140px);"
                            />
                        </c:forEach>
                        <img src="./assets/cv-deco.gif" alt="cv decoration" class="absolute bottom-5 right-0" />
                    </c:if>
                </div>
            </div>
        </section>        
    </body>
</html>
