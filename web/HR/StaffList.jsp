<%-- 
    Document   : StaffList
    Created on : May 14, 2023, 2:54:57 PM
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
        <%
            String status = request.getParameter("statusWorker");
            boolean statusValue = (status != null && status.equals("false")) ? false : true;
            session.setAttribute("statusWorker", statusValue);
            Object user = session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("/HRManagement");
            }
        %>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10]" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                    <p class="text-center text-3xl font-bold">List of staff</p>

                    <form action="SearchStaffServlet">
                        <input type="text" name="txtSearch" value="${param.txtSearch}" placeholder="Enter employee's name"/>
                        <input type="submit" name="btnAction" value="Search"/>
                    </form>

                    <br>
                    <div 
                        id="toggle-button"
                        for="check" class="bg-white cursor-pointer relative w-[105px] h-10 rounded-full block scale-75 ml-auto"
                        style="box-shadow: rgba(50, 50, 93, 0.35) 0px 50px 100px -20px, rgba(0, 0, 0, 0.4) 0px 30px 60px -30px, rgba(10, 37, 64, 0.45) 0px -2px 6px 0px inset;"
                        onclick="changeStatus()"
                        >
                    </div>
                    <c:set var="result" value="${requestScope.LIST_STAFF}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr 
                                    class="text-[#464646] text-lg font-semibold"
                                    >
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Gender</th>
                                    <th class="px-3 py-2 text-start">Phone Number</th>
                                    <th class="px-3 py-2 text-start">Department</th>                         
                                    <th class="px-3 py-2 text-start">Role</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                    <th class="px-3 py-2 text-start w-20">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}">
                                    <c:if test="${statusWorker == dto.status}">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                <c:url var="staffDetail" value="DispatchServlet">
                                                    <c:param name="btnAction" value="staffDetail" />
                                                    <c:param name="employee_name" value="${dto.employee_name}"/>
                                                </c:url> 
                                                <a href="${staffDetail}" class="border-black hover:border-b-2 text-black"> 
                                                    ${dto.employee_name}
                                                </a>                                 
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.gender}">
                                                    Male
                                                </c:if>
                                                <c:if test="${!dto.gender}">
                                                    Female
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employee_phone}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.departmentName}
                                            </td>        
                                            <td class="px-3 py-3">
                                                ${dto.role}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.status}">
                                                    <p class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                        Active
                                                    </p>
                                                </c:if>
                                                <c:if test="${!dto.status}">
                                                    <p class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                        Inactive
                                                    </p> 
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                <div class="flex gap-1">
                                                    <a 
                                                        class="text-[#0d6efd] py-1 px-2 rounded-md font-medium 
                                                        hover:bg-[#0d6efd30] transition-all" 
                                                        href="${staffDetail}"
                                                        title="Information of user"
                                                        >
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                                                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                                                        </svg>
                                                    </a>
                                                    <c:if test="${dto.status}">
                                                        <a 
                                                            class="text-[#dc3545] py-1 px-2 rounded-md font-medium 
                                                            hover:bg-[#dc354530] transition-all flex items-center justify-center" 
                                                            href="DispatchServlet?btnAction=Delete_StaffDetail&employee_id=${dto.employee_id}&employee_status=${dto.status}"
                                                            title="Delete user"
                                                            >
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                            </svg>
                                                        </a>
                                                    </c:if>

                                                </div>

                                            </td>
                                        </tr>
                                    </c:if>

                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:set var="result" value="${requestScope.LIST_STAFF_BY_NAME}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr 
                                    class="text-[#464646] text-lg font-semibold"
                                    >
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Gender</th>
                                    <th class="px-3 py-2 text-start">Phone Number</th>
                                    <th class="px-3 py-2 text-start">Department</th>                         
                                    <th class="px-3 py-2 text-start">Role</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                    <th class="px-3 py-2 text-start w-20">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}">
                                    <c:if test="${statusWorker == dto.status}">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                <c:url var="staffDetail" value="DispatchServlet">
                                                    <c:param name="btnAction" value="staffDetail" />
                                                    <c:param name="employee_name" value="${dto.employee_name}"/>
                                                </c:url> 
                                                <a href="${staffDetail}" class="border-black hover:border-b-2 text-black"> 
                                                    ${dto.employee_name}
                                                </a>                                 
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.gender}">
                                                    Male
                                                </c:if>
                                                <c:if test="${!dto.gender}">
                                                    Female
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employee_phone}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.departmentName}
                                            </td>        
                                            <td class="px-3 py-3">
                                                ${dto.role}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.status}">
                                                    <p class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                        Active
                                                    </p>
                                                </c:if>
                                                <c:if test="${!dto.status}">
                                                    <p class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                        Inactive
                                                    </p> 
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                <div class="flex gap-1">
                                                    <a 
                                                        class="text-[#0d6efd] py-1 px-2 rounded-md font-medium 
                                                        hover:bg-[#0d6efd30] transition-all" 
                                                        href="${staffDetail}"
                                                        title="Information of user"
                                                        >
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                                                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                                                        </svg>
                                                    </a>
                                                    <c:if test="${dto.status}">
                                                        <a 
                                                            class="text-[#dc3545] py-1 px-2 rounded-md font-medium 
                                                            hover:bg-[#dc354530] transition-all flex items-center justify-center" 
                                                            href="DispatchServlet?btnAction=Delete_StaffDetail&employee_id=${dto.employee_id}&employee_status=${dto.status}"
                                                            title="Delete user"
                                                            >
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                            </svg>
                                                        </a>
                                                    </c:if>

                                                </div>

                                            </td>
                                        </tr>
                                    </c:if>

                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:set var="result" value="${requestScope.LIST_STAFF_BY_DEPARTMENT}"/>
                    <c:if test="${not empty result}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead class="">
                                <tr 
                                    class="text-[#464646] text-lg font-semibold"
                                    >
                                    <th class="px-3 py-2 text-start">Name</th>
                                    <th class="px-3 py-2 text-start">Gender</th>
                                    <th class="px-3 py-2 text-start">Phone Number</th>
                                    <th class="px-3 py-2 text-start">Department</th>                         
                                    <th class="px-3 py-2 text-start">Role</th>
                                    <th class="px-3 py-2 text-start">Status</th>
                                    <th class="px-3 py-2 text-start w-20">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${result}">
                                    <c:if test="${statusWorker == dto.status}">
                                        <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                            <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                <c:url var="staffDetail" value="DispatchServlet">
                                                    <c:param name="btnAction" value="staffDetail" />
                                                    <c:param name="employee_name" value="${dto.employee_name}"/>
                                                </c:url> 
                                                <a href="${staffDetail}" class="border-black hover:border-b-2 text-black"> 
                                                    ${dto.employee_name}
                                                </a>                                 
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.gender}">
                                                    Male
                                                </c:if>
                                                <c:if test="${!dto.gender}">
                                                    Female
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.employee_phone}
                                            </td>
                                            <td class="px-3 py-3">
                                                ${dto.departmentName}
                                            </td>        
                                            <td class="px-3 py-3">
                                                ${dto.role}
                                            </td>
                                            <td class="px-3 py-3">
                                                <c:if test="${dto.status}">
                                                    <p class="text-sm text-[#52c41a] bg-[#f6ffed] border-2 border-[#b7eb8f] rounded-md w-fit py-[1px] px-[17px]">
                                                        Active
                                                    </p>
                                                </c:if>
                                                <c:if test="${!dto.status}">
                                                    <p class="text-sm text-[#ff4d4f] bg-[#fff2f0] border-2 border-[#ffccc7] rounded-md w-fit py-[1px] px-3">
                                                        Inactive
                                                    </p> 
                                                </c:if>
                                            </td>
                                            <td class="px-3 py-3 rounded-r-[0.25rem]">
                                                <div class="flex gap-1">
                                                    <a 
                                                        class="text-[#0d6efd] py-1 px-2 rounded-md font-medium 
                                                        hover:bg-[#0d6efd30] transition-all" 
                                                        href="${staffDetail}"
                                                        title="Information of user"
                                                        >
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                                                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                                                        </svg>
                                                    </a>
                                                    <c:if test="${dto.status}">
                                                        <a 
                                                            class="text-[#dc3545] py-1 px-2 rounded-md font-medium 
                                                            hover:bg-[#dc354530] transition-all flex items-center justify-center" 
                                                            href="DispatchServlet?btnAction=Delete_StaffDetail&employee_id=${dto.employee_id}&employee_status=${dto.status}"
                                                            title="Delete user"
                                                            >
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                            </svg>
                                                        </a>
                                                    </c:if>

                                                </div>

                                            </td>
                                        </tr>
                                    </c:if>

                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <script>
                        let currentUrl = window.location.href;
                        let urlParams = new URLSearchParams(currentUrl);
                        let status = urlParams.get("statusWorker") !== "false";

                        !status

                                ? document.getElementById("toggle-button").innerHTML = `
                        <input type="checkbox" id="check" class="sr-only peer" value="true" 
                        unchecked/>
                        <span for="check" class="w-[32px] h-[32px] bg-gray-500 absolute rounded-full left-1 top-1 peer-checked:bg-green-400
                        peer-checked:left-[69px] transition-all duration-500"></span>
                        <p class="absolute top-[6px] right-2 z-10 text-black font-medium">Inactive</p>
                        `

                                : document.getElementById("toggle-button").innerHTML = `
                        <input type="checkbox" id="check" class="sr-only peer" value="true" 
                        checked/>
                        <span for="check" class="w-[32px] h-[32px] bg-gray-500 absolute rounded-full left-1 top-1 peer-checked:bg-green-400
                        peer-checked:left-[69px] transition-all duration-500"></span>
                        <p class="absolute top-[6px] left-2 z-10 text-black font-medium">Active</p>
                        `;

                        function changeStatus() {
                            window.location.href = "/HRManagement/DispatchServlet?btnAction=Staff&statusWorker=" + !status;
                        }
                    </script>
                </div>
            </div>
        </section>

        <%@include file="/Layout/TailwindFooter.jsp" %>
    </body>
</html>
