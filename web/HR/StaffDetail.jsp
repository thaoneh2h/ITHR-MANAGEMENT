<%-- 
    Document   : StaffDetail
    Created on : May 22, 2023, 9:41:07 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT HRMS</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <%@include file="/Layout/TailwindHead.jsp" %>
    </head>
    <body>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <c:set var="error" value="${sessionScope.STAFF_DETAIL_ERROR}" />
                <c:if test="${not empty error}">
                    <c:out value="${error}"/>
                </c:if>

                <button onclick="history.back()" class="flex gap-2 items-center py-1 px-3 m-10 text-red-500
                    hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z"/>
                    </svg>
                    Back
                </button>
                
                <c:set var="result" value="${requestScope.STAFF_DETAIL}"/>
                <c:if test="${not empty result}">
                    <c:forEach var="dto" items="${result}">
                        <div
                            class="w-fit items-center flex flex-col rounded-xl absolute top-1/2 left-1/2 
                            -translate-x-44 -translate-y-44 p-5 px-20 overflow-hidden"
                            style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;"
                        >
                            <img 
                                src="https://kiranworkspace.com/demo/projects/code-snippets/card/profile-card/img/banner.jpg" 
                                class="w-full h-28 absolute top-0 left-0 -z-[1]" 
                                alt="background profile" 
                            />
                            <div class="p-1 bg-white mt-10 rounded-full">
                                <img 
                                    src="${dto.photo}" 
                                    alt="avatar" 
                                    class="w-28 h-28 rounded-full"
                                    style="box-shadow: rgba(0, 0, 0, 0.5) 0px 5px 15px;" 
                                />
                            </div>
                            <p class="text-2xl font-bold text-center w-full my-2 mb-4">${dto.employee_name}</p>

                            <div class="w-fit flex gap-20 my-5">
                                <div class="w-fit">
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Employee ID">
                                        <!-- employee id -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-vcard text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
                                            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
                                        </svg>
                                        <p>${dto.employee_id}</p>
                                    </div>
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Sex">
                                        <!-- sex -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gender-ambiguous text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11.5 1a.5.5 0 0 1 0-1h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V1.707l-3.45 3.45A4 4 0 0 1 8.5 10.97V13H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V14H6a.5.5 0 0 1 0-1h1.5v-2.03a4 4 0 1 1 3.471-6.648L14.293 1H11.5zm-.997 4.346a3 3 0 1 0-5.006 3.309 3 3 0 0 0 5.006-3.31z"/>
                                        </svg>
                                        <p>
                                            <c:if test="${dto.gender}">
                                                Male
                                            </c:if>
                                            <c:if test="${!dto.gender}">
                                                Female
                                            </c:if>
                                        </p>
                                    </div>
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Date Of Birth">
                                        <!-- DOB -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-calendar-heart text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
                                        </svg>
                                        <p>${dto.employee_dob}</p>
                                    </div>
                                </div>

                                <div class="w-fit">
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Phone Number">
                                        <!-- phone -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                        </svg>
                                        <p>${dto.employee_phone}</p>
                                    </div>
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Email">
                                        <!-- email -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                                        </svg>
                                        <p>${dto.employee_email}</p>
                                    </div>
                                    <div class="w-full flex mb-5 gap-3 items-center" title="Address">
                                        <!-- Location -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt text-[#0d6efd]" viewBox="0 0 16 16">
                                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                        </svg>
                                        <p>${dto.employee_address}</p>
                                    </div>
                                </div>
                                
                                
                            </div>
                            
                        </div>
                    </c:forEach>
                            
                </c:if>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>
