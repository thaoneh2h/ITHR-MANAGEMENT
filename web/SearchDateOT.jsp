<%-- 
    Document   : SearchDateOT
    Created on : Jun 15, 2023, 9:55:19 AM
    Author     : 23030
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            if (user == null) {
                response.sendRedirect("/HRManagement"); 
            } 
        %>
        <script>
            function back() {
                window.location.href = "/HRManagement/DispatchServlet?btnAction=ShowOvertimeList";
            }
        </script>
        <%@include file="/Layout/Sidebar.jsp" %>
        <section class="pt-5 pl-1 sm:ml-64">
            <div class="mt-14 rounded-lg overflow-hidden">
                <div class="m-10 p-10 rounded-lg bg-[#82cfef10]"
                    style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;"
                >
                    <button onclick="back()" class="flex gap-2 items-center py-1 px-3 text-red-500 mt-5
                        hover:scale-105 hover:bg-[#dc354530] transition-all rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-arrow-90deg-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z" />
                        </svg>
                        Back
                    </button>
                    <p class="text-center text-3xl font-bold mb-10">
                        Overtime List <span class="text-teal-500">- Filtered</span> 
                    </p>
        
                    <c:set var="Date" value="${requestScope.MONTH}"/>
                    <c:set var="resultDate" value="${requestScope.SEARCH_DATE}"/>
                    
                    <form action="DispatchServlet" class="flex gap-3">
                        <select name="monthparam" onchange="toggleButton(this)" class="rounded-md p-1 cursor-pointer" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                            <option value="" disabled selected>Month: ${Date}</option>
                            <option value="01">January</option>
                            <option value="02">February</option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                        <input type="submit" value="SearchOTMonth" name="btnAction" id="myButton" disabled class="text-white bg-[#0d6efd] rounded-md px-2 cursor-pointer hover:text-[#0d6efd] hover:bg-[#dce7f9] border-2 border-[#0d6efd] transition-all font-medium" />
                        <script>
                            function toggleButton(selectElement) {
                                var button = document.getElementById("myButton");
                                if (selectElement.value === "") {
                                    button.disabled = true; // Disable the button if the placeholder option is selected
                                } else {
                                    button.disabled = false; // Enable the button for other selected options
                                }
                            }
                        </script>
                    </form>
                            
                    <c:if test="${not empty resultDate}">
                        <table class="w-full" style="border-collapse: separate !important; border-spacing: 0 10px;">
                            <thead>
                                <tr class="text-[#464646] text-lg font-semibold">
                                    <th class="px-3 py-2 text-start">No</th>
                                    <th class="px-3 py-2 text-start">Employee ID</th>
                                    <th class="px-3 py-2 text-start">Employee Name</th>
                                    <th class="px-3 py-2 text-start">Department ID</th>
                                    <th class="px-3 py-2 text-start">Role</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="displayedOT" value="" scope="request" />
                                
                                <c:forEach var="dto" items="${resultDate}" varStatus="loop">
                                
                                    <c:if test="${not displayedEmployees.contains(dto.employeeId)}">
                                        <c:set var="displayedEmployees" value="${displayedEmployees},${dto.employeeId}" scope="request" />
                                            <tr class="bg-white hover:shadow-md hover:bg-[#00000010]">
                                                <td class="px-3 py-3 rounded-l-[0.25rem]">
                                                    ${loop.count}   
                                                </td>
                                                <td class="px-3 py-3">
                                                    ${dto.employeeId}
                                                </td>
                                                <td class="px-3 py-3">
                                                    <c:url var="OTDetail" value="DispatchServlet">
                                                        <c:param name="btnAction" value="OTDetail" />
                                                        <c:param name="employee_name" value="${dto.employee_name}"/>
                                                        <c:param name="month" value="${Date}"/>
                                                    </c:url>
                                                    <a href="${OTDetail}" class="border-black hover:border-b-2 text-black"> 
                                                        ${dto.employee_name}
                                                    </a> 
                                                </td>
                                                <td class="px-3 py-3">
                                                    ${dto.department_id}
                                                </td>
                                                <td class="px-3 py-3">
                                                    ${dto.role}
                                                </td>   

                                            </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>

                    </c:if>
                    <c:if test="${empty resultDate}">
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
    </body>
</html>
