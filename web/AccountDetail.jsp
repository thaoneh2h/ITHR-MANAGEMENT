<%-- 
    Document : AccDetail 
    Created on : May 26, 2023, 8:30:49 
    PM Author : 23030 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

                <h1 class="text-center text-3xl font-bold mb-5">Account Detail</h1>

                <c:set var="error" value="${sessionScope.ACCOUNT_DETAIL_ERROR}" />
                <c:if test="${not empty error}">
                    <c:out value="${error}" />
                </c:if>

                <c:set var="result" value="${requestScope.ACCOUNT_DETAIL}" />
                <c:if test="${not empty result}">
                    <div class="w-3/4 mx-auto rounded-lg overflow-hidden"
                        style="box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                        <div style="background-image: url('https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGZvcmVzdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80');"
                            class="w-full h-52 bg-cover bg-center"></div>
                        <c:forEach var="dto" items="${result}">
                            <div class="p-5 px-20 grid grid-cols-2 gap-x-10 w-full">
                                <div class="relative mb-4 w-full">
                                    <p class="font-semibold text-base mb-1">Employee ID</p>
                                    <input type="text" value="${dto.employee_id}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        strokeWidth={1.5} stroke="currentColor"
                                        class="w-9 h-8 px-[6px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Employee Name</p>
                                    <input type="text" value="${dto.employee_name}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path strokeLinecap="round" strokeLinejoin="round"
                                            d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Department ID</p>
                                    <input type="text" value="${dto.department_id}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Department Name</p>
                                    <input type="text" value="${dto.departmentName}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Email</p>
                                    <input type="text" value="${dto.employee_email}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Username</p>
                                    <input type="text" value="${dto.username}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Start Date</p>
                                    <input type="text" value="${dto.datejoin}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z" />
                                    </svg>
                                </div>

                                <div class="relative mb-4">
                                    <p class="font-semibold text-base mb-1">Role</p>
                                    <input type="text" value="${dto.role}"
                                        class="border-2 rounded-md px-2 py-1 pl-12 w-full" disabled />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="w-9 h-8 px-[7px] absolute bottom-[2px] left-[2px] border-r-2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
                                    </svg>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </section>
        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>